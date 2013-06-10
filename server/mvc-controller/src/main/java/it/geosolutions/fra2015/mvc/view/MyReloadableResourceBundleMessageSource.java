package it.geosolutions.fra2015.mvc.view;

import java.util.Locale;
import java.util.Set;

import org.springframework.context.support.ReloadableResourceBundleMessageSource;

public class MyReloadableResourceBundleMessageSource extends ReloadableResourceBundleMessageSource{

	public Set<Object> getKeys(Locale locale) {
		return super.getMergedProperties(locale).getProperties().keySet();
	}

}
