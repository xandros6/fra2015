/*
 *  fra2015
 *  https://github.com/geosolutions-it/fra2015
 *  Copyright (C) 2007-2012 GeoSolutions S.A.S.
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
package it.geosolutions.fra2015.server.model.survey;


import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@SuppressWarnings("serial")
@Entity(name = "ActivityLog")
@Table(name = "fra_activitylog" )
public class ActivityLogEntry implements Serializable {
		
		@Transient
		public static final DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	
        @Id
        @GeneratedValue
        private Long id;
        
        private Long time;
        
        @Transient
        private String date;
        
        @Transient
        private String fromDate;
        
        @Transient
        private String toDate;
        
        private String entryItemName;
        
        private String username;
        
        private String country;
        
        private String question_id;
        
        private String content;

        /**
         * @return the id
         */
        public Long getId() {
            return id;
        }

        /**
         * @param id the id to set
         */
        public void setId(Long id) {
            this.id = id;
        }

        /**
         * @return the time
         */
        public Long getTime() {
            return time;
        }

        /**
         * @param time the time to set
         */
        public void setTime(Long time) {
            this.time = time;
        }
        
        /**
         * @return the entryItemName
         */
        public String getEntryItemName() {
            return entryItemName;
        }

        /**
         * @param entryItemName the entryItemName to set
         */
        public void setEntryItemName(String entryItemName) {
            this.entryItemName = entryItemName;
        }

        /**
         * @return the username
         */
        public String getUsername() {
            return username;
        }

        /**
         * @param username the username to set
         */
        public void setUsername(String username) {
            this.username = username;
        }

        /**
         * @return the country
         */
        public String getCountry() {
            return country;
        }

        /**
         * @param country the country to set
         */
        public void setCountry(String country) {
            this.country = country;
        }

        /**
         * @return the question_id
         */
        public String getQuestion_id() {
            return question_id;
        }

        /**
         * @param question_id the question_id to set
         */
        public void setQuestion_id(String question_id) {
            this.question_id = question_id;
        }

        /**
         * @return the content
         */
        public String getContent() {
            return content;
        }

        /**
         * @param content the content to set
         */
        public void setContent(String content) {
            this.content = content;
        }

		public String getFromDate() {
			return fromDate;
		}

		public void setFromDate(String fromDate) {
			this.fromDate = fromDate;
		}

		public String getToDate() {
			return toDate;
		}

		public void setToDate(String toDate) {
			this.toDate = toDate;
		}

		public String getDate() {
			return formatter.format(new Date(this.time));
		}

}