/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2007-2013 GeoSolutions S.A.S.
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

import it.geosolutions.fra2015.mvc.controller.utils.ControllerServices.Profile;
import it.geosolutions.fra2015.server.model.survey.Status;
import it.geosolutions.fra2015.server.model.user.User;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.apache.log4j.Logger;

/**
 * Utility Class for status. Wraps various checks for Status, if the status is
 * The String or is the Status object. Provides allowed Values for status
 * and provides utility methods to get the status Locale Code.
 * 
 * Also provide utility methods for manage the reviewersubmit field.
 * 
 * @author Lorenzo Natali
 * @author Tobia Di Pisa at tobia.dipisa@geo-solutions.it
 * 
 */
public final class StatusUtils {
    
    private static final Logger LOGGER = Logger.getLogger(StatusUtils.class);
    
    public static final String EMPTY = "empty";

    public static final String IN_PROGRESS = "inprogress";

    public static final String COMPILED = "compiled";

    public static final String PENDING_FIX = "pendingfix";
 
    public static final String UNDER_REVIEW = "underreview";

    //public static final String REVIEW_COMPLETED = "reviewcompleted";

    //public static final String REVIEW_EDITING = "reviewediting";

    public static final String COMPLETED = "completed";

    public static final String ACCEPTED = "accepted";
    
    public static final String REVIEWER_SEPARATOR = ";";

    /**
     * Check if the status is one of the submit allowed (or generally updatable by the contributor)
     * 
     * @param s the status
     * @return true if the contributor can submit the status, false otherwise
     */
    public static boolean isSubmitAllowed(Status s) {
        return isInProgress(s) || isPendingFix(s) || isCompiled(s) || isEmpty(s);
    }
    
    public static boolean isSubmitAllowed(String s) {
        return isInProgress(s) || isPendingFix(s) || isCompiled(s) || isEmpty(s);
    }
    
    /**
     * Check if the status is one of the submit allowed by reviewer
     * 
     * @param s the status
     * @return true if the contributor can submit the status, false otherwise
     */
    public static boolean isSubmitAllowedByReviewer(String s, Profile p) {
        return  isCompiled(s) || isUnderReview(s);
        
    }
    
    /**
     * Check if the status is one of the submit allowed by reviewerEditor
     * 
     * @param s the status
     * @return true if the contributor can submit the status, false otherwise
     */
    public static boolean isSubmitAllowedByReviewerEditor(Status s) {
        return  isUnderReview(s);
        
    }
    
    /**
     * Returns locale code for a Status object
     * 
     * @param s
     * @return
     */
    public static String getStatusLocaleCode(Status s) {
        if(isValidStatus(s)){
            return "survey.status." + s.getStatus();
        }else return "survey.status.unknown";
    }

    /**
     * return locale code for the status string
     * 
     * @param s the string
     * @return
     */
    public static String getStatusLocaleCode(String s) {
        if(isValidStatus(s)){
            return "survey.status." + s;
        }else return "survey.status.unknown";
    }
    
    /**
     * Add a reviewer to the list of reviewers that has already submit their review
     * @param user
     * @param status
     * @return true if the reviewer is added false if the reviewer was already added to the list
     */
    public static boolean addReviewerToReviewerSubmit(User user, Status status){
        if(user.getRole().equalsIgnoreCase(Profile.REVIEWER.toString())){
            String oldList = status.getReviewerSubmit();
            oldList = (oldList == null || oldList.equals("null"))?"":oldList;
            String[] oldListArray = oldList.split(REVIEWER_SEPARATOR);
            if(Arrays.asList(oldListArray).contains(user.getUsername())){
                return false;
            }
            oldList = oldList + REVIEWER_SEPARATOR + user.getUsername();
            status.setReviewerSubmit(oldList);
            return true;
        }
        LOGGER.error("Provided user '" + user.getUsername()+ "' is not a Reviewer");
        return false;
    }
    
    public static boolean updateRevision(Status status){        
        Long lastReview = (status.getLastSurveyReview() != null)?status.getLastSurveyReview():0;
        Integer revNumber = (status.getRevisionNumber() != null)?status.getRevisionNumber():0;
        status.setPreviousSurveyReview(lastReview);
        status.setLastSurveyReview(System.currentTimeMillis());
        status.setRevisionNumber(revNumber+1);
        return true;
    }
    
    /**
     * Empty the list of reviewers that has already subit their review
     * 
     * @param user
     * @param status
     */
    public static void emptyReviewerSubmit(User user, Status status){
        if(user.getRole().equalsIgnoreCase(Profile.REVIEWER.toString())){
            status.setReviewerSubmit("");
            return;
        }
        LOGGER.error("Provided user '" + user.getUsername()+ "' is not a Reviewer");
    }
    
    /**
     * Get the list of reviewers that has already subit their review as a List
     * 
     * @param status
     * @return
     */
    public static List<String> getReviewerSubmit(Status status){
        String oldList = status.getReviewerSubmit();
        List<String> returnList = new ArrayList<String>();
        if(oldList!=null){
            String[] tmplList = oldList.split(REVIEWER_SEPARATOR);
            returnList = Arrays.asList(tmplList);
        }
        return returnList;
    }
    /**
     * Return true if a contributor can edit in this status
     * @param s the status
     * @return
     */
    public static boolean isContributorEditable(String s) {
        // TODO Auto-generated method stub
        return isEmpty(s) || isInProgress(s) || isCompiled(s)|| isPendingFix(s);
    }
    /**
     * Return true if a reviewer can edit in this status
     * @param s the status
     * @return
     */
    public static boolean isReviewerEditable(String s){
        return isCompiled(s) || isUnderReview(s);
    }
    
