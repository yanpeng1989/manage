/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.util;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletRequest;

/**
 *
 * @author Administrator
 */
public class SystemUtil {

    public static final String SESSION_USER_KEY = "user_obj";
    public static int NumPerPage = 19;

    public static Map<String, Object> fillRequest(ServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        for (String key : request.getParameterMap().keySet()) {
            map.put(key, request.getParameter(key));
        }
        return map;
    }
}
