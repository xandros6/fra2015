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

import java.util.List;

import it.geosolutions.fra2015.entrypoint.SurveyServiceEntryPoint;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Lorenzo Natali
 * 
 */
@Controller
@RequestMapping("/users")
public class UsersController {
	@Autowired
	private UserService userService;

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
		// TODO
		// model.addAttribute("message", "Spring 3 MVC dummy example");
		return "admin";

	}
	
	@RequestMapping(value = "/{page}", method = RequestMethod.GET)
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
			List<User> users= userService.getAll(page, pagesize);
			for(User user : users){
				if("admin".equals(user.getRole())){//check admin
					users = userService.getAll(page, pagesize);
					users.remove(user);
					break;
				}
			}
			return users;
		} catch (BadRequestServiceEx e) {

			LOGGER.error(e.getMessage(), e);
		}
		return null;

	}
}
