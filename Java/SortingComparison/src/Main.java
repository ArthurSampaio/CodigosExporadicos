
import sorts.HeapSort;
import sorts.MergeSort;
import sorts.QuickSort;

import javax.print.DocFlavor;
import java.io.*;
import java.util.Arrays;

/**
 * Created by sampaio on 06/08/17.
 */
public class Main {

    private static final String MERGE = "MERGE";
    private static final String HEAP = "HEAP";
    private static final String QUICK = "QUICK";
    private static final String DIVISOR = ";";

    private static final String HEADER = "algorithm; array_type; size; time";

    public static void main(String[] args) {

        if(args.length == -1){
            throw new RuntimeException("É necessário passar um parâmetro");
        }

        try{

            String algorithm = args[0].toUpperCase();
            InputStream fstream = new FileInputStream(args[1]);
            String fileOutput = args[2];

            runExperiment(algorithm, fstream, fileOutput);

        }catch (Exception e){
            e.printStackTrace();
        }

    }

    private static void runExperiment(String algorithm, InputStream fstream, String output) throws IOException {

        FileWriter file = new FileWriter(output);
        BufferedWriter writer = new BufferedWriter(file);
        writer.write(HEADER);
        writer.newLine();

        BufferedReader br = new BufferedReader(new InputStreamReader(fstream));
        String line;
        line = br.readLine();

        while(line != null){

            String lineToBeWrite = takeInfoAndWriteLine(line, algorithm);
            writer.write(lineToBeWrite);
            writer.newLine();
            line = br.readLine();
        }

        writer.close();

    }

    private static String takeInfoAndWriteLine (String line, String algorithm){

        String[] dataLine = line.split(DIVISOR);
        String type = dataLine[0];
        Integer[] array = getIntegerArrayFromString(dataLine[1]);
        Double time = calculateSortingTime(array, algorithm);
        int arraySize = array.length;

        String out = algorithm + DIVISOR + type + DIVISOR + arraySize + DIVISOR + time;

        return out;


    }

    private static Double calculateSortingTime(Integer[] unsort, String algorithm){


        double startTime = 0;
        double endTime = 0;


        if(algorithm.toUpperCase().contains(MERGE)){
            startTime = System.currentTimeMillis();
            MergeSort.sort(MergeSort.SPACE_TYPE.IN_PLACE, unsort);
            endTime = System.currentTimeMillis();
        }

        if(algorithm.toUpperCase().contains(QUICK)){
            startTime = System.currentTimeMillis();
            QuickSort.sort(QuickSort.PIVOT_TYPE.MIDDLE, unsort);
            endTime = System.currentTimeMillis();
        }

        if(algorithm.toUpperCase().contains(HEAP)){
            startTime = System.currentTimeMillis();
            HeapSort.sort(unsort);
            endTime = System.currentTimeMillis();
        }


        return new Double(endTime - startTime);

    }



    private static Integer[] getIntegerArrayFromString(String s) {

        s = removeBrackets(s);
        String[] arrayString = s.split(",");
        Integer[] arrayOut = new Integer[arrayString.length];

        for(int i = 0; i < arrayString.length; i++){
            arrayOut[i] = new Integer(arrayString[i].trim());
        }

        return arrayOut;

    }


    private static String removeBrackets(String s){
        s = s.replace("[", "");
        s = s.replace("]", "");

        return s;
    }


}