package com.zrzhen.umlsql.core;

/**
 * 建表语句生成Ods层建表语句配置类
 */
public class OdsTriggerConfig {

    /**
     * 如果ods库与源库不在同一个库，则需要配置ods库的库名，默认为空
     */
    private String odsDbName = "";

    /**
     * 建表语句文件路径，建议以.sql为后缀
     */
    private String sqlFilePath;

    /**
     * 建表语句保存文件路径，建议以.sql为后缀
     */
    private String sqlSavePath;

    public OdsTriggerConfig() {
    }

    public OdsTriggerConfig(String sqlFilePath, String sqlSavePath) {
        this.sqlFilePath = sqlFilePath;
        this.sqlSavePath = sqlSavePath;
    }

    public String getOdsDbName() {
        return odsDbName;
    }

    public void setOdsDbName(String odsDbName) {
        this.odsDbName = odsDbName;
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
