package com.zrzhen.umlsql.db2uml;

import com.zrzhen.umlsql.core.CommonUtil;
import com.zrzhen.umlsql.core.FileEmptyException;
import com.zrzhen.umlsql.core.FilePath;
import com.zrzhen.umlsql.core.Table;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Ddl2UmlUtil {

    public static String transformAndSave(String ddlPath) throws FileEmptyException {

        FilePath filePath = CommonUtil.parseFilePath(ddlPath);
        String umlPath = filePath.getPath() + filePath.getName() + ".puml";


        if (ddlPath == null || ddlPath.equals("")) {
            throw new FileEmptyException("ddl file path should not be empty!");
        }
        File file = new File(ddlPath);
        if (!file.exists()) {
            throw new FileEmptyException("ddl file is not exist, file path:" + ddlPath);
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

            while ((line = bufferedReader.readLine()) != null) {

                if (match(line)) {
                    int bIndex = line.indexOf('`');
                    int bLastIndex = line.lastIndexOf('`');
                    name = line.substring(bIndex + 1, bLastIndex);
                    matchLine = true;
                    nameLine = true;
                }

                if (matchLine) {
                    if (nameLine) {
                        nameLine = false;
                    } else {
                        if (line.trim().startsWith(")")) {
                            //解析表说明
                            int bIndex = line.indexOf('\'');
                            int bLastIndex = line.lastIndexOf('\'');
                            if (bIndex > -1) {
                                comment = line.substring(bIndex + 1, bLastIndex);
                            }


                            Table table = new Table();
                            table.setName(name);
                            table.setComment(comment);
                            table.setColumns(columns);
                            tableList.add(table);
                            columns = "";
                            //单表结束
                            matchLine = false;
                        } else {
                            columns += line;
                            columns += "\n";
                        }
                    }
                }

            }

            saveSql(tableList, umlPath);

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

        return umlPath;
    }


    private static void saveSql(List<Table> tableList, String savePath) {

        String pre = "@startuml\n" +
                "\n" +
                "/'实体表'/\n" +
                "!define EntityTable(name,desc) class name as \"desc\" << (E,#FF3030) >>  #CORNSILK\n" +
                "/'子集表'/\n" +
                "!define SubsetTable(name,desc) class name as \"desc\" << (S,#FFDEAD) >>\n" +
                "/'关系表'/\n" +
                "!define RelationTable(name,desc) class name as \"desc\" << (R,#D9F4EF) >>  #D9F4EF\n" +
                "/'日志表'/\n" +
                "!define LogRecordTable(name,desc) class name as \"desc\" << (L,#8DB6CD) >>\n" +
                "/'验证表'/\n" +
                "!define CommonTable(name,desc) class name as \"desc\" << (C,#B5B5B5) >>\n" +
                "\n" +
                "\n" +
                "\n" +
                "!define varchar(x) varchar x\n" +
                "!define tinyint(x) tinyint x\n" +
                "!define smallint(x) smallint x\n" +
                "!define mediumint(x) mediumint x\n" +
                "!define int(x) int x\n" +
                "!define bigint(x) bigint x\n" +
                "!define decimal(x,y) decimal x,y\n" +
                "\n" +
                "hide methods\n" +
                "hide stereotypes\n" +
                "\n" +
                "skinparam class {\n" +
                "    BackgroundColor white\n" +
                "    ArrowColor red\n" +
                "    BorderColor MidnightBlue\n" +
                "}";

        pre += "\n\npackage 数据模型 <<Frame>> #EAEAEA{\n";
        System.out.println(pre);
        StringBuilder sqlStr = new StringBuilder(pre);

        for (Table table : tableList) {
            String c = getBuildSql(table) + "\n\n";
            System.out.println(c);
            sqlStr.append(c);
        }

        String end = "\n}\n@enduml";
        sqlStr.append(end);
        CommonUtil.byte2File(sqlStr.toString().getBytes(), savePath);
        System.out.println("成功");
    }

    private static boolean match(String line) {
        line = line.trim().toLowerCase();
        List<String> tables = new ArrayList<>();
        tables.add("CREATE TABLE");
        for (String table : tables) {
            if (line.startsWith(table.toLowerCase())) {
                return true;
            }
        }
        return false;
    }

    private static String getBuildSql(Table table) {
        String result = "EntityTable(";
        result += table.getName();
        result += ", \"";
        result += table.getComment();
        result += "\"){\n";
        result += table.getColumns();
        result += "}";
        return result;
    }
}
