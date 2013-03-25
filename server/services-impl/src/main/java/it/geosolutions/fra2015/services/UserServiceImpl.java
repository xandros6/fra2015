/*
 *  Copyright (C) 2007 - 2012 GeoSolutions S.A.S.
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
package it.geosolutions.fra2015.services;

import com.googlecode.genericdao.search.Filter;
import com.googlecode.genericdao.search.Search;
import com.googlecode.genericdao.search.SearchFacade;
import com.googlecode.genericdao.search.hibernate.HibernateSearchFacade;

import it.geosolutions.fra2015.server.dao.UserDAO;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

/**
 * Class UserServiceImpl.
 *
 * @author Tobia di Pisa (tobia.dipisa at geo-solutions.it)
 * @author ETj (etj at geo-solutions.it)
 */
public class UserServiceImpl implements UserService {

    private static final Logger LOGGER = Logger.getLogger(UserServiceImpl.class);
    private UserDAO userDAO;

    /**
     * @param userDAO the userDAO to set
     */
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    /* (non-Javadoc)
     * @see it.geosolutions.fra2015.services.UserService#insert(it.geosolutions.fra2015.server.model.user.User)
     */
    @Override
    public User insert(User user) throws BadRequestServiceEx {
//        if (LOGGER.isDebugEnabled()) {
//            LOGGER.debug("Persisting " + user);
//        }

        if (user == null) {
            throw new BadRequestServiceEx("Missing user info");
        }

        String password = "" + user.getNewPassword();
        if ( password != null ){
            // TODO encode password: user @prepersist in model bean
            user.setPassword( password );
        }
        
        userDAO.persist(user);

        return user;
    }

    /* (non-Javadoc)
     * @see it.geosolutions.fra2015.services.UserService#update(it.geosolutions.fra2015.server.model.user.User)
     */
    @Override
    public long update(User user) throws NotFoundServiceEx, BadRequestServiceEx {

        User orig = userDAO.find(user.getId());

        if (orig == null) {
            throw new NotFoundServiceEx("User not found " + user.getId());
        }

        String password = user.getNewPassword();
        if ( password != null && !password.isEmpty() ){
            // TODO encode password
            user.setPassword( password );
        }else{
			user.setPassword( orig.getPassword() );
		}        
        
        userDAO.merge(user);

        return user.getId();
    }


    /* (non-Javadoc)
     * @see it.geosolutions.fra2015.services.UserService#get(long)
     */
    @Override
    public User get(long id) {
        User user = userDAO.find(id);
        // CHECKME: shouldnt we throw a NotFound when user not found?
        return user;
    }

    /* (non-Javadoc)
     * @see it.geosolutions.fra2015.services.UserService#get(java.lang.String)
     */
    @Override
    public User get(String name) throws NotFoundServiceEx {
        Search searchCriteria = new Search(User.class);
        //DamianoG 05/03/2013 WHy search by name??????? set the search by username without think to side effects...
        //searchCriteria.addFilterEqual("name", name);
        searchCriteria.addFilterEqual("username", name);        

        List<User> users = userDAO.search(searchCriteria);
        if (!users.isEmpty()) {
            return users.get(0);
        } else {
            throw new NotFoundServiceEx("User not found with name: " + name);
        }
    }

    /* (non-Javadoc)
     * @see it.geosolutions.fra2015.services.UserService#delete(long)
     */
    @Override
    public void delete(User user) {
        userDAO.remove(user);
    }

    @Override
    public void deleteById(Long id) {
        userDAO.removeById(id);
    }

    /* (non-Javadoc)
     * @see it.geosolutions.fra2015.services.UserService#getAll(java.lang.Integer, java.lang.Integer)
     */
    @Override
    public List<User> getAll(Integer page, Integer entries, User userFilter) throws BadRequestServiceEx {

        Search searchCriteria = getSearchCriteria(page, entries, userFilter);  
        
        searchCriteria.addSortAsc("name");

        List<User> found = userDAO.search(searchCriteria);

        return found;
    }
    
    @Override
    public long getCountFiltered(User userFilter) throws BadRequestServiceEx {
    	Search searchCriteria = getSearchCriteria(null, null, userFilter);  
    	 return userDAO.count(searchCriteria);
    }
    
    private Search getSearchCriteria(Integer page, Integer entries, User userFilter) throws BadRequestServiceEx{
    	 if (((page != null) && (entries == null)) || ((page == null) && (entries != null))) {
             throw new BadRequestServiceEx("Page and entries params should be declared together.");
         }

         Search searchCriteria = new Search(User.class);        
         
         searchCriteria.addFilter(Filter.notEqual("role", "admin"));
         
         if(userFilter != null){
         	if(StringUtils.isNotBlank(userFilter.getUsername()))
         		searchCriteria.addFilter(Filter.ilike("username", "%"+userFilter.getUsername()+"%"));
         	if(StringUtils.isNotBlank(userFilter.getName()))
         		searchCriteria.addFilter(Filter.ilike("name","%"+userFilter.getName()+"%"));        	
         	if(StringUtils.isNotBlank(userFilter.getRole()))
         		searchCriteria.addFilter(Filter.equal("role", userFilter.getRole()));        	
         	if(StringUtils.isNotBlank(userFilter.getSelCountries()))
         		searchCriteria.addFilterSome("countriesSet", Filter.equal("id", userFilter.getSelCountries()));
         	if(StringUtils.isNotBlank(userFilter.getEmail()!=null?userFilter.getEmail().trim():null))
         		searchCriteria.addFilter(Filter.ilike("email", "%"+userFilter.getEmail()+"%"));
         }
         
         if (page != null) {
             searchCriteria.setMaxResults(entries);
             searchCriteria.setPage(page);
         }
         
         return searchCriteria;
    }
    

    /* (non-Javadoc)
     * @see it.geosolutions.fra2015.services.UserService#getCount(java.lang.String)
     */
    @Override
    public long getCount(String nameLike) {

        Search searchCriteria = new Search(User.class);

        if (nameLike != null) {
            searchCriteria.addFilterILike("name", nameLike);
        }

        return userDAO.count(searchCriteria);
    }

    @Override
    public long getCount() {
        return getCount(null);
    }
}
