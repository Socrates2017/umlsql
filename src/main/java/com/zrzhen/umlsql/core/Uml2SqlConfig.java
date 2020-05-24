package com.zrzhen.umlsql.core;

/**
 * uml建模文件生成建表语句配置类
 */
public class Uml2SqlConfig {

    /**
     * uml建模文件路径，建议以.uml为后缀
     */
    private String umlFilePath;

    /**
     * 建表语句保存文件路径，建议以.sql为后缀
     */
    private String sqlSavePath;

    public Uml2SqlConfig() {
    }

    public Uml2SqlConfig(String umlFilePath, String sqlSavePath) {
        this.umlFilePath = umlFilePath;
        this.sqlSavePath = sqlSavePath;
    }

    public String getUmlFilePath() {
        return umlFilePath;
    }

    public void setUmlFilePath(String umlFilePath) {
        this.umlFilePath = umlFilePath;
    }

    public String getSqlSavePath() {
        return sqlSavePath;
    }

    public void setSqlSavePath(String sqlSavePath) {
        this.sqlSavePath = sqlSavePath;
    }
}
