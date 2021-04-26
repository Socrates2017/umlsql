package com.zrzhen.umlsql.core;

public class Uml2Ddl {

    public static void uml2Ddl(String umlFilePath, Boolean genOds, Boolean genTrigger) throws Exception {
        FilePath filePath = CommonUtil.parseFilePath(umlFilePath);
        String sqlPath = filePath.getPath() + filePath.getName() + ".sql";
        String odsPath = filePath.getPath() + filePath.getName() + "_ods.sql";
        String triggerPath = filePath.getPath() + filePath.getName() + "_trigger.sql";

        Uml2DdlConfig uml2DdlConfig = new Uml2DdlConfig(umlFilePath, sqlPath);
        Ddl2OdsConfig ddl2OdsConfig = new Ddl2OdsConfig(sqlPath, odsPath);

        OdsTriggerConfig odsTriggerConfig = new OdsTriggerConfig(sqlPath, triggerPath);
        odsTriggerConfig.setOdsDbName("");

        Uml2DdlUtil.transformAndSave(uml2DdlConfig);
        if (genOds!=null&&genOds){
            Ddl2OdsUtil.transformAndSave(ddl2OdsConfig);
            if (genTrigger!=null&&genTrigger){
                OdsTriggerUtil.transformAndSave(odsTriggerConfig);
            }
        }

    }
}
