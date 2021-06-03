package MyUtilities;

public class Utility {
    /**
     * Hieu_iceTea <br>
     * Capitalize the first letter of a string <br>
     * http://attacomsian.com/blog/capitalize-first-letter-of-string-java
     *
     * @param str
     * @return
     */
    public static String capitalize(String str) {
        if (str == null || str.isEmpty()) {
            return str;
        }

        return str.substring(0, 1).toUpperCase() + str.substring(1).toLowerCase();
    }

    /**
     * Hieu_iceTea <br>
     * Capitalize each word in String <br>
     * http://attacomsian.com/blog/capitalize-first-letter-of-string-java
     *
     * @param str
     * @return
     */
    public static String capitalizeWord(String str) {
        String words[] = str.split("\\s");
        String capitalizeWord = "";
        for (String w : words) {
            String first = w.substring(0, 1);
            String afterfirst = w.substring(1);
            capitalizeWord += first.toUpperCase() + afterfirst + " ";
        }
        return capitalizeWord.trim();
    }

    /**
     * Hieu_iceTea <br>
     * String To Int Array <br>
     *
     * @param stringArray
     * @return
     */
    public static int[] stringToIntArray(String[] stringArray) {
        int size = stringArray.length;
        int[] intArray = new int[size];
        for (int i = 0; i < size; i++) {
            intArray[i] = Integer.parseInt(stringArray[i]);
        }
        return intArray;
    }
}
