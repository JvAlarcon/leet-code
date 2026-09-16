package leetcode;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class RomanizeProblem {
    
	/**
	 * Procedure to initialize the dictionary for Roman numeral
	 * @return a map containing all the element for the dictionary up to 1000
	 */
    private static Map<Integer, String> roman_dictionary() {
    	Map<Integer, String> roman_dictionary = new LinkedHashMap<>();
        // The LinkedMap is to ensure a specific order inside the map from the largest to the lowest
    	
    	roman_dictionary.put(1000, "M");
    	roman_dictionary.put(900, "CM");
        roman_dictionary.put(500, "D");
        roman_dictionary.put(400, "CD");
        roman_dictionary.put(100, "C");
        roman_dictionary.put(90, "XC");
        roman_dictionary.put(50, "L");
        roman_dictionary.put(40, "XL");
        roman_dictionary.put(10, "X");
        roman_dictionary.put(9, "IX");
        roman_dictionary.put(5, "V");
        roman_dictionary.put(4, "IV");
        roman_dictionary.put(1, "I");
        
        return roman_dictionary;
    }
    
    /**
     * Recursive function that given a dictionary and a number, it will return the translation from
     * the Arabic number to the dictionary number
     * @param a Arabic number of type Integer
     * @return a String that is the translation of the Arabic number to the dictionary number
     */
    private static String translate(Map<Integer, String> dictionary, Integer n) {
        if(n == null) {
            return "";
        }
        
        if(n <= 0) {
            return "";
        }
        
        for(Map.Entry<Integer, String> entry : dictionary.entrySet()) {
            if (entry.getKey() <= n) {
                return entry.getValue() + translate(dictionary, n - entry.getKey());
            }
        }
        
        // Base case
        return "";
    }
    
    /**
     * Given an Integer, convert it to its Roman numeral equivalent.
     * Input: numbers = [1,49,23]
     * Output: ["I", "XLIX", "XXIII"]
     * It will filter the empty strings from the list
     * @param a list of Arabic number of type Integer
     * @return the translation list for Roman dictionary of type String
     */
    public static List<String> romanizer(List<Integer> numbers) {
        final Map<Integer, String> dictionary = roman_dictionary();
        return numbers.stream()
            .map(n -> translate(dictionary, n))
            .filter(s -> !s.isBlank())
            .collect(Collectors.toList());
    }
    
    public static void main(String[] args) {
        List<Integer> list1 = Arrays.asList(1, 49, 23);
        List<Integer> list2 = Arrays.asList(4, 9, 14, 19, 40, 90, 99, 499, 944);
        List<Integer> list3 = Arrays.asList(-1, 0, null, 1001, 5000);
        
        System.out.println(romanizer(list1));
        System.out.println(romanizer(list2));
        System.out.println(romanizer(list3));
    }
}