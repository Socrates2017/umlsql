package com.zrzhen.umlsql.uml2ddl;

import com.zrzhen.umlsql.Main;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * String filePath = "E:\\github\\zetty\\cms\\doc\\cdz.puml";
 * String savePath = "E:\\github\\umlsql\\umlsql\\uml\\cdz.sql";
 * <p>
 * Uml2TableConfig uml2TableConfig = new Uml2TableConfig(filePath, savePath);
 * <p>
 * List<Table> tableList = Uml2TableUtil.transformAndSave(uml2TableConfig);
 */
public class Uml2DdlUtil {

    /**
     * 转换并保存
     *
     * @param config
     * @return
     * @throws FileEmptyException
     */
    public static List<Table> transformAndSave(Uml2DdlConfig config) throws FileEmptyException {
        String filePath = config.getUmlFilePath();

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

            List<Table> tableList = new ArrayList<>();

            String name = "";
            String comment = "";
            String columns = "";

            boolean matchLine = false;
            boolean nameLine = false;
            boolean end = false;

            while ((line = bufferedReader.readLine()) != null) {
                if (match(line)) {
                    int cIndex = line.indexOf('(');
                    int bIndex = line.indexOf('"');
                    int bLastIndex = line.lastIndexOf('"');
                    int aIndex = line.indexOf(',');
                    name = line.substring(cIndex + 1, aIndex);
                    comment = line.substring(bIndex + 1, bLastIndex);
                    matchLine = true;
                    nameLine = true;
                }

                if (matchLine) {
                    if (nameLine) {
                        nameLine = false;
                    } else {
                        if (line.trim().startsWith("}")) {
                            end = true;
                        } else if (!end) {
                            columns += line + "\n";
                        } else if (end) {
                            Table table = new Table();
                            table.setName(name);
                            table.setComment(comment);
                            table.setColumns(columns);
                            tableList.add(table);

                            columns = CommonUtil.trimEnd(columns);

                            if (columns.endsWith("\n")) {
                                columns = columns.substring(0, columns.length() - 1);
                            }

                            String buildSql = null;
                            if (Main.simpleModel) {
                                buildSql = "CREATE TABLE `" + name + "` (\n" + columns + "\n)  ENGINE="
                                        + table.getEngine() + " CHARSET=" + table.getCharset() + " COMMENT='" + comment + "';\n";
                            } else {
                                buildSql = "CREATE TABLE `" + name + "` (\n" + columns + "\n";
                            }


                            System.out.println(buildSql);

                            table.setBuildSql(buildSql);

                            matchLine = false;
                            end = false;
                            name = "";
                            comment = "";
                            columns = "";
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

    /**
     * 是否匹配建表语句
     *
     * @param line
     * @return
     */
    private static boolean match(String line) {
        line = line.trim().toLowerCase();

        List<String> tables = new ArrayList<>();
        tables.add("EntityTable");
        tables.add("SubsetTable");
        tables.add("RelationTable");
        tables.add("LogRecordTable");
        tables.add("CommonTable");
        tables.add("DwTable");


        for (String table : tables) {
            if (line.startsWith(table.toLowerCase())) {
                return true;
            }
        }
        return false;
    }

    private static void saveSql(List<Table> tableList, String savePath) {

        String sqlStr = "";
        for (Table table : tableList) {
            sqlStr += table.getBuildSql() + "\n\n";
        }

        CommonUtil.byte2File(sqlStr.getBytes(), savePath);
    }
}
