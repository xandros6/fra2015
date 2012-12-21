/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.services;

import com.googlecode.genericdao.search.Search;
import it.geosolutions.fra2015.server.dao.TokenDAO;
import it.geosolutions.fra2015.server.dao.UserDAO;
import it.geosolutions.fra2015.server.model.user.Token;
import it.geosolutions.fra2015.server.model.user.User;
import it.geosolutions.fra2015.services.exception.BadRequestServiceEx;
import it.geosolutions.fra2015.services.exception.IllegalAccessServiceException;
import it.geosolutions.fra2015.services.exception.NotFoundServiceEx;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import org.apache.log4j.Logger;

/**
 *
 * @author marco
 */
public class AuthenticationServiceImpl implements AuthenticationService {

    private static final Logger LOGGER = Logger.getLogger(AuthenticationServiceImpl.class);
    private TokenDAO tokenDAO;
    private UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public void setTokenDAO(TokenDAO tokenDAO) {
        this.tokenDAO = tokenDAO;
    }

    @Override
    public Token login(String username, String password) throws BadRequestServiceEx, NotFoundServiceEx, IllegalAccessServiceException {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("Authenticating User ... ");
        }

        if (username == null) {
            throw new BadRequestServiceEx("Username type must be specified !");
        }
        if (password == null) {
            throw new BadRequestServiceEx("Username type must be specified !");
        }
        
        

        Search search = new Search(User.class);
        search.addField("password", password);
        search.addField("username", username);
        List<User> users = userDAO.search(search);

        if (users.isEmpty()) {
            if (LOGGER.isDebugEnabled()) {
                LOGGER.debug("Authentication failed: username or password not valid");
            }
            throw new IllegalAccessServiceException("Authentication failed: username or password not valid");
        }

        User user = users.get(0);
        Token token = new Token();
        token.setValue( UUID.randomUUID().toString() );
        token.setUser(user);
        token.setExpiringDate(calculateExpiringDate(new Date()));

        tokenDAO.persist(token);

        return token;
    }

    @Override
    public Boolean verify(String value) throws BadRequestServiceEx, NotFoundServiceEx {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("Verify token ... ");
        }

        if (value == null) {
            throw new BadRequestServiceEx("Username type must be specified !");
        }
        Search search = new Search(User.class);
        search.addField("token", value);
        List<Token> tokens = tokenDAO.search(search);
        if (!tokens.isEmpty()) {
            Token token = tokens.get(0);
            Date expiring = token.getExpiringDate();
            Date today = new Date();
            if (expiring.getTime() >= today.getTime()) {
                // touch current token
                token.setExpiringDate(calculateExpiringDate(today));
                return true;
            } else {
                if (LOGGER.isDebugEnabled()) {
                    LOGGER.debug("Invalid token ... ");
                }
            }
        } else {
            if (LOGGER.isDebugEnabled()) {
                LOGGER.debug("Token not found ... ");
            }
        }
        return false;
    }

    @Override
    public Boolean invalidate(String value) throws BadRequestServiceEx, NotFoundServiceEx {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("Invalidating token ... ");
        }

        if (value == null) {
            throw new BadRequestServiceEx("Username type must be specified !");
        }
        Search search = new Search(User.class);
        search.addField("token", value);
        List<Token> tokens = tokenDAO.search(search);
        if (!tokens.isEmpty()) {
            Token token = tokens.get(0);
            Date expiring = token.getExpiringDate();
            Date today = new Date();
            if (expiring.getTime() >= today.getTime()) {
                // touch current token
                token.setExpiringDate( today );
                return true;
            } else {
                if (LOGGER.isDebugEnabled()) {
                    LOGGER.debug("Token already invalidated ... ");
                }
            }
        } else {
            if (LOGGER.isDebugEnabled()) {
                LOGGER.debug("Token not found ... ");
            }
        }
        return false;
    }

    private Date calculateExpiringDate(Date currentDate) {
        Calendar c = Calendar.getInstance();
        c.setTime(currentDate);
        c.add(Calendar.DATE, 1);
        return c.getTime();
    }
}
