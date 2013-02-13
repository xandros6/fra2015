/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.geosolutions.fra2015.server.dao;

import it.geosolutions.fra2015.server.model.survey.Entry;

/**
 *
 * @author marco
 */
public interface EntryDAO extends RestrictedGenericDAO<Entry>{

    public Entry findByName(String entryId);
    
}
