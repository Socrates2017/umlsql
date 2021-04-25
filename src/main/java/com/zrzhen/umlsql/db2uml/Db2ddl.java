package com.zrzhen.umlsql.db2uml;

import com.zrzhen.umlsql.core.FileEmptyException;

import java.io.*;
import java.sql.*;


public class Db2ddl {

    private String dbName;
    private String driverName = "com.mysql.jdbc.Driver";
    private String jdbcAddress;
    private String jdbcUsername;
    private String jdbcPassword;
    private String saveDdlDir;
    static Db2ddlBuilder db2ddlBuilder;

    public static Db2ddlBuilder config() {
        if (db2ddlBuilder == null) {
            synchronized (Db2ddl.class) {
                if (db2ddlBuilder == null) {
                    db2ddlBuilder = new Db2ddlBuilder();
                }
            }
        }
        return db2ddlBuilder;
    }


    public void setDbName(String dbName) {
        this.dbName = dbName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public void setJdbcAddress(String jdbcAddress) {
        this.jdbcAddress = jdbcAddress;
    }

    public void setJdbcUsername(String jdbcUsername) {
        this.jdbcUsername = jdbcUsername;
    }

    public void setJdbcPassword(String jdbcPassword) {
        this.jdbcPassword = jdbcPassword;
    }

    public void setSaveDdlDir(String saveDdlDir) {
        this.saveDdlDir = saveDdlDir;
    }

    public String execute() {
        String savePath = "";
        Connection con = null;
        Statement stmt = null;
        PreparedStatement pstmt = null;

        String sqlResult = "";

        try {
            Class.forName(driverName);
            con = DriverManager.getConnection("jdbc:mysql://" + jdbcAddress + "/" + dbName, jdbcUsername, jdbcPassword);
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
                    System.out.println("\n\n");
                    sqlResult += r;
                    sqlResult += "\n\n";
                }
            }

            savePath = saveDdlDir + dbName + "-ddl.sql";
            File file = new File(savePath);
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
        return savePath;
    }

}