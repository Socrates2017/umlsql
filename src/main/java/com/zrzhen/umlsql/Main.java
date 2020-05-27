package com.zrzhen.umlsql;

import com.zrzhen.umlsql.core.*;

public class Main {

    public static void main(String[] args) throws FileEmptyException {

        String umlFilePath = "D:\\chananlian\\private\\zetty\\cms\\doc\\cdztable.puml";
        String sqlPath = "D:\\chananlian\\private\\umlsql\\uml\\dataModel.sql";
        String odsPath = "D:\\chananlian\\private\\umlsql\\uml\\dataModel_ods.sql";
        String triggerPath = "D:\\chananlian\\private\\umlsql\\uml\\dataModel_trigger.sql";

        Uml2SqlConfig uml2SqlConfig = new Uml2SqlConfig(umlFilePath, sqlPath);
        Sql2OdsConfig sql2OdsConfig = new Sql2OdsConfig(sqlPath, odsPath);

        OdsTriggerConfig odsTriggerConfig = new OdsTriggerConfig(sqlPath, triggerPath);
        odsTriggerConfig.setOdsDbName("ods_charge");

        Uml2SqlUtil.transformAndSave(uml2SqlConfig);
        Sql2OdsUtil.transformAndSave(sql2OdsConfig);
        OdsTriggerUtil.transformAndSave(odsTriggerConfig);

    }


}
