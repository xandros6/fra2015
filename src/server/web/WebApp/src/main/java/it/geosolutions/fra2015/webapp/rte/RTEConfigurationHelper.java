package it.geosolutions.fra2015.webapp.rte;

import com.ckeditor.CKEditorConfig;
import com.ckeditor.EventHandler;
import com.ckeditor.GlobalEventHandler;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author francesco
 */
public class RTEConfigurationHelper {

    public static CKEditorConfig createConfig() {
        CKEditorConfig settings = new CKEditorConfig();

        List<Object> mainList = new ArrayList<Object>();

        HashMap<String, Object> toolbarSectionMap = new HashMap<String, Object>();

        List<String> subList = new ArrayList<String>();

        subList.add("Source");
        subList.add("-");
        subList.add("NewPage");

        toolbarSectionMap.put("name", "document");
        toolbarSectionMap.put("items", subList);

        mainList.add(toolbarSectionMap);
        //mainList.add("/"); // nuova riga

        toolbarSectionMap = new HashMap<String, Object>();

        subList = new ArrayList<String>();

        subList.add("Styles");
        subList.add("Format");
        subList.add("Color");

        toolbarSectionMap.put("name", "styles");
        toolbarSectionMap.put("items", subList);

        mainList.add(toolbarSectionMap);

        toolbarSectionMap = new HashMap<String, Object>();
        subList = new ArrayList<String>();

        subList.add("Cut");
        subList.add("Copy");
        subList.add("Paste");

        toolbarSectionMap.put("name", "clipboard");
        toolbarSectionMap.put("items", subList);

        mainList.add(toolbarSectionMap);


        settings.addConfigValue("toolbar", mainList);

        return settings;

    }

    public static EventHandler createEventHandlers() {

        EventHandler handler = new EventHandler();

        String function = "function(ev) { alert('Loaded dialog window:' + ev.data.name; }";

        handler.addEventHandler("instanceReady", function);

        return handler;

    }

    public static GlobalEventHandler createGlobalEventHandler() {

        GlobalEventHandler handler = new GlobalEventHandler();

        String function = "function(ev) { alert('Loading dialog window:' + ev.data.name); }";

        handler.addEventHandler("dialogDefinition", function);

        return handler;




    }
}
