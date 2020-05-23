package com.zrzhen.umlsql;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class OdsTableBuilder {
    public static void main(String[] args) throws IOException {
        String filePath = "E:\\github\\umlsql\\umlsql\\uml\\cdz.sql";
        String savePath = "E:\\github\\umlsql\\umlsql\\uml\\ods_cdz.sql";

        List<Table> tableList = bufferedReader(filePath);
        String sqlStr = "";
        for (Table table : tableList) {
            sqlStr += table.getBuildSql() + "\n\n";
        }

        byte2File(sqlStr.getBytes(), savePath);

        System.out.println(sqlStr);

    }


    public static List<Table> bufferedReader(String filePath) {
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

                            String buildSql = "CREATE TABLE `ods_" + name + "` (\n `pk` bigint(64) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ods主键',\n" + columns + "\nPRIMARY KEY (`pk`) USING BTREE \n)  ENGINE="
                                    + table.getEngine() + " CHARSET=" + table.getCharset() + " COMMENT='" + comment + "';";

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
