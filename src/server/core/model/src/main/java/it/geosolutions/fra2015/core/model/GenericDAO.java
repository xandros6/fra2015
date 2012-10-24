package it.geosolutions.fra2015.core.model;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 */
public interface GenericDAO <E, ID extends Serializable> {
    
    public void create(E entity);
    
    public E read(ID id);
    
    public List<E> readAll();
    
    public E update(E entity);
    
    public void delete(E entity);
    
}
