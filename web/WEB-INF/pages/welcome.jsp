<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/2/15
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String localName = request.getLocalName();
    String localAddr = request.getLocalAddr();
    String remoteHost = request.getRemoteHost();
    String remoteAddr = request.getRemoteAddr();
    String serverName = request.getServerName();
    System.out.println(localName+"--"+localAddr+"--"+remoteAddr+"--"+remoteHost+"--"+serverName);
%>
<!DOCTYPE HTML>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <title>我的桌面</title>
</head>
<body>
<div class="page-container">
    <p class="f-20 text-success">欢迎您：<s:property value="#session.userInfo.user_name"/> </p>
    <div class="panel panel-default f-l ml-10" style="width: 48%">
        <div class="panel-header">关怀提醒</div>
        <div class="panel-body">
            <table class="table table-border table-bordered table-hover">
                <thead>
                <tr class="text-c">
                    <th width="50">关怀对象</th>
                    <th width="70">关怀主题</th>
                    <th width="100">关怀时间</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="#request.customerCares">
                    <tr>
                        <td>${customer_name}</td>
                        <td>${care_theme}</td>
                        <td>${care_nexttime}</td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel panel-default f-l ml-10" style="width: 48%">
        <div class="panel-header">联系提醒</div>
        <div class="panel-body">
            <table class="table table-border table-bordered table-hover">
                <thead>
                <tr class="text-c">
                    <th width="50">联系对象</th>
                    <th width="80">联系主题</th>
                    <th width="80">联系方式</th>
                    <th width="100">应联系时间</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="#request.linkRecords">
                    <tr>
                        <td>${customer_name}</td>
                        <td>${link_theme}</td>
                        <td>${link_type}</td>
                        <td>${link_nexttime}</td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel panel-default f-l ml-10 mt-10" style="width: 48%">
        <div class="panel-header">有效公告</div>
        <div class="panel-body">
            <table class="table table-border table-bordered table-hover">
                <thead>
                <tr class="text-c">
                    <th width="50">公告主题</th>
                    <th width="100">公告内容</th>
                    <th width="70">截止时间</th>
                    <th width="50">公告人</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="#request.notices">
                    <tr>
                        <td>${notice_item}</td>
                        <td>${notice_content}</td>
                        <td>${notice_endtime}</td>
                        <td>${user_name}</td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel panel-default f-l ml-10 mt-10" style="width: 48%">
        <div class="panel-header">生日提醒</div>
        <div class="panel-body">
            <table class="table table-border table-bordered table-hover">
                <thead>
                <tr class="text-c">
                    <th width="50">客户姓名</th>
                    <th width="100">生日</th>
                    <th width="70">手机号</th>
                    <th width="50">客户状态</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="#request.birthdays">
                    <tr>
                        <td>${customer_name}</td>
                        <td>${birth_day}</td>
                        <td>${customer_mobile}</td>
                        <td>${condition_name}</td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>

</body>
</html>
