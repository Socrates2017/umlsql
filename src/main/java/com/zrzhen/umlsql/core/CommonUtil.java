package com.zrzhen.umlsql.core;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * 公共工具类
 */
public class CommonUtil {

    /**
     * 去除字符串最后面的空格
     *
     * @param string
     * @return
     */
    public static String trimEnd(String string) {

        while (string.endsWith(" ")) {
            string = string.substring(0, string.length() - 1);
        }
        return string;
    }

    /**
     * 保存字节数组到磁盘上
     *
     * @param bytes 要保存的字节数组
     * @param path  保存的路径，绝对路径
     * @return true：保存成功；false：保存失败
     */
    public static boolean byte2File(byte[] bytes, String path) {
        FileOutputStream out = null;
        try {
            out = new FileOutputStream(path, false);
            out.write(bytes);
            return true;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return false;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }
}
