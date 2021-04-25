package com.zrzhen.umlsql.core;

/**
 * 建表语句生成Ods层建表语句配置类
 */
public class Ddl2OdsConfig {

    /**
     * 建表语句文件路径，建议以.sql为后缀
     */
    private String sqlFilePath;

    /**
     * 建表语句保存文件路径，建议以.sql为后缀
     */
    private String sqlSavePath;

    public Ddl2OdsConfig() {
    }

    public Ddl2OdsConfig(String sqlFilePath, String sqlSavePath) {
        this.sqlFilePath = sqlFilePath;
        this.sqlSavePath = sqlSavePath;
    }

    public String getSqlFilePath() {
        return sqlFilePath;
    }

    public void setSqlFilePath(String sqlFilePath) {
        this.sqlFilePath = sqlFilePath;
    }

    public String getSqlSavePath() {
        return sqlSavePath;
    }

    public void setSqlSavePath(String sqlSavePath) {
        this.sqlSavePath = sqlSavePath;
    }
}
