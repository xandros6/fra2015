/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2007-2013 GeoSolutions S.A.S.
 *  http://www.geo-solutions.it
 *
 *  GPLv3 + Classpath exception
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package it.geosolutions.fra2015.mvc.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;

import it.geosolutions.fra2015.entrypoint.SurveyServiceEntryPoint;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;

import org.apache.commons.beanutils.BeanToPropertyValueTransformer;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Lorenzo Natali
 * 
 */
@Controller
@RequestMapping("/users")
public class UsersController {
	
	protected static Logger logger = Logger.getLogger(UsersController.class);
	
	protected static final LinkedHashMap<String, String> roles = new LinkedHashMap<String, String>();
	static{
		roles.put("contributor","Contributor");
		roles.put("reviewer","Reviewer");
		roles.put("editor","Review Editor");
		roles.put("validator","Country Validator");
	}
	
	@Autowired
	private UserService userService;

	@Autowired
	private SurveyService surveyService;

	private int pagesize = 10;

	Logger LOGGER = Logger.getLogger(UsersController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getUsers(ModelMap model) {
		model.addAttribute("page", 0);
		model.addAttribute("context", "users");
		model.addAttribute("users", this.getPage(0));
		boolean next = this.getPage(1).size() > 0;
		model.addAttribute("next", next?1:-1);
		model.addAttribute("prev", -1);
		return "admin";

	}
	
	@RequestMapping(value = "/save/{page}", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") User user, @PathVariable(value = "page") Integer page, ModelMap model) {
		model.addAttribute("page", page);
		model.addAttribute("context", "users");
		model.addAttribute("messageType", "success");
		model.addAttribute("messageText", "User saved successfully");
		try{
			if(user.getId() != null && userService.get(user.getId()) !=null){
				userService.update(user);
			}else{
				userService.insert(user);
			}
		}catch (Exception e) {
			logger.error(e.getMessage(),e);
			model.addAttribute("messageType", "error");
			model.addAttribute("messageText", "Fails to save user");
		}
		return "forward:/users/"+page;
	}
	
	@RequestMapping(value = "/delete/{userId}/{page}", method = RequestMethod.GET)
	public String deleteUser(@PathVariable(value = "userId") Integer userId, @PathVariable(value = "page") Integer page, ModelMap model) {
		model.addAttribute("page", page);
		model.addAttribute("context", "users");
		model.addAttribute("messageType", "success");
		model.addAttribute("messageText", "User deleted successfully");
		try{
			if(userId != null){
				User user = userService.get(userId);
				userService.delete(user);
			}
		}catch (Exception e) {
			logger.error(e.getMessage(),e);
			model.addAttribute("messageType", "error");
			model.addAttribute("messageText", "Fails to delete user");
		}
		return "forward:/users/"+page;
	}
	
	@RequestMapping(value = "/editor/{userId}/{page}", method = RequestMethod.GET)
	public String getUserEditor(@PathVariable(value = "userId") Integer userId, @PathVariable(value = "page") Integer page, ModelMap model){
		//Add countries code to page model formatted as CSV string
		BeanToPropertyValueTransformer transformer = new BeanToPropertyValueTransformer( "iso3" );
		Collection<String> countriesIso3 = CollectionUtils.collect( surveyService.getCountries(), transformer );
		String joined = "\"" + StringUtils.join(countriesIso3,"\",\"") + "\"";
		model.addAttribute("countriesIso3", joined);
		User user = new User();
		//Retrive user informations
		if(userId > -1){
			user = userService.get(userId);			
		}
		model.addAttribute("roles", roles);
		model.addAttribute("command", user);
		model.addAttribute("page", page);
		return "admin/userEditor";
	}
			

	@RequestMapping(value = "/{page}")
	public String getUsersPage(@PathVariable(value = "page") int page,
			ModelMap model) {

		if (page == 0) {
			return getUsers(model);
		}
		//add context for view
		model.addAttribute("context", "users");
		List<User> users=this.getPage(page);
		model.addAttribute("page", page);
		//check prev and next pages presence
		boolean next =false;
		if(users !=null){
			next =  users.size()<pagesize ? false : this.getPage(page + 1).size() > 0;
		}
		boolean previous =this.getPage(page - 1).size() > 0;
		model.addAttribute("next", next ? page + 1 : -1);
		model.addAttribute("prev", previous ? page - 1 : -1);
		model.addAttribute("users", users);


		return "admin";

	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	private List<User> getPage(int page) {
		if (userService == null) {
			return null;
		}
		try {
			List<User> users= new ArrayList<User>();
			for(User user : userService.getAll(page, pagesize)){
				if("admin".equals(user.getRole())){//check admin
					continue;
				}
				user.setRole(roles.get(user.getRole()));
				users.add(user);
			}
			return users;
		} catch (BadRequestServiceEx e) {

			LOGGER.error(e.getMessage(), e);
		}
		return null;

	}
}
