package it.geosolutions.fra2015.tags;

public class TagUtils {

	public static boolean contains(Integer[] s, Integer input) {
		if (s != null) {
			for (Integer i : s) {
				if (i.intValue() == input.intValue()) {
					return true;
				}
			}
		}
		return false;
	}

}
