package org.sqlprocedures;

public class SQLPatterns {

    // Garbage string which will be replaced in each procedure with the query
    public static String TO_BE_REPLACED = "@#$%^&*";

    public static String CREATE_TABLE_Q = "\\sCREATE\\s+TABLE\\s+.*?;";
    public static String CREATE_TABLE_PROCEDURE =
            "declare begin execute immediate '" + TO_BE_REPLACED + "';\n" +
            "exception when others then\n" +
            "\tif SQLCODE = -955 then null; else raise; end if;\n" +
            "\tcommit;\n" +
            "end;\n" +
            "/\n";

    public static String ALTER_TABLE_MODIFY_Q =
            "\\sALTER\\s+TABLE\\s.*?MODIFY\\s+.*?;";
    public static String ALTER_TABLE_MODIFY_PROCEDURE =
            "DECLARE\n" +
            "BEGIN\n" +
            "\tEXECUTE IMMEDIATE '" + TO_BE_REPLACED + "';\n" +
            "\tDBMS_OUTPUT.PUT_LINE('Table successfully modified.');\n" +
            "EXCEPTION\n" +
            "\tWHEN OTHERS THEN\n" +
            "\t\tIF SQLCODE = -14402 THEN -- -14402: column is already NOT NULL\n" +
            "\t\t\tDBMS_OUTPUT.PUT_LINE('Column already NOT NULL.');\n" +
            "\t\tELSE\n" +
            "\t\t\tDBMS_OUTPUT.PUT_LINE('Error modifying table: ' || SQLERRM);\n" +
            "\t\tEND IF;\n" +
            "\tEND;\n" +
            "END;\n" +
            "/\n";

    public static String ALTER_TABLE_ADD_CONSTR_UNIQUE_Q =
            "\\sALTER\\s+TABLE\\s.*?ADD CONSTRAINT\\s.*?UNIQUE\\s+.*?;";
    public static String ALTER_TABLE_ADD_CONSTR_UNIQUE_PROCEDURE =
            "declare\n" +
            "\tcolumn_exists exception;\n" +
            "\tpragma exception_init (column_exists , -02261);\n" +
            "begin\n" +
            "\texecute immediate '" + TO_BE_REPLACED + "';\n" +
            "\tcommit;\n" +
            "\texception when column_exists then null;\n" +
            "end;\n" +
            "/\n";

    public static String ALTER_TABLE_ADD_CONSTR_FK_Q =
            "\\sALTER\\s+TABLE\\s.*?ADD CONSTRAINT\\s.*?FOREIGN KEY\\s+.*?;";
    public static String ALTER_TABLE_ADD_CONSTR_FK_PROCEDURE =
            "declare\n" +
                    "\tcolumn_exists exception;\n" +
                    "\tpragma exception_init (column_exists , -02275);\n" +
                    "begin\n" +
                    "\texecute immediate '" + TO_BE_REPLACED + "';\n" +
                    "\tcommit;\n" +
                    "\texception when column_exists then null;\n" +
                    "end;\n" +
                    "/\n";

    public static String ALTER_TABLE_ADD_CONSTR_PK_Q =
            "\\sALTER\\s+TABLE\\s.*?ADD CONSTRAINT\\s.*?PRIMARY KEY\\s+.*?;";
    public static String ALTER_TABLE_ADD_CONSTR_PK_PROCEDURE =
            "CREATE OR REPLACE PROCEDURE add_PK_constraint AS\n" +
            "\tconstraint_exists EXCEPTION;\n" +
            "\tPRAGMA EXCEPTION_INIT(constraint_exists, -955);\n" +
            "BEGIN\n" +
            "\tBEGIN\n" +
            "\t\tEXECUTE IMMEDIATE '" + TO_BE_REPLACED + "';\n" +
            "\t\tDBMS_OUTPUT.PUT_LINE('Constraint added successfully.');\n" +
            "\tEXCEPTION\n" +
            "\t\tWHEN constraint_exists THEN\n" +
            "\t\t\tDBMS_OUTPUT.PUT_LINE('Constraint already exists.');\n" +
            "\t\tWHEN OTHERS THEN\n" +
            "\t\t\tDBMS_OUTPUT.PUT_LINE('Error adding constraint: ' || SQLERRM);\n" +
            "\tEND;\n" +
            "END;\n" +
            "/";

