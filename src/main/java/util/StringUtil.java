package util;

public class StringUtil {
	public static String removeSpecialCharacters(String inputString) {
		String specialCharacters = "/#%^&@!~`'\"|><";
		return inputString.replaceAll("[" + specialCharacters + "]", "");
	}
}
