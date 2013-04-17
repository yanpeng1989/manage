/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.util;

import java.util.List;
import java.util.Map;
import org.json.JSONArray;

/**
 *
 * @author Administrator
 */
public class JsonUtil {

    public static String ListToJson(List<Map<String, Object>> list) {
        StringBuilder sb = new StringBuilder();
        JSONArray array = new JSONArray(list);

        return array.toString();
//        for (Map<String, Object> msg : list) {
//            
//        }
//        return sb.toString();
    }

    public static String AnyListToJson(List list) {
        StringBuilder sb = new StringBuilder();
        JSONArray array = new JSONArray(list);

        return array.toString();
//        for (Map<String, Object> msg : list) {
//            
//        }
//        return sb.toString();
    }
}
