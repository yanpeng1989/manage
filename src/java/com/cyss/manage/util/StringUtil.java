/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.util;

/**
 *
 * @author Administrator
 */
public class StringUtil {

    public static boolean stringIsNullOrEmpty(String str) {
        if (str == null) {
            return true;
        }
        if ("".equals(str.trim())) {
            return true;
        }
        return false;
    }

    public static String arrayConnectByChar(String[] array, char c) {
        StringBuilder sb = new StringBuilder();
        for (String item : array) {
            sb.append(item);
            sb.append(c);
        }
        sb.substring(0, sb.length() - 1);
        return sb.toString();
    }

    public static String getDoneJson(String code, String navTabId, String forwardUrl, String rel, String txt) {
        String json = "{\"statusCode\":\"" + code + "\",\"message\":\"" + txt + "\",\"navTabId\":\"" + navTabId + "\",\"rel\":\"" + rel + "\",\"callbackType\":\"\",\"forwardUrl\":\"" + forwardUrl + "\",\"confirmMsg\":\"\"}";
        return json;
    }

    public static String fillStrBefore(String str, int len, char c) {
        String temp = "";
        if (str.length() < len) {
            for (int i = 0; i < len - str.length(); i++) {
                temp += c;
            }
            temp += str;
        } else {
            temp = str;
        }
        return temp;
    }
}
