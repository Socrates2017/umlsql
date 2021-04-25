package com.zrzhen.umlsql;

import com.zrzhen.umlsql.core.*;
import com.zrzhen.umlsql.db2uml.Db2ddl;
import com.zrzhen.umlsql.db2uml.Ddl2UmlUtil;

public class Main {

    public static boolean simpleModel = true;

    public static void main(String[] args) throws Exception {

        uml2Ddl();
        //ddl2Uml();

    }


    public static void uml2Ddl() throws Exception {
        String umlFilePath = "D:\\chenanlian\\github\\bookerhome-portal\\doc\\【项目管理】数据模型.puml";

        FilePath filePath = CommonUtil.parseFilePath(umlFilePath);


        String sqlPath = filePath.getPath() + filePath.getName() + ".sql";
        String odsPath = filePath.getPath() + filePath.getName() + "_ods.sql";
        String triggerPath = filePath.getPath() + filePath.getName() + "_trigger.sql";

        Uml2DdlConfig uml2DdlConfig = new Uml2DdlConfig(umlFilePath, sqlPath);
        Ddl2OdsConfig ddl2OdsConfig = new Ddl2OdsConfig(sqlPath, odsPath);

        OdsTriggerConfig odsTriggerConfig = new OdsTriggerConfig(sqlPath, triggerPath);
        odsTriggerConfig.setOdsDbName("");

        Uml2DdlUtil.transformAndSave(uml2DdlConfig);
        Ddl2OdsUtil.transformAndSave(ddl2OdsConfig);
        OdsTriggerUtil.transformAndSave(odsTriggerConfig);
    }

    public static void ddl2Uml() throws Exception {
        Db2ddl db2ddl = Db2ddl.config()
                .setJdbcAddress("192.168.1.7:3306")
                .setJdbcUsername("charge")
                .setJdbcPassword("Charge@123")
                .setDbName("charge")
                .setSaveDdlDir("D:\\chenanlian\\github\\umlsql\\uml\\")
                .build();
        String ddlPath = db2ddl.execute();
        String umlPath = Ddl2UmlUtil.transformAndSave(ddlPath);

        System.out.println("ddlPath:" + ddlPath);
        System.out.println("umlPath:" + umlPath);
    }
}
