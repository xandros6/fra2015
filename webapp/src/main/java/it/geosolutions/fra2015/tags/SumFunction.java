package it.geosolutions.fra2015.tags;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;

public class SumFunction {
	
	private static Logger LOGGER = Logger.getLogger(SumFunction.class);
	private static final DecimalFormat df; 
	
	static {
		DecimalFormatSymbols otherSymbols = new DecimalFormatSymbols(Locale.getDefault());
		otherSymbols.setDecimalSeparator('.');
		df = new DecimalFormat("#.00",otherSymbols); 
	}
	
	public static String computeSum(String numbers) {
		String ret = "";
		Double result = 0d;
		for(String s : StringUtils.splitPreserveAllTokens(numbers,";")){
			s = s.trim();
			if(s==null || s.isEmpty() || !NumberUtils.isNumber(s)){
				result = null;
				break;
			}else{
				try {
					result = result + df.parse(s).doubleValue();
				} catch (ParseException e) {
					LOGGER.error(e.getMessage(), e);
				}
			}
		}
		if(result != null){
			ret = df.format(result);
		}
		return ret;
	}
}
