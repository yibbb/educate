package com.educate.util;

import java.security.MessageDigest;

/**
 * MD5加密类
 */
public class MD5Util {
    /**
     * md5加密
     * @param 需要加密的数据
     * @return 返回加密后的数据
     */
    public static String encode(String key){
        char hexDigits[]= {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        try {
            byte[] btInput=key.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst=MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            //获取密文
            byte[] md=mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j=md.length;
            char str[]=new char[j*2];
            int k=0;
            for (int i = 0; i <j ; i++) {
                byte b=md[i];
                str[k++]=hexDigits[b>>>4&0xf];
                str[k++]=hexDigits[b&0xf];
            }
            return new String(str);
        } catch (Exception e) {
            throw new RuntimeException("md5加密失败");
        }
    }
}
