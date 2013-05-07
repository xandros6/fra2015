package it.geosolutions.fra2015.utils;

import java.util.HashMap;
import java.util.Map;

import antlr.StringUtils;

/**
 * Formats a status change message. A sample status is like:
 * status=compiled % message=asd % coverage=null % reviewerSubmit=null % lastContributorSubmission=1367955603792 % lastSurveyReview=null % previousSurveyReview=null % revisionNumber=nullstaaaa
 * @author Lorenzo Natali
 *
 */
public class FormatUtils {
    public static Map<String,String> formatStatusChange(String statusMessage){
        String[] elements= statusMessage.split(" % ");
        Map<String,String> attrs = new HashMap<String,String>();
        for(int i = 0; i < elements.length;i++){
            String[] splittedEl = elements[i].split("=");
            String key = splittedEl[0];
            String value = splittedEl[1];
            attrs.put(key,value);
        }
        return attrs;
    }
}
