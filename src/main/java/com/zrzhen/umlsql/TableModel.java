package com.zrzhen.umlsql;

import java.util.List;

public class TableModel {
    String tableName;
    List<String> columnNames;
    String triggerInsert;
    String triggerUpdate;

    public String getTriggerInsert() {
        return triggerInsert;
    }

    public void setTriggerInsert(String triggerInsert) {
        this.triggerInsert = triggerInsert;
    }

    public String getTriggerUpdate() {
        return triggerUpdate;
    }

    public void setTriggerUpdate(String triggerUpdate) {
        this.triggerUpdate = triggerUpdate;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public List<String> getColumnNames() {
        return columnNames;
    }

    public void setColumnNames(List<String> columnNames) {
        this.columnNames = columnNames;
    }
}
