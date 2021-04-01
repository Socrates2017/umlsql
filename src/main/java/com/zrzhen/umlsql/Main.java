package com.zrzhen.umlsql;

import com.zrzhen.umlsql.core.*;

public class Main {

    public static boolean simpleModel = true;

    public static void main(String[] args) throws FileEmptyException {

        String umlFilePath = "D:\\chenanlian\\github\\bookerhome-portal\\doc\\【物品管理】数据模型.puml";

        FilePath filePath = CommonUtil.parseFilePath(umlFilePath);


        String sqlPath = filePath.getPath() + filePath.getName() + ".sql";
        String odsPath = filePath.getPath() + filePath.getName() + "_ods.sql";
        String triggerPath = filePath.getPath() + filePath.getName() + "_trigger.sql";

        Uml2SqlConfig uml2SqlConfig = new Uml2SqlConfig(umlFilePath, sqlPath);
        Sql2OdsConfig sql2OdsConfig = new Sql2OdsConfig(sqlPath, odsPath);

        OdsTriggerConfig odsTriggerConfig = new OdsTriggerConfig(sqlPath, triggerPath);
        odsTriggerConfig.setOdsDbName("");

        Uml2SqlUtil.transformAndSave(uml2SqlConfig);
        Sql2OdsUtil.transformAndSave(sql2OdsConfig);
        OdsTriggerUtil.transformAndSave(odsTriggerConfig);

    }


}
