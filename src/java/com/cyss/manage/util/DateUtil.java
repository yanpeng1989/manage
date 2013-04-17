/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Administrator
 */
public class DateUtil {
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyMMddmmss");
    public static String getDateSequence(){
        return sdf.format(new Date());
    }
}
