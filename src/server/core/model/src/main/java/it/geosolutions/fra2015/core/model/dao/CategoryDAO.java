package it.geosolutions.fra2015.core.model.dao;

import it.geosolutions.fra2015.core.model.Category;

/**

 * 
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 */
public interface CategoryDAO {
    
    public Long create(String name, String definition, Category parent);
    
    public Category read(Long id);
    
    public void update(Category category);
    
    public void delete(Category category);
    
}
