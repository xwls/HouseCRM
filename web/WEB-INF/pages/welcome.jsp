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

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>

</body>
</html>
