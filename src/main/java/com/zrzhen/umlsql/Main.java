package com.zrzhen.umlsql;

import com.zrzhen.umlsql.core.*;

public class Main {

    public static void main(String[] args) throws FileEmptyException {

        String umlFilePath = "E:\\github\\umlsql\\umlsql\\uml\\dataModel.puml";
        String sqlPath = "E:\\github\\umlsql\\umlsql\\uml\\dataModel.sql";
        String odsPath = "E:\\github\\umlsql\\umlsql\\uml\\dataModel_ods.sql";
        String triggerPath = "E:\\github\\umlsql\\umlsql\\uml\\dataModel_trigger.sql";

        Uml2SqlConfig uml2SqlConfig = new Uml2SqlConfig(umlFilePath, sqlPath);
        Sql2OdsConfig sql2OdsConfig = new Sql2OdsConfig(sqlPath, odsPath);

        OdsTriggerConfig odsTriggerConfig = new OdsTriggerConfig(sqlPath, triggerPath);
        odsTriggerConfig.setOdsDbName("ods_charge");

        Uml2SqlUtil.transformAndSave(uml2SqlConfig);
        Sql2OdsUtil.transformAndSave(sql2OdsConfig);
        OdsTriggerUtil.transformAndSave(odsTriggerConfig);

    }


}
