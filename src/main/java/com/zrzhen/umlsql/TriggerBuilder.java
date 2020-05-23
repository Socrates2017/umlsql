package com.zrzhen.umlsql;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class TriggerBuilder {

    static String odsDbName = "ods_charge";

    public static void main(String[] args) throws IOException {
        String filePath = "E:\\github\\umlsql\\umlsql\\uml\\cdz.sql";
        String savePath = "E:\\github\\umlsql\\umlsql\\uml\\cdzTrigger.sql";


        List<TableModel> tableList = bufferedReader(filePath);
        String sqlStr = "";
        for (TableModel table : tableList) {
            sqlStr += table.getTriggerInsert() + "\n\n";
            sqlStr += table.getTriggerUpdate() + "\n\n";
        }

        byte2File(sqlStr.getBytes(), savePath);

        System.out.println(sqlStr);

    }


    public static List<TableModel> bufferedReader(String filePath) {
        File file = new File(filePath);
        if (!file.exists()) {
            System.out.println("File is not exist, file path:" + filePath);
            return null;
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


                            String triggerInsert = "CREATE trigger " + name + "_insert  after insert on " + name
                                    + " for each row \n begin\n insert into " + odsDbName + ".ods_" + name + "(";
                            String triggerUpdate = "CREATE trigger " + name + "_update  after update on " + name
                                    + " for each row \n begin\n insert into " + odsDbName + ".ods_" + name + "(";

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
                            triggerInsert += ");\nend;";


                            triggerUpdate += ") \n" + values;
                            triggerUpdate += ");\nend;";

                            table.setTriggerInsert(triggerInsert);
                            table.setTriggerUpdate(triggerUpdate);

                            tableList.add(table);

                            matchLine = false;
                            end = false;
                            name = "";
                            columnNames = new ArrayList<>();
                        }
                    }
                }

            }

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

    public static boolean match(String line) {
        String line1 = line.trim().toUpperCase();
        if (line1.startsWith("CREATE TABLE")) {
            return true;
        }
        return false;
    }

    /**
     * 保存字节数组到磁盘上
     *
     * @param bytes 要保存的字节数组
     * @param path  保存的路径，绝对路径
     * @return true：保存成功；false：保存失败
     */
    public static boolean byte2File(byte[] bytes, String path) {
        FileOutputStream out = null;
        try {
            out = new FileOutputStream(path, false);
            out.write(bytes);
            return true;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return false;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }
}
