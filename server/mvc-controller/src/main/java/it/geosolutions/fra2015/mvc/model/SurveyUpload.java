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
package it.geosolutions.fra2015.mvc.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * @author DamianoG
 *
 */
public class SurveyUpload {

    private String countryForImport;
    private CommonsMultipartFile fileData;

    /**
     * @return the fileData
     */
    public CommonsMultipartFile getFileData() {
        return fileData;
    }

    /**
     * @param fileData the fileData to set
     */
    public void setFileData(CommonsMultipartFile fileData) {
        this.fileData = fileData;
    }

    /**
     * @return the countryForImport
     */
    public String getCountryForImport() {
        return countryForImport;
    }

    /**
     * @param countryForImport the countryForImport to set
     */
    public void setCountryForImport(String countryForImport) {
        this.countryForImport = countryForImport;
    }

    
    
    
}
