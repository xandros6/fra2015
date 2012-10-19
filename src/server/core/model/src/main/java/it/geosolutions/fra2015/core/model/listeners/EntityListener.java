package it.geosolutions.fra2015.core.model.listeners;

import it.geosolutions.fra2015.core.model.Question;
import javax.persistence.PostLoad;
import javax.persistence.PostPersist;
import javax.persistence.PostRemove;
import javax.persistence.PostUpdate;
import javax.persistence.PrePersist;
import javax.persistence.PreRemove;
import javax.persistence.PreUpdate;

/**
 *
 * @author Francesco Rogo <f.rogo@computernopanic.com>
 * @date $(time)
 */
public class EntityListener<T> {

    @PrePersist
    void onPrePersist(T o) {
    }

    @PostPersist
    void onPostPersist(T o) {
    }

    @PostLoad
    void onPostLoad(T o) {
    }

    @PreUpdate
    void onPreUpdate(T o) {
    }

    @PostUpdate
    void onPostUpdate(T o) {
    }

    @PreRemove
    void onPreRemove(T o) {
    }

    @PostRemove
    void onPostRemove(T o) {
    }
}
