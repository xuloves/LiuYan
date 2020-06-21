package com.shixin.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * @author 今何许
 * @date 2020/6/18 16:00
 */
public class MD5Util {
    public static String md5(String str, String salt) {
        return new Md5Hash(str, salt).toString();
    }
}
