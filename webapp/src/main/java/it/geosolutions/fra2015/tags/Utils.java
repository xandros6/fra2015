package it.geosolutions.fra2015.tags;

import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.OperationWR;

import org.apache.log4j.Logger;

public class Utils {
    
    private static final Logger LOGGER = Logger.getLogger(Utils.class);
    
	static OperationWR validateOperation(String operation) {

		OperationWR op = null;
		if (operation == null || operation.isEmpty()) {
			return OperationWR.WRITE;
		}
		try {
			op = OperationWR.valueOf(operation);
		} catch (Exception e) {
			return null;
		}
		return op;
	}
	
	public static boolean genericEnumValidator(Class enumerator, String valueToCheck){
	        
	        try{
	            Enum.valueOf(enumerator, valueToCheck);
	        }
	        catch (Exception e){
	            LOGGER.error("The value '" + valueToCheck +"' don't match with domain specified by " + enumerator);
	            return false;
	        }
	        return true;
	    } 
}
