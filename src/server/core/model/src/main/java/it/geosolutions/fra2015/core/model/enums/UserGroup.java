package it.geosolutions.fra2015.core.model.enums;

/**
 *
 * @author francesco
 */
public enum UserGroup {
    GUEST,
    USER,
    SUPERUSER,
    ADMINISTRATOR;
    
    public boolean check(UserGroup ug) {
        return this.ordinal() <= ug.ordinal();
    } 
            
}
