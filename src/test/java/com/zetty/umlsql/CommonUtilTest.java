package com.zetty.umlsql;

import com.zrzhen.umlsql.core.CommonUtil;


public class CommonUtilTest {


    public void trimEnd() {
        String string = " xxx dd d   ";
        String expect =" xxx dd d";
        String result = CommonUtil.trimEnd(string);

        System.out.println("Original string:" + string);
        System.out.println("Result string:" + result);


    }
}
