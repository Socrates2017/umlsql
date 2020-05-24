package com.zrzhen.umlsql.core;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * String filePath = "E:\\github\\umlsql\\umlsql\\uml\\cdz.sql";
 * String savePath = "E:\\github\\umlsql\\umlsql\\uml\\cdz_trigger.sql";
 * <p>
 * OdsTriggerConfig sql2OdsConfig = new OdsTriggerConfig(filePath, savePath);
 * <p>
 * List<TableModel> tableList = transformAndSave(sql2OdsConfig);
 */
public class OdsTriggerUtil {

    public static List<TableModel> transformAndSave(OdsTriggerConfig config) throws FileEmptyException {
        String filePath = config.getSqlFilePath();

        if (filePath == null || filePath.equals("")) {

            throw new FileEmptyException("Uml file path should not be empty!");
        }

        File file = new File(filePath);
        if (!file.exists()) {
            throw new FileEmptyException("Uml file is not exist, file path:" + filePath);
        }

        FileReader fileReader = null;
        BufferedReader bufferedReader = null;
        try {
            fileReader = new FileReader(file);
            bufferedReader = new BufferedReader(fileReader);

            String line;

            List<TableModel> tableList = new ArrayList<>();
            String name = "";
            List<String> columnNames = new ArrayList<>();


            boolean matchLine = false;
            boolean nameLine = false;
            boolean end = false;
            while ((line = bufferedReader.readLine()) != null) {
                line = line.trim();
                if (match(line)) {
                    int aIndex = line.indexOf('`');
                    int aLastIndex = line.lastIndexOf('`');
                    name = line.substring(aIndex + 1, aLastIndex);

                    matchLine = true;
                    nameLine = true;
                }

                if (matchLine) {
                    if (nameLine) {
                        nameLine = false;
                    } else {
                        if (line.startsWith("PRIMARY")) {
                            end = true;
                        } else if (line.startsWith("`")) {
                            int aIndex = line.indexOf('`');
                            int aLastIndex = line.lastIndexOf('`');
                            String columnName = line.substring(aIndex + 1, aLastIndex);
                            columnNames.add(columnName);
                        } else if (end) {
                            TableModel table = new TableModel();
                            table.setTableName(name);
                            table.setColumnNames(columnNames);

                            String odsDbName = config.getOdsDbName();


                            String triggerInsert = "CREATE trigger " + name + "_insert  after insert on `" + name
                                    + "` for each row \n begin\n insert into " + odsDbName + ".ods_" + name + "(";
                            String triggerUpdate = "CREATE trigger " + name + "_update  after update on `" + name
                                    + "` for each row \n begin\n insert into " + odsDbName + ".ods_" + name + "(";

                            String values = "values (";

                            int size = columnNames.size();
                            for (int i = 0; i < size; i++) {
                                String columnName = columnNames.get(i);
                                if (i < size - 1) {
                                    triggerInsert += columnName + ",";
                                    triggerUpdate += columnName + ",";
                                    values += "new." + columnName + ",";
                                } else {
                                    triggerInsert += columnName;
                                    triggerUpdate += columnName;
                                    values += "new." + columnName;
                                }
                            }


                            triggerInsert += ") \n" + values;
                            triggerInsert += ");\nend;\n";


                            triggerUpdate += ") \n" + values;
                            triggerUpdate += ");\nend;\n";

                            table.setTriggerInsert(triggerInsert);
                            table.setTriggerUpdate(triggerUpdate);

                            System.out.println(triggerInsert);
                            System.out.println(triggerUpdate);

                            tableList.add(table);

                            matchLine = false;
                            end = false;
                            name = "";
                            columnNames = new ArrayList<>();
                        }
                    }
                }

            }

            String sqlSavePath = config.getSqlSavePath();
            saveSql(tableList, sqlSavePath);

            return tableList;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fileReader != null) {
                try {
                    fileReader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    private static boolean match(String line) {
        String line1 = line.trim().toUpperCase();
        if (line1.startsWith("CREATE TABLE")) {
            return true;
        }
        return false;
    }

    private static void saveSql(List<TableModel> tableList, String savePath) {

        String sqlStr = "";
        for (TableModel table : tableList) {
            sqlStr += table.getTriggerInsert() + "\n\n";
            sqlStr += table.getTriggerUpdate() + "\n\n";
        }

        CommonUtil.byte2File(sqlStr.getBytes(), savePath);
    }
}
