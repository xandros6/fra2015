package it.geosolutions.fra2015.core.model.dao;

import it.geosolutions.fra2015.core.model.Question;
import it.geosolutions.fra2015.core.model.Report;
import it.geosolutions.fra2015.core.model.Warning;
import it.geosolutions.fra2015.core.model.user.User;
import java.util.List;

/**
 *    private String body;
    @ManyToOne
    private Question question;
    @ManyToOne
    private User editor;
    @ManyToOne
    private User owner;
    private String fieldId;
    private Boolean closed = false;
    @Temporal(TemporalType.DATE)
    private Calendar lastUpdate;
    @Temporal(TemporalType.DATE)
    private Calendar creationDate;

 * @author Francesco Rogo <f.rogo@computernopanic.com>
 */
public interface WarningDAO {
    
    public Long create(String body, User user, User owner, 
            Report report, Question question, String sectionId);
    
    public Warning read(Long id);
    
    public List<Warning> readByUser(User user);
    public List<Warning> readByUser(User user, boolean open);
    
    public List<Warning> readByOwner(User owner);
    public List<Warning> readByOwner(User owner, boolean open);
    
    public List<Warning> readByReport(Report report);
    public List<Warning> readByReport(Report report, boolean open);
    
    public List<Warning> readByQuestion(Report report, Question question);
    public List<Warning> readByQuestion(Report report, Question question, boolean open);
    
    public void update(Warning warning);
    
    public void delete(Warning warning);
    
}
