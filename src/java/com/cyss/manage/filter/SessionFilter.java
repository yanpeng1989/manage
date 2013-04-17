/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.filter;

import com.cyss.manage.util.SystemUtil;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class SessionFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        String url = req.getRequestURL().toString();
        if (url.indexOf("dologin.do") != -1) {
            chain.doFilter(request, response);
        } else if (url.indexOf("register.do") != -1) {
            chain.doFilter(request, response);
        } else if (url.indexOf("test_db.do") != -1) {
            chain.doFilter(request, response);
        } else if (url.indexOf("logout.do") != -1) {
            chain.doFilter(request, response);
        } else {
            if (req.getSession().getAttribute(SystemUtil.SESSION_USER_KEY) != null) {
                chain.doFilter(request, response);
            } else {
                HttpServletResponse res = (HttpServletResponse) response;
                res.sendRedirect("/manage/logout.do");
            }
        }
    }

    @Override
    public void destroy() {
    }
}
