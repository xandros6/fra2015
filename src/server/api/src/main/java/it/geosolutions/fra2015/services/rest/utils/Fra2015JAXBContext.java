/*
 *  Copyright (C) 2007 - 2011 GeoSolutions S.A.S.
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
package it.geosolutions.fra2015.services.rest.utils;

import it.geosolutions.fra2015.server.model.User;
import it.geosolutions.fra2015.services.rest.model.UserList;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import javax.xml.bind.JAXBContext;
import org.apache.log4j.Logger;

/**
 * A JAXBContext of public fra2015 classes. Useful when unmarhasalling fra2015
 * classes.
 *
 * @author ETj (etj at geo-solutions.it)
 */
public class Fra2015JAXBContext {

    private final static Logger LOGGER = Logger.getLogger(Fra2015JAXBContext.class);
    private final static JAXBContext context;

    static {
        context = createNewContext();
    }

    /**
     * Use this method if you need to extend your context, or use the
     * getContext() method if you need the standard context.
     */
    public static JAXBContext createNewContext() {
        JAXBContext tmpContext = null;
        try {
            // This procedure has been commented out since it has problems in dealing with classes inside jar files.
            // An explicit enumeration of the classes has been implemented instead.
//            String coreModelPackage = Resource.class.getPackage().getName();
//            String serviceApiPackage = ShortResource.class.getPackage().getName();
//            String restApiPackage = RESTResource.class.getPackage().getName();
//
//            List<Class> coreModelClasses = getClasses(coreModelPackage);
//            List<Class> serviceApiClasses = getClasses(serviceApiPackage);
//            List<Class> restApiClasses = getClasses(restApiPackage);

            List<Class> allClasses = getFra2015Classes();

            if (LOGGER.isDebugEnabled()) {
                LOGGER.debug("Initializing fra2015JAXBContext with " + allClasses.size() + " classes " + allClasses);
            }

            tmpContext = JAXBContext.newInstance(allClasses.toArray(new Class[allClasses.size()]));
            
        } catch (Exception ex) {
            LOGGER.error("Can't create fra2015 context: " + ex.getMessage(), ex);
        }

        return tmpContext;
    }

    public static List<Class> getFra2015Classes() {
        // retrieve the explicit set of classes
        List coreModelClasses = getModelClasses();

        // merge the classes and create the context
        List<Class> allClasses = new ArrayList<Class>(coreModelClasses.size());
        allClasses.addAll(coreModelClasses);

        return allClasses;
    }

    private static List<Class<User>> getModelClasses() {
        return Arrays.asList(it.geosolutions.fra2015.server.model.User.class);
    }

    public static JAXBContext getContext() {
        if (context == null) {
            throw new IllegalStateException("Context has not been properly initialized");
        }
        return context;
    }

    /**
     * Scans all classes accessible from the context class loader which belong
     * to the given package and subpackages.
     *
     * @param packageName The base package
     * @return The classes
     * @throws ClassNotFoundException
     * @throws IOException
     */
    @SuppressWarnings("unchecked")
    private static List<Class> getClasses(String packageName)
            throws ClassNotFoundException, IOException {

        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("Loading classes from " + packageName);
        }
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        assert classLoader != null;
        String path = packageName.replace('.', '/');
        Enumeration<URL> resources = classLoader.getResources(path);
        List<File> dirs = new ArrayList<File>();
        while (resources.hasMoreElements()) {
            URL resource = resources.nextElement();
            String fileName = resource.getFile();

            if (LOGGER.isDebugEnabled()) {
                LOGGER.debug("   adding resource " + fileName);
            }

            String fileNameDecoded = URLDecoder.decode(fileName, "UTF-8");
            dirs.add(new File(fileNameDecoded));
        }
        ArrayList<Class> classes = new ArrayList<Class>();
        for (File directory : dirs) {
            classes.addAll(findClasses(directory, packageName));
        }
        return classes;
    }

    /**
     * Recursive method used to find all classes in a given directory and
     * subdirs.
     *
     * This method is not useful if classes are inside a jar file.
     *
     * @param directory The base directory
     * @param packageName The package name for classes found inside the base
     * directory
     * @return The classes
     * @throws ClassNotFoundException
     */
    @SuppressWarnings("unchecked")
    private static List<Class> findClasses(File directory, String packageName) throws ClassNotFoundException {
        List<Class> classes = new ArrayList<Class>();
        if (!directory.exists()) {
            LOGGER.debug("Directory not found :" + directory);
            return classes;
        }

        File[] files = directory.listFiles();
        for (File file : files) {
            String fileName = file.getName();
            if (file.isDirectory()) {
                assert !fileName.contains(".");
                classes.addAll(findClasses(file, packageName + "." + fileName));
            } else if (fileName.endsWith(".class") && !fileName.contains("$")) {
                Class _class;
                try {
                    _class = Class.forName(packageName + '.' + fileName.substring(0, fileName.length() - 6));
                } catch (ExceptionInInitializerError e) {
                    // happen, for example, in classes, which depend on
                    // Spring to inject some beans, and which fail,
                    // if dependency is not fulfilled
                    _class = Class.forName(packageName + '.' + fileName.substring(0, fileName.length() - 6),
                            false, Thread.currentThread().getContextClassLoader());
                }
                classes.add(_class);
            }
        }
        return classes;
    }
}