package it.geosolutions.fra2015.tags;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

public class SumFunction {
	public static String computeSum(String numbers) {
		String ret = "";
		Double result = 0d;
		for(String s : StringUtils.splitPreserveAllTokens(numbers,";")){
			s = s.trim();
			if(s==null || s.isEmpty() || !NumberUtils.isNumber(s)){
				result = null;
				break;
			}else{
				result = result + Double.parseDouble(s);
			}
		}
		if(result != null){
			ret = Double.toString(result);
		}
		return ret;
	}
}
