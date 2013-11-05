/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2007-2012 GeoSolutions S.A.S.
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
package it.geosolutions.fra2015.mvc.controller.utils;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

/**
 * @author DamianoG
 * 
 */
public class FlashAttributesHandler {

    private static final String MESSAGE_TYPE = "messageType";

    private static final String MESSAGE_CODE = "messageCode";

    private static final String MESSAGE_TIMEOUT = "messageTimeout";

    private static final String MESSAGE_TRAILCODE = "messageTrailCode";
    
    private static final String NOT_LOCALIZED_MESSAGE = "notLocalizedMessage";
    
    private static final String CONFIRMED_ATTRIBUTE = "confirmedAttribute";

    public static void addFlashAttribute(HttpSession session, String messageType,
            String messageCode, Integer messageTimeout, String messageTrailCode, String notLocalizedMessage) {

        session.removeAttribute(MESSAGE_TYPE);
        session.removeAttribute(MESSAGE_CODE);
        session.removeAttribute(MESSAGE_TIMEOUT);
        session.removeAttribute(MESSAGE_TRAILCODE);
        session.removeAttribute(NOT_LOCALIZED_MESSAGE);
        session.removeAttribute(CONFIRMED_ATTRIBUTE);

        session.setAttribute(MESSAGE_TYPE, messageType);
        session.setAttribute(MESSAGE_CODE, messageCode);
        session.setAttribute(MESSAGE_TIMEOUT, messageTimeout);
        session.setAttribute(MESSAGE_TRAILCODE, messageTrailCode);
        session.setAttribute(NOT_LOCALIZED_MESSAGE, notLocalizedMessage);

    }

    public static void copyToModel(HttpSession session, Model model) {

        String type = (String) session.getAttribute(MESSAGE_TYPE);
        if (type != null) {
            model.addAttribute(MESSAGE_TYPE, type);
        }
        String code = (String) session.getAttribute(MESSAGE_CODE);
        if (code != null) {
            model.addAttribute(MESSAGE_CODE, code);
        }
        Integer timeout = (Integer) session.getAttribute(MESSAGE_TIMEOUT);
        if (timeout != null) {
            model.addAttribute(MESSAGE_TIMEOUT, timeout);
        }
        String trailcode = (String) session.getAttribute(MESSAGE_TRAILCODE);
        if (trailcode != null) {
            model.addAttribute(MESSAGE_TRAILCODE, trailcode);
        }
        String notLocalizedMessage = (String) session.getAttribute(NOT_LOCALIZED_MESSAGE);
        if (notLocalizedMessage != null) {
            model.addAttribute(NOT_LOCALIZED_MESSAGE, notLocalizedMessage);
        }

        session.removeAttribute(MESSAGE_TYPE);
        session.removeAttribute(MESSAGE_CODE);
        session.removeAttribute(MESSAGE_TIMEOUT);
        session.removeAttribute(MESSAGE_TRAILCODE);
        session.removeAttribute(NOT_LOCALIZED_MESSAGE);
    }

	public static void addFlashConfirmedAttribute(HttpSession session,
			String country) {
        session.removeAttribute(CONFIRMED_ATTRIBUTE);
        session.setAttribute(CONFIRMED_ATTRIBUTE, country);
	}

}
