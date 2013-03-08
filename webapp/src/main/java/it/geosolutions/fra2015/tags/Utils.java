package it.geosolutions.fra2015.tags;

import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.OperationWR;

public class Utils {
static OperationWR validateOperation(String operation){
        
        OperationWR op = null;
        if(operation == null || operation.isEmpty()){
            return OperationWR.WRITE;
        }
        try{
            op = OperationWR.valueOf(operation);
        }
        catch(Exception e){
            return null;
        }
        return op;
    }

}