    public static String ALTER_TABLE_DROP_CONSTR_Q =
            "\\sALTER\\s+TABLE\\s.*?DROP CONSTRAINT\\s+.*?;";
    public static String ALTER_TABLE_DROP_CONSTR_PROCEDURE =
            "CREATE OR REPLACE PROCEDURE drop_constraint AS\n" +
            "\tconstraint_exists EXCEPTION;\n" +
            "\tPRAGMA EXCEPTION_INIT(constraint_exists, -2443);\n" +
            "BEGIN\n" +
            "\tBEGIN\n" +
            "\tEXECUTE IMMEDIATE '" + TO_BE_REPLACED + "';\n" +
            "\tDBMS_OUTPUT.PUT_LINE('Constraint dropped successfully.');\n" +
            "\tEXCEPTION\n" +
            "\t\tWHEN constraint_exists THEN\n" +
            "\t\t\tDBMS_OUTPUT.PUT_LINE('Constraint does not exist.');\n" +
            "\t\tWHEN OTHERS THEN\n" +
            "\t\t\tDBMS_OUTPUT.PUT_LINE('Error dropping constraint: ' || SQLERRM);\n" +
            "\tEND;\n" +
            "END;\n" +
            "/\n";

    public static String ALTER_TABLE_ADD_Q =
            "\\sALTER\\s+TABLE\\s.*?ADD\\s+.*?;";
    public static String ALTER_TABLE_ADD_PROCEDURE =
            "declare\n" +
            "\tcolumn_exists exception;\n" +
            "\tpragma exception_init (column_exists , -01430);\n" +
            "begin\n" +
            "\texecute immediate '" + TO_BE_REPLACED + "';\n" +
            "\tcommit;\n" +
            "\texception when column_exists then null;\n" +
            "end;\n" +
            "/\n";

    public static String CREATE_INDEX_Q = "\\sCREATE\\s+INDEX\\s+.*?;";
    public static String CREATE_INDEX_PROCEDURE =
            "declare\n" +
            "\talready_exists  exception;\n" +
            "\tcolumns_indexed exception;\n" +
            "\tpragma exception_init( already_exists, -955 );\n" +
            "\tpragma exception_init(columns_indexed, -1408);\n" +
            "begin\n" +
            "\texecute immediate '" + TO_BE_REPLACED + "';\n" +
            "\tcommit;\n" +
            "\tdbms_output.put_line( 'created' );\n" +
            "exception\n" +
            "\twhen already_exists or columns_indexed then\n" +
            "\tdbms_output.put_line( 'skipped' );\n" +
            "end;\n" +
            "/\n";

    public static String CREATE_SEQUENCE_Q = "\\sCREATE\\s+SEQUENCE\\s+.*?;";
    public static String CREATE_SEQUENCE_PROCEDURE =
            "declare\n" +
                    "\talready_exists  exception;\n" +
                    "\tcolumns_indexed exception;\n" +
                    "\tpragma exception_init( already_exists, -955 );\n" +
                    "\tpragma exception_init(columns_indexed, -1408);\n" +
                    "begin\n" +
                    "\texecute immediate '" + TO_BE_REPLACED + "';\n" +
                    "\tcommit;\n" +
                    "\tdbms_output.put_line( 'created' );\n" +
                    "exception\n" +
                    "\twhen already_exists or columns_indexed then\n" +
                    "\tdbms_output.put_line( 'skipped' );\n" +
                    "end;\n" +
                    "/\n";
}
