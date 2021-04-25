package com.zrzhen.umlsql.core;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 建表语句生成ods建表语句
 * <p>
 * String filePath = "E:\\github\\umlsql\\umlsql\\uml\\cdz.sql";
 * String savePath = "E:\\github\\umlsql\\umlsql\\uml\\ods_cdz.sql";
 * Sql2OdsConfig sql2OdsConfig = new Sql2OdsConfig(filePath, savePath);
 */
public class Ddl2OdsUtil {


    /**
     * 转换并保存
     * @param config
     * @return
     * @throws FileEmptyException
     */
    public static List<Table> transformAndSave(Ddl2OdsConfig config) throws FileEmptyException {

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

            List<Table> tableList = new ArrayList<>();

            String name = "";
            String comment = "";
            String columns = "";

            boolean matchLine = false;
            boolean nameLine = false;
            boolean end = false;
            while ((line = bufferedReader.readLine()) != null) {

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
                        String line1 = line.trim();
                        if (line1.startsWith("PRIMARY")) {
                            end = true;
                        } else if (line1.startsWith("`")) {
                            columns += line + "\n";

                        } else if (line1.contains("COMMENT=")) {
                            int aIndex = line.indexOf('\'');
                            int aLastIndex = line.lastIndexOf('\'');
                            comment = line.substring(aIndex + 1, aLastIndex);

                        } else if (end) {
                            Table table = new Table();
                            table.setName(name);
                            table.setComment(comment);
                            table.setColumns(columns);
                            tableList.add(table);

                            String buildSql = "CREATE TABLE `ods_" + name + "` (\n `pk` bigint(64) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ods主键',\n"
                                    + columns + "\nPRIMARY KEY (`pk`) USING BTREE \n)  ENGINE="
                                    + table.getEngine() + " CHARSET=" + table.getCharset() + " COMMENT='" + comment + "';\n";

                            table.setBuildSql(buildSql);

                            System.out.println(buildSql);

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
     * 匹配建表语句开头
     *
     * @param line
     * @return
     */
    private static boolean match(String line) {
        String line1 = line.trim().toUpperCase();
        if (line1.startsWith("CREATE TABLE")) {
            return true;
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
