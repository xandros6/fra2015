package it.geosolutions.fra2015.core.model.dao;

import it.geosolutions.fra2015.core.model.Country;

/**
 *    private Long id;
    private String name;
    private String tag;
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 */
public interface CountryDAO {
 
    public Long create(String name, String tag);
    
    public Country read(Long id);
    
    public void update(Country county);
    
    public void delete(Country country);
    
}
