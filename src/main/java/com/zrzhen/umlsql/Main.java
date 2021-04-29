package com.zrzhen.umlsql;

import com.zrzhen.umlsql.uml2ddl.Uml2Ddl;
import com.zrzhen.umlsql.db2uml.Db2ddl;
import com.zrzhen.umlsql.db2uml.Ddl2UmlUtil;

public class Main {

    public static boolean simpleModel = true;

    public static void main(String[] args) throws Exception {

        uml2Ddl();
        //ddl2Uml();

    }


    public static void uml2Ddl() throws Exception {
        String umlFilePath = "D:\\chenanlian\\yinji\\charge-portal\\doc\\【数据模型】合作分成.puml";

        Uml2Ddl.uml2Ddl(umlFilePath, false, false);
    }

    public static void ddl2Uml() throws Exception {
        Db2ddl db2ddl = Db2ddl.config()
                .setJdbcAddress("192.168.1.7:3306")
                .setJdbcUsername("charge")
                .setJdbcPassword("Charge@123")
                .setDbName("charge")
//                .setTables("merchant",
//                        "merchant_resource",
//                        "merchant_role",
//                        "merchant_role_resource",
//                        "merchant_role_user")
                .setSaveDdlDir("D:\\chenanlian\\github\\umlsql\\uml\\")
                .build();
        String ddlPath = db2ddl.execute();
        String umlPath = Ddl2UmlUtil.transformAndSave(ddlPath);

        System.out.println("ddlPath:" + ddlPath);
        System.out.println("umlPath:" + umlPath);
    }
}
