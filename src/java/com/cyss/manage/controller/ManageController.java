/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.controller;

import com.cyss.manage.service.MainPageService;
import com.cyss.manage.service.UserStateService;
import com.cyss.manage.util.JsonUtil;
import com.cyss.manage.util.StringUtil;
import com.cyss.manage.util.SystemUtil;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Administrator
 */
@Controller
public class ManageController {

    private static final Logger log = Logger.getLogger(ManageController.class);
    @Resource
    public MainPageService mainPageService;
    @Resource
    public UserStateService userStateService;

    @RequestMapping(value = "/{rootPath}", method = RequestMethod.GET)
    public String get(HttpServletRequest request, Map map, @PathVariable("rootPath") String rootPath) {
        return "/" + rootPath;
    }

    @RequestMapping(value = "/module/menu", method = RequestMethod.GET)
    public void menu(HttpServletRequest request, PrintWriter out) {
        Map<String, Object> user = (Map<String, Object>) request.getSession().getAttribute(SystemUtil.SESSION_USER_KEY);
        String json = JsonUtil.ListToJson(mainPageService.getAllMenuByLimit(user.get("role_id").toString()));
        out.print(json);
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public void indexGet(HttpServletRequest request, Map map) {
        Map<String, Object> user = (Map<String, Object>) request.getSession().getAttribute(SystemUtil.SESSION_USER_KEY);
        request.setAttribute("menu", mainPageService.getAllMenuByLimit(user.get("role_id").toString()));
    }

    @RequestMapping(value = "/test_db", method = RequestMethod.GET)
    public void testDb(HttpServletRequest request, Map map) {
        request.setAttribute("users", userStateService.getAllEmployment());
    }

    @RequestMapping(value = "/dologin", method = {RequestMethod.POST, RequestMethod.GET})
    public void doLogin(HttpServletRequest request, PrintWriter out) {
        List<Object> list = userStateService.checkLogin(request.getParameter("username"), request.getParameter("password"));
        if (Boolean.parseBoolean(list.get(0).toString())) {
            request.getSession().setAttribute(SystemUtil.SESSION_USER_KEY, list.get(1));
        }
        out.print(JsonUtil.AnyListToJson(list));
    }

    @RequestMapping(value = "/logout", method = {RequestMethod.POST, RequestMethod.GET})
    public String logout(HttpServletRequest request, Map map) {
        request.getSession().setAttribute(SystemUtil.SESSION_USER_KEY, null);
        return "/login";
    }

    @RequestMapping(value = "/module/main", method = {RequestMethod.POST, RequestMethod.GET})
    public void main(HttpServletRequest request, Map map) {
        for (String key : request.getParameterMap().keySet()) {
            String[] values = request.getParameterMap().get(key);
            System.out.println(key + ":" + StringUtil.arrayConnectByChar(values, ','));
        }
        request.setAttribute("users", userStateService.getAllEmployment());
    }
}
