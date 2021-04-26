package com.zrzhen.umlsql.db2uml;


public class Db2ddlBuilder {

    Db2ddl db2ddl;

    public Db2ddlBuilder() {
        db2ddl = new Db2ddl();
    }

    public Db2ddl build() {
        return db2ddl;
    }

    public Db2ddlBuilder setTables(String... tables) {
        db2ddl.setTables(tables);
        return this;
    }

    public Db2ddlBuilder setDbName(String dbName) {
        db2ddl.setDbName(dbName);
        return this;
    }

    public Db2ddlBuilder setDriverName(String driverName) {
        db2ddl.setDriverName(driverName);
        return this;
    }

    public Db2ddlBuilder setJdbcAddress(String jdbcAddress) {
        db2ddl.setJdbcAddress(jdbcAddress);
        return this;
    }

    public Db2ddlBuilder setJdbcUsername(String jdbcUsername) {
        db2ddl.setJdbcUsername(jdbcUsername);
        return this;
    }

    public Db2ddlBuilder setJdbcPassword(String jdbcPassword) {
        db2ddl.setJdbcPassword(jdbcPassword);
        return this;
    }

    public Db2ddlBuilder setSaveDdlDir(String saveDdlDir) {
        db2ddl.setSaveDdlDir(saveDdlDir);
        return this;
    }

}

