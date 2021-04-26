package com.zrzhen.umlsql;

import com.zrzhen.umlsql.core.Uml2Ddl;
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

        Uml2Ddl.uml2Ddl(umlFilePath, true, true);
    }

    public static void ddl2Uml() throws Exception {
        Db2ddl db2ddl = Db2ddl.config()
                .setJdbcAddress("192.168.1.7:3306")
                .setJdbcUsername("charge")
                .setJdbcPassword("Charge@123")
                .setDbName("charge")
                //.setTables("biz_charge_gun", "biz_charge_pile")
                .setSaveDdlDir("D:\\chenanlian\\github\\umlsql\\uml\\")
                .build();
        String ddlPath = db2ddl.execute();
        String umlPath = Ddl2UmlUtil.transformAndSave(ddlPath);

        System.out.println("ddlPath:" + ddlPath);
        System.out.println("umlPath:" + umlPath);
    }
}
