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

import it.geosolutions.fra2015.mvc.model.Pagination;
import it.geosolutions.fra2015.server.model.survey.Country;
import it.geosolutions.fra2015.server.model.survey.Question;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.SurveyService;
import it.geosolutions.fra2015.services.UserService;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.model.UserDTO;
import it.geosolutions.fra2015.services.model.UserFilter;
import it.geosolutions.fra2015.services.utils.UserUtil;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

/**
 * @author Lorenzo Natali
 * 
 */
@Controller
@RequestMapping("/users")
@SessionAttributes("userFilter")
public class UsersController {

	protected static Logger logger = Logger.getLogger(UsersController.class);

	protected static final LinkedHashMap<String, String> roles = new LinkedHashMap<String, String>();
	static{
		roles.put("","");
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

	@RequestMapping(value = "")
	public String getUsers(ModelMap model) {
		return "redirect:/users/0";
	}

	@RequestMapping(value = "/save/{page}", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") UserDTO userDto, @PathVariable(value = "page") Integer page, ModelMap model) {
		model.addAttribute("page", page);
		model.addAttribute("context", "users");
		model.addAttribute("messageType", "success");
		model.addAttribute("messageText", "User saved successfully");

		User user = new User();
		userDto.copyTo(user);

		try{
			if(!userDto.getQuestionsStr().isEmpty()){
				String[] qas = userDto.getQuestionsStr().split(",");
				for(String qa : qas){
					Question q = surveyService.findQuestion(Long.parseLong(qa));
					user.getQuestions().add(q);
				}
			}
			if(!userDto.getSelCountries().isEmpty()){
				String[] cos = userDto.getSelCountries().split(",");
				for(String co : cos){
					if(!co.isEmpty()){
						Country c = surveyService.findCountry(Long.parseLong(co));
						user.getCountriesSet().add(c);
					}
				}
			}

			if(userDto.getId() != null && userService.get(userDto.getId()) !=null){
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

	@RequestMapping(value = "/save/{page}", method = RequestMethod.GET)
	public String reloadSavedUser(@PathVariable(value = "page") Integer page, ModelMap model) {
		return "redirect:/users/"+page;
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

	@RequestMapping(value = "/filter", method = RequestMethod.GET)
	public String getUserFilter(ModelMap model){
		model.addAttribute("roles", roles);
		UserFilter userFilter = (model.get("userFilter")!=null ?  (UserFilter) model.get("userFilter") : new UserFilter());
		model.addAttribute("formUserFilter", userFilter);
		return "admin/userFilter";
	}

	@RequestMapping(value = "/updateFilter", method = RequestMethod.POST)
	public String updateFilter(@ModelAttribute("formUserFilter") UserFilter formUserFilter, ModelMap model , SessionStatus sessionStatus) {

		LOGGER.debug("updating filter by " + formUserFilter);

		model.addAttribute("context", "users");
		model.addAttribute("messageType", "success");
		model.addAttribute("messageText", "User filter updated");
		model.addAttribute("userFilter", formUserFilter);
		return "forward:/users/0";
	}

	@RequestMapping(value = "/updateFilter", method = RequestMethod.GET)
	public String reloadFilter(ModelMap model , SessionStatus sessionStatus) {
		return "redirect:/users/0";
	}

	@RequestMapping(value = "/editor/{userId}/{page}", method = RequestMethod.GET)
	public String getUserEditor(@PathVariable(value = "userId") Long userId, @PathVariable(value = "page") Integer page, ModelMap model){
		User user = new User();
		//Retrive user informations
		if(userId > -1){
			user = userService.get(userId);			
		}
		Set<Country> set = user.getCountriesSet();
		SortedSet<Country> sorted=new TreeSet<Country>(new Comparator<Country>(){

			@Override
			public int compare(Country a, Country b) {
				return a.getIso3().compareTo(b.getIso3());
			}

		});
		sorted.addAll(set);
		user.setCountriesSet(sorted);

		//Add countries code to page model formatted as CSV string
		List<Question> questions = surveyService.getQuestions();
		//Check user question
		Set<Question> userQuestions = user.getQuestions();
		if(!userQuestions.isEmpty()){
			BeanToPropertyValueTransformer questionsTransformer = new BeanToPropertyValueTransformer( "id" );
			Collection<Long> userQuestionsId = CollectionUtils.collect( userQuestions, questionsTransformer );
			for(Question q : questions){
				if(userQuestionsId.contains(q.getId())){
					q.setSelected(true);
				}
			}
		}
		model.addAttribute("questions", questions);


		UserDTO userDTO = new UserDTO();
		userDTO.copyFrom(user);

		BeanToPropertyValueTransformer transformer = new BeanToPropertyValueTransformer( "id" );
		Collection<String> countriesId = CollectionUtils.collect( user.getCountriesSet(), transformer );
		String joined = StringUtils.join(countriesId,",");

		userDTO.setSelCountries(joined);

		model.addAttribute("roles", roles);
		model.addAttribute("command", userDTO);
		model.addAttribute("page", page);
		return "admin/userEditor";
	}


	@RequestMapping(value = "/{page}")
	public String getUsersPage(@PathVariable(value = "page") int page,
			ModelMap model) {
		UserFilter userFilter = (UserFilter) model.get("userFilter");
		//add context for view
		model.addAttribute("countries", surveyService.getCountries());
		model.addAttribute("context", "users");

		LOGGER.debug("filtering by " + userFilter);

		List<UserDTO> users = this.getPage(page, userFilter);
		if(users.isEmpty() && page > 0){
			return "redirect:/users/"+(page-1);
		}
		model.addAttribute("page", page);
		//check prev and next pages presence
		long totalUser = 0;
		try {
			totalUser = userService.getCountFiltered(userFilter);
		}catch (BadRequestServiceEx e) {
			LOGGER.error(e.getMessage(), e);
		}
		int totalPage = (int) (Math.ceil(((double)totalUser)/pagesize));
		Pagination pagination = new Pagination();
		pagination.setCurrentPage(page);
		if((page+1) < totalPage){
			pagination.setLastPage(totalPage);
		}
		if((page+1)*pagesize < totalUser){
			pagination.setNext1(page+1);
		}
		if((page+2)*pagesize < totalUser){
			pagination.setNext2(page+2);
		}
		if(page > 0 ){
			pagination.setFirstPage(0);
			pagination.setPrev1(page-1);
		}
		if((page-1) > 0 ){
			pagination.setPrev2(page-2);
		}
		model.addAttribute("pagination", pagination);
		model.addAttribute("users", users);
		model.addAttribute("isFiltered",isFiltered(userFilter));
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

	private List<UserDTO> getPage(int page, UserFilter userFilter) {
		if (userService == null) {
			return null;
		}
		try {
			List<UserDTO> ret = new ArrayList<UserDTO>(pagesize);
			for(User user : userService.getAll(page, pagesize,userFilter)){
				UserDTO dto = new UserDTO();
				dto.copyFrom(user);
				dto.setRole(roles.get(user.getRole())); // translate role string
				dto.setSelCountries(UserUtil.getSpacedIso3(user,true));

				ret.add(dto);
			}
			return ret;

		} catch (BadRequestServiceEx e) {
			LOGGER.error(e.getMessage(), e);
		}
		return null;

	}

	private Boolean isFiltered(UserFilter userFilter){
		Boolean isFiltered = false;
		if(userFilter != null){
			if(StringUtils.isNotBlank(userFilter.getUsername()) 
					|| StringUtils.isNotBlank(userFilter.getName())
					|| StringUtils.isNotBlank(userFilter.getRole())
					|| StringUtils.isNotBlank(userFilter.getEmail())
					|| StringUtils.isNotBlank(userFilter.getCountries())){
				isFiltered = true;
			}
		}
		return isFiltered;
	}
}
