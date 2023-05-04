package org.sqlprocedures;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.sqlprocedures.SQLPatterns.*;

public class FileStringPatternReplacer {

    public static void main(String[] args) {
        // Replace these with your own file paths and pattern
//        String inputFilePath = "input/12.1.0.4_to_12.1.4_REPORTS.sql";
//        String outputFilePath = "output/12.1.0.4_to_12.1.4_REPORTS_OUT.sql";
        String inputFilePath = "input/12.1.0.4_to_12.1.4.sql";
        String outputFilePath = "output/12.1.0.4_to_12.1.4_OUT.sql";

        // Converts each type of query to the according procedure, as defined in SQLPatterns Class.
        convert(inputFilePath, outputFilePath, CREATE_TABLE_Q, CREATE_TABLE_PROCEDURE);
        convert(outputFilePath, outputFilePath, ALTER_TABLE_ADD_CONSTR_UNIQUE_Q, ALTER_TABLE_ADD_CONSTR_UNIQUE_PROCEDURE);
        convert(outputFilePath, outputFilePath, ALTER_TABLE_ADD_CONSTR_FK_Q, ALTER_TABLE_ADD_CONSTR_FK_PROCEDURE);
        convert(outputFilePath, outputFilePath, ALTER_TABLE_ADD_CONSTR_PK_Q, ALTER_TABLE_ADD_CONSTR_PK_PROCEDURE);
        convert(outputFilePath, outputFilePath, ALTER_TABLE_ADD_Q, ALTER_TABLE_ADD_PROCEDURE);
        convert(outputFilePath, outputFilePath, ALTER_TABLE_DROP_CONSTR_Q, ALTER_TABLE_DROP_CONSTR_PROCEDURE);
        convert(outputFilePath, outputFilePath, ALTER_TABLE_MODIFY_Q, ALTER_TABLE_MODIFY_PROCEDURE);
        convert(outputFilePath, outputFilePath, CREATE_INDEX_Q, CREATE_INDEX_PROCEDURE);
        convert(outputFilePath, outputFilePath, CREATE_SEQUENCE_Q, CREATE_SEQUENCE_PROCEDURE);
    }

    private static void convert(String inputFilePath, String outputFilePath,
                                String patternString, String replacementString) {
        // Read the file into a string
        String fileContents = readFileAsString(inputFilePath);

        // Create a pattern object from the pattern string
        Pattern pattern;
        if (Objects.equals(patternString, CREATE_TABLE_Q) ||
            Objects.equals(patternString, CREATE_INDEX_Q) ||
            Objects.equals(patternString, CREATE_SEQUENCE_Q)) {
            pattern = Pattern.compile(patternString, Pattern.DOTALL | Pattern.CASE_INSENSITIVE);
        } else {
            pattern = Pattern.compile(patternString, Pattern.CASE_INSENSITIVE);
        }

        // Use a matcher to find all occurrences of the pattern in the file contents
        Matcher matcher = pattern.matcher(fileContents);

        // Loop through all the matches and replace them with a modified version of the match
        StringBuilder sb = new StringBuilder();
        while (matcher.find()) {
            String matchedString = matcher.group();

            String temp = replacementString;
            temp = temp.replace(TO_BE_REPLACED, matchedString.substring(1, matchedString.length() - 1));

            matcher.appendReplacement(sb, temp);
        }

        matcher.appendTail(sb);

        // Write the modified file contents to a new file
        writeFileAsString(outputFilePath, sb.toString());
    }

    private static String readFileAsString(String filePath) {
        String fileContents = "";
        try {
            Path path = Paths.get(filePath);
            byte[] bytes = Files.readAllBytes(path);
            fileContents = new String(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return fileContents;
    }

    private static void writeFileAsString(String filePath, String content) {
        try {
            Path path = Paths.get(filePath);
            byte[] bytes = content.getBytes();
            Files.write(path, bytes, StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
