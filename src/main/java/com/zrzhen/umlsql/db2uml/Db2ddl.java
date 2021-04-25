package com.zrzhen.umlsql.db2uml;

import java.io.*;
import java.sql.*;


public class Db2ddl {
    private static String driverName = "com.mysql.jdbc.Driver";

    private static String dbName = "charge";

    private static String dir = "D:\\chenanlian\\github\\umlsql\\uml\\";

    public static void main(String[] args) {
        Connection con = null;
        Statement stmt = null;
        PreparedStatement pstmt = null;

        String sqlResult = "";

        try {
            Class.forName(driverName);
            con = DriverManager.getConnection("jdbc:mysql://192.168.1.7:3306/" + dbName, "charge", "Charge@123");
            String sql = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '" + dbName + "' AND TABLE_TYPE ='BASE TABLE'";
            stmt = con.createStatement();
            pstmt = con.prepareStatement(sql);
            ResultSet res = stmt.executeQuery(sql);
            while (res.next()) {
                String tableName = res.getString(1);
                /*stmt = con.createStatement();*/
                if (tableName.contains("`")) continue;
                ResultSet rs = pstmt.executeQuery("show create table `" + tableName + "`");
                while (rs.next()) {
                    String r = rs.getString(2);
                    System.out.println(r);
                    System.out.println( "\n\n");
                    sqlResult += r;
                    sqlResult += "\n\n";
                }
            }

            File file = new File(dir + dbName + "-ddl.sql");
            OutputStreamWriter osw = null;
            try {
                osw = new OutputStreamWriter(new FileOutputStream(file));
                osw.write(sqlResult);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    osw.flush();
                    osw.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.exit(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}