package leetcode;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class CountingBitsProblem {

    /**
     * Convert a integer to its binary representation in string
     * @param Integer to be converted
     * @return The binary representation of that integer with type String
     */
    private static String toBinary(Integer decimal) {
        if(decimal == null) {
            return "";
        }
        
        if(decimal <= 0) {
            return "";
        }
        
        // This return needs to be in this order to positions be from left to right
        return toBinary(decimal/2) + (decimal % 2);
    }
    
    /**
     * Given an integer n, determine:
     * The number of 1-bits in its binary representation
     * The positions of each 1-bit, listed in ascending order.
     * Position are counted from left to right, starting at 1, and
     * leading zeros are ignored when determining the leftmost bit
     * E.G: Suppose n = 37
     * Output: [3, 1, 4, 6]
     * @param primitive integer
     * @return a list of integer where the first position is the total of 1-bits
     * and the tail of the list is the position of each 1bit
     */
    public static List<Integer> getOneBits(int n) {
        String binaryString = toBinary(n);
        
        // Transform the string into a list
        List<Integer> binaryList = binaryString
            .chars()
            .map(Character::getNumericValue)
            .boxed()
            .collect(Collectors.toCollection(LinkedList::new));
        
        // Get the quantity of one bits inside the list
        Integer quantityOfOne = binaryList.stream()
            .filter(f -> f == 1)
            .reduce(0, (acc, c) -> acc + c);
        
        // Get the indexes where the digit one appear. The list if filtered to have only the one digits
        LinkedList<Integer> resultList = IntStream.range(0, binaryList.size())
            .filter(f -> binaryList.get(f) == 1) // Filter to have only 1 in the list
            .map(m -> m + 1) // Convert 0-based index to 1-based index
            .boxed()
            .collect(Collectors.toCollection(LinkedList::new));
        resultList.addFirst(quantityOfOne);
        
        // TODO There's must be a way to unify the quantityOfOne with resultList and make a single stream function.
        return resultList;
    }
    
    public static void main(String[] args) {
        int n1 = 37;
        int n2 = 100;
        int n3 = 128;
        int n4 = 256;
        int n5 = 1024;
        int n6 = 60000;
        int n7 = 500000;
        int n8 = 0;
        int n9 = -64;
        // can't test null because getOneBits use primitive integer instead of object
                
        System.out.println(getOneBits(n1));
        System.out.println(getOneBits(n2));
        System.out.println(getOneBits(n3));
        System.out.println(getOneBits(n4));
        System.out.println(getOneBits(n5));
        System.out.println(getOneBits(n6));
        System.out.println(getOneBits(n7));
        System.out.println(getOneBits(n8));
        System.out.println(getOneBits(n9));
    }
}
