package com.zrzhen.umlsql.uml2ddl;

public class Table {
    String name;
    String comment;
    String columns;
    String engine = "InnoDB";
    String charset = "utf8mb4";

    String ddl;

    String dropDdl;

    public Table() {
    }

    public String getDropDdl() {
        return dropDdl;
    }

    public void setDropDdl(String dropDdl) {
        this.dropDdl = dropDdl;
    }

    public String getDdl() {
        return ddl;
    }

    public void setDdl(String ddl) {
        this.ddl = ddl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getColumns() {
        return columns;
    }

    public void setColumns(String columns) {
        this.columns = columns;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public String getCharset() {
        return charset;
    }

    public void setCharset(String charset) {
        this.charset = charset;
    }

    @Override
    public String toString() {
        return "Table{" +
                "name='" + name + '\'' +
                ", comment='" + comment + '\'' +
                ", columns='" + columns + '\'' +
                ", engine='" + engine + '\'' +
                ", charset='" + charset + '\'' +
                '}';
    }
}