    /**
     * Return true if a review editor can edit in this status
     * @param s the status
     * @return
     */
    public static boolean isReviewEditorEditable(String s){
        return isCompiled(s) || isUnderReview(s);
    }
    
    public static boolean isValidStatus(Status s) {

        return isAccepted(s) || isCompiled(s) || isCompleted(s) || isEmpty(s) || isInProgress(s)
                || isPendingFix(s) /*|| isReviewCompleted(s) || isReviewEditing(s)*/
                || isUnderReview(s);

    }
    public static boolean isValidStatus(String s) {

        return isAccepted(s) || isCompiled(s) || isCompleted(s) || isEmpty(s) || isInProgress(s)
                || isPendingFix(s) /*|| isReviewCompleted(s) || isReviewEditing(s)*/
                || isUnderReview(s);

    }

    public static boolean isEmpty(Status s) {
        if (s != null) {
            return EMPTY.equals(s.getStatus());
        }
        return false;
    }

    public static boolean isInProgress(Status s) {
        if (s != null) {
            return IN_PROGRESS.equals(s.getStatus());
        }
        return false;
    }

    public static boolean isCompiled(Status s) {
        if (s != null) {
            return COMPILED.equals(s.getStatus());
        }
        return false;
    }

    public static boolean isPendingFix(Status s) {
        if (s != null) {
            return PENDING_FIX.equals(s.getStatus());
        }
        return false;
    }

    public static boolean isUnderReview(Status s) {
        if (s != null) {
            return UNDER_REVIEW.equals(s.getStatus());
        }
        return false;
    }
    /*
    public static boolean isReviewCompleted(Status s) {
        if (s != null) {
            return REVIEW_COMPLETED.equals(s.getStatus());
        }
        return false;
    }

    public static boolean isReviewEditing(Status s) {
        if (s != null) {
            return REVIEW_EDITING.equals(s.getStatus());
        }
        return false;
    }
    */
    public static boolean isCompleted(Status s) {
        if (s != null) {
            return COMPLETED.equals(s.getStatus());
        }
        return false;
    }

    public static boolean isAccepted(Status s) {
        if (s != null) {
            return ACCEPTED.equals(s.getStatus());
        }
        return false;
    }
    
    public static boolean isEmpty(String s) {
        if (s != null) {
            return EMPTY.equals(s);
        }
        return false;
    }

    public static boolean isInProgress(String s) {
        if (s != null) {
            return IN_PROGRESS.equals(s);
        }
        return false;
    }

    public static boolean isCompiled(String s) {
        if (s != null) {
            return COMPILED.equals(s);
        }
        return false;
    }

    public static boolean isPendingFix(String s) {
        if (s != null) {
            return PENDING_FIX.equals(s);
        }
        return false;
    }

    public static boolean isUnderReview(String s) {
        if (s != null) {
            return UNDER_REVIEW.equals(s);
        }
        return false;
    }
    /*
    public static boolean isReviewCompleted(String s) {
        if (s != null) {
            return REVIEW_COMPLETED.equals(s);
        }
        return false;
    }

    public static boolean isReviewEditing(String s) {
        if (s != null) {
            return REVIEW_EDITING.equals(s);
        }
                 
        return false;
    }
    */
    public static boolean isCompleted(String s) {
        if (s != null) {
            return COMPLETED.equals(s);
        }
        return false;
    }

    public static boolean isAccepted(String s) {
        if (s != null) {
            return ACCEPTED.equals(s);
        }
        return false;
    }

    public static String getLatestTimestamp(Status s){
		
    	Long lContSubmit = s.getLastContributorSubmission();
		Long lRevSubmit = s.getLastSurveyReview();
		Long lPendSubmit = s.getLastPendingFixSubmit();
		Long lAcceptReq = s.getLastAcceptanceRequest();
		Long lAccept = s.getLastStatusAccepted();
		
		String timestampName = "";

		List<Long> list = new ArrayList<Long>();
		
		if(lContSubmit != null) list.add(lContSubmit);
		if(lRevSubmit != null) list.add(lRevSubmit);
		if(lPendSubmit != null) list.add(lPendSubmit);
		if(lAcceptReq != null) list.add(lAcceptReq);
		if(lAccept != null) list.add(lAccept);
		
		if(list.size() > 0){
			Long maxTimestamp = Collections.max(list);
			
			if(maxTimestamp != null){
				if(maxTimestamp.equals(lContSubmit)){
					timestampName = "lContSubmit";
				}else if(maxTimestamp.equals(lRevSubmit)){
					timestampName = "lRevSubmit";
				}else if(maxTimestamp.equals(lPendSubmit)){
					timestampName = "lPendSubmit";
				}else if(maxTimestamp.equals(lAcceptReq)){
					timestampName = "lAcceptReq";
				}else if(maxTimestamp.equals(lAccept)){
					timestampName = "lAccept";
				}
			}
		}
		
    	return timestampName;
    }

}
