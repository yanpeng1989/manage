<%-- 
    Document   : index
    Created on : 2013-3-23, 10:21:09
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link href="<c:url value='/themes/default/style.css' />" rel="stylesheet" type="text/css" media="screen"/>
        <link href="<c:url value='/themes/css/core.css' />" rel="stylesheet" type="text/css" media="screen"/>
        <link href="<c:url value='/themes/css/print.css' />" rel="stylesheet" type="text/css" media="print"/>
        <link href="<c:url value='/uploadify/css/uploadify.css' />" rel="stylesheet" type="text/css" media="screen"/>
        <script src="<c:url value='scripts/json2.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/jquery-1.7.2.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/jquery.cookie.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/jquery.validate.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/jquery.bgiframe.js' />" type="text/javascript"></script>
        <script src="<c:url value='xheditor/xheditor-1.1.14-zh-cn.min.js' />" type="text/javascript"></script>
        <script src="<c:url value='uploadify/scripts/jquery.uploadify.js' />" type="text/javascript"></script>

        <!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
        <script type="text/javascript" src="<c:url value='chart/raphael.js' />"></script>
        <script type="text/javascript" src="<c:url value='chart/g.raphael.js' />"></script>
        <script type="text/javascript" src="<c:url value='chart/g.bar.js' />"></script>
        <script type="text/javascript" src="<c:url value='chart/g.line.js' />"></script>
        <script type="text/javascript" src="<c:url value='chart/g.pie.js' />"></script>
        <script type="text/javascript" src="<c:url value='chart/g.dot.js' />"></script>

        <script src="<c:url value='scripts/dwz.core.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.util.date.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.validate.method.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.regional.zh.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.barDrag.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.drag.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.tree.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.accordion.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.ui.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.theme.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.switchEnv.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.alertMsg.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.contextmenu.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.navTab.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.tab.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.resize.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.dialog.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.dialogDrag.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.sortDrag.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.cssTable.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.stable.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.taskBar.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.ajax.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.pagination.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.database.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.datepicker.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.effects.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.panel.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.checkbox.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.history.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.combox.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.print.js' />" type="text/javascript"></script>
        <script src="<c:url value='/scripts/cyss/frame.js' />" type="text/javascript"></script>
        <script src="<c:url value='/scripts/cyss/index.js' />" type="text/javascript"></script>
        <script src="<c:url value='scripts/dwz.regional.zh.js' />" type="text/javascript"></script>
        <style type="text/css">
            html, body{
                margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
            }
        </style>
    </head>
    <body>
        <!--Layout-->
        <div id="layout" style="width:100%;height:100%;">
            <div id="header" height="85">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="57" background="<c:url value="/images/main_02.gif" />"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="110" height="57" background="<c:url value="/images/main_01.gif" />">&nbsp;</td>
                                    <td><table width="743" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td height="28" background="<c:url value="/images/main_03.gif" />">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="61" height="29" background="<c:url value="/images/main_06.gif" />">&nbsp;</td>
                                                            <td width="72"><a href="#"><img src="<c:url value="/images/main_07.gif" />" name="Image1" width="72" height="29" border="0" id="Image1" onmouseover="MM_swapImage('Image1','','<c:url value="/images/main_07_1.gif" />',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                                                            <td width="72"><a href="#"><img src="<c:url value="/images/main_08.gif" />" name="Image2" width="72" height="29" border="0" id="Image2" onmouseover="MM_swapImage('Image2','','<c:url value="/images/main_08_1.gif" />',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                                                            <td width="292" background="<c:url value="/images/main_09.gif" />">&nbsp;</td>
                                                            <td width="40"><a href="#"><img src="<c:url value="/images/main_10.gif" />" name="Image3" width="40" height="29" border="0" id="Image3" onmouseover="MM_swapImage('Image3','','<c:url value="/images/main_10_1.gif" />',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                                                            <td width="44"><a href="#"><img src="<c:url value="/images/main_11.gif" />" name="Image4" width="44" height="29" border="0" id="Image4" onmouseover="MM_swapImage('Image4','','<c:url value="/images/main_11_1.gif" />',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                                                            <td width="43"><a href="#"><img src="<c:url value="/images/main_12.gif" />" name="Image5" width="43" height="29" border="0" id="Image5" onmouseover="MM_swapImage('Image5','','<c:url value="/images/main_12_1.gif" />',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                                                            <td width="44"><a href="#"><img src="<c:url value="/images/main_13.gif" />" name="Image6" width="44" height="29" border="0" id="Image6" onmouseover="MM_swapImage('Image6','','<c:url value="/images/main_13_1.gif" />',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                                                            <td width="39"><a href="<c:url value="/logout.do" />"><img src="<c:url value="/images/main_14.gif" />" name="Image7" width="39" height="29" border="0" id="Image7" onmouseover="MM_swapImage('Image7','','<c:url value="/images/main_14_1.gif" />',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                                                            <td width="36"><img src="<c:url value="/images/main_15.gif" />" width="36" height="29" /></td>
                                                        </tr>
                                                    </table></td>
                                            </tr>
                                        </table></td>
                                    <td width="102" background="<c:url value="/images/main_05.gif" />">&nbsp;</td>
                                </tr>
                            </table></td>
                    </tr>
                    <tr>
                        <td height="26" background="<c:url value="/images/main_18.gif" />"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="180" height="26" background="<c:url value="/images/main_16.gif" />">&nbsp;</td>
                                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="76" height="23" valign="bottom"></td>
                                                <td width="76" valign="bottom"></td>
                                                <td width="76" valign="bottom"></td>
                                                <td valign="bottom">&nbsp;</td>
                                            </tr>
                                        </table></td>
                                    <td width="200"><img src="<c:url value="/images/user.gif" />" width="10" height="10" /> <span class="STYLE1">欢迎您:admin  角色:管理员</span></td>
                                </tr>
                            </table></td>
                    </tr>
                </table>
            </div>
            <div id="leftside">
                <div id="sidebar_s">
                    <div class="collapse">
                        <div class="toggleCollapse"><div></div></div>
                    </div>
                </div>
                <div id="sidebar">
                    <div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
                    <div class="accordion" fillSpace="sidebar">

                        <c:forEach items="${menu}" var="menu_item">
                            <c:if test="${menu_item.pm_id == 0}">
                                <div class="accordionHeader">
                                    <h2><span>Folder</span> ${menu_item.menu_name}</h2>
                                </div>
                                <div class="accordionContent">
                                    <ul class="tree treeFolder">
                                        <c:forEach items="${menu}" var="menu_item1">
                                            <c:if test="${menu_item1.pm_id == menu_item.menu_id}">
                                                <li>
                                                    <c:if test="${menu_item1.url == '#'}">
                                                        <a>${menu_item1.menu_name}</a>
                                                    </c:if>
                                                    <c:if test="${menu_item1.url != '#'}">
                                                        <a href="${menu_item1.url}" target="navTab" rel="${menu_item1.menu_name}">${menu_item1.menu_name}</a>
                                                    </c:if>
                                                    <c:set var="flag" value="0"></c:set>
                                                    <c:forEach items="${menu}" var="menu_item2">
                                                        <c:if test="${menu_item2.pm_id == menu_item1.menu_id}">
                                                            <c:set var="flag" value="1"></c:set>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${flag == 1}">
                                                        <ul>
                                                            <c:forEach items="${menu}" var="menu_item2">
                                                                <c:if test="${menu_item2.pm_id == menu_item1.menu_id}">
                                                                    <c:if test="${menu_item2.url == '#'}">
                                                                        <a>${menu_item2.menu_name}</a>
                                                                    </c:if>
                                                                    <c:if test="${menu_item2.url != '#'}">
                                                                        <a href="${menu_item2.url}" target="navTab" rel="${menu_item2.menu_name}">${menu_item2.menu_name}</a>
                                                                    </c:if>
                                                                </c:if>
                                                            </c:forEach>
                                                        </ul>   
                                                    </c:if>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>        
            </div>
            <div id="container">
                <div id="navTab" class="tabsPage">
                    <div class="tabsPageHeader">
                        <div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
                            <ul class="navTab-tab">
                                <!--                                <li tabid="main1" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>-->
                            </ul>
                        </div>
                        <div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
                        <div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
                        <div class="tabsMore">more</div>
                    </div>
                    <ul class="tabsMoreList">
                        <li><a href="javascript:;">我的主页</a></li>
                    </ul>
                    <div class="navTab-panel tabsPageContent layoutBox">

                    </div>
                </div>
            </div>
            <div id="footer" height="30">
                <div align="center" width="100%">
                    Copyright © 公司版权所有 
                </div>
            </div>
        </div>   
    </body>

</html>
