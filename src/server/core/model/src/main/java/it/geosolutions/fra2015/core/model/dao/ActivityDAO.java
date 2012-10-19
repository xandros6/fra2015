package it.geosolutions.fra2015.core.model.dao;

import it.geosolutions.fra2015.core.model.Activity;
import java.util.Calendar;
import java.util.List;

/**
 *
 * private String body; private String agent; private String report; private
 * String question; private String fieldId; private String rowId; private String
 * previousValue; private String updatedValue;
 *
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 */
public interface ActivityDAO {

    public Long create(String body, String agent, String report, String question, String fieldId, String rowId, String previousValue, String updatedValue);

    public Activity read(Long id);
    
    public List<Activity> readFromDateToDate(Calendar from, Calendar to);

    public List<Activity> readByAgent(String agent);

    public List<Activity> readByReport(String report);

    public List<Activity> readByQuestion(String report, String question);

    public List<Activity> readByFieldId(String report, String question, String fieldId);

    public List<Activity> readByRowId(String report, String question, String fieldId, String rowId);

    public void update(Activity activity);

    public void delete(Activity activity);
}
