package generateInput;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;
import java.util.Random;

/**
 * Created by sampaio on 06/08/17.
 */
public class Generate {


    private static final String RANDOM = "RANDOM";
    private static final String SORTED = "SORTED";
    private static final String REVERSE = "REVERSE";
    private static final String FILE = "input.txt";

    public static void main(String[] args0) throws IOException {
        writeArraysInFile();
    }


    public static void writeArraysInFile() throws IOException {

        FileWriter file = new FileWriter(FILE);
        BufferedWriter br = new BufferedWriter(file);
        Integer[] arraySizes = generateRandomSizes(50);

        for(Integer size : arraySizes){

            Integer[] random = generateRandomArray(size);
            br.write(describeArray(random, RANDOM));
            br.newLine();

            Integer[] sorted = generateSortedArray(size);
            br.write(describeArray(sorted, SORTED));
            br.newLine();

            Integer[] reverse = generateReverseArray(size);
            br.write(describeArray(reverse,REVERSE));
            br.newLine();

        }

        br.close();
        System.out.println("DONE");

    }

    public static String describeArray(Integer[] array, String type){

        return type + ";" + Arrays.toString(array);

    }


    public static Integer[] generateRandomSizes(int size){

        Random random = new Random();
        Integer[] differentSizes = new Integer[size];

        for(int i = 0; i < size; i++){

            Integer element = random.nextInt(1024*200);
            differentSizes[i] = element;
        }

        return differentSizes;


    }


    public static Integer[] generateRandomArray(int size){

        Random random = new Random();
        Integer[] unsorted = new Integer[size];
        int i = 0;
        while (i < unsorted.length) {
            int j = random.nextInt(unsorted.length * 10);
            unsorted[i++] = j;
        }

        return unsorted;
    }

    public static Integer[] generateSortedArray(int size){

        Integer[] sorted = new Integer[size];
        for (int i = 0; i < sorted.length; i++) {
            sorted[i] = i;
        }

        return sorted;
    }

    public static Integer[] generateReverseArray(int size){

        Integer[] reverse = new Integer[size];
        int j = 0;
        for(int i = size-1; i>=0; i--){
            reverse[j] = i;
            j++;

        }

        return reverse;
    }



}
