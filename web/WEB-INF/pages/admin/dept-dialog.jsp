<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/2/24
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <%@include file="../header.jsp" %>
    <title>部门</title>
    <style type="text/css">
        .input-text,
        .select-box,
        .textarea{
            width: 300px;
        }
        label{
            width: 100px;
            display: inline-block;
            text-align: right;
            float: left;
        }
        .center-horizontally{
            text-align: center;
        }
        .row{
            margin: 10px 0px;
        }
    </style>
</head>
<body>
<div class="page-container">
    <form id="dept_form" name="dept_form">
        <input type="hidden" name="department_id" value="<s:property value="#request.dept.department_id"/> ">
        <div class="row">
            <label for="department_name">部门名称：</label>
            <input id="department_name" value="<s:property value="#request.dept.department_name"/>" name="department_name" type="text" placeholder="部门名称" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="department_desc">部门描述：</label>
            <input id="department_desc" value="<s:property value="#request.dept.department_desc"/>" name="department_desc" type="text" placeholder="部门描述" class="input-text radius size-M">
        </div>
    </form>
    <div class="center-horizontally">
        <button id="btn-submit" style="width: 80px;" onclick="dept_submit()" class="btn btn-primary">确定</button>
    </div>
</div>
<%@include file="../footer.jsp"%>
<script type="text/javascript" src="<%=path%>/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=path%>/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    function dept_submit() {
        var form = $("#dept_form").serialize();
        var index = parent.layer.getFrameIndex(window.name);
        $.getJSON("<%=path%>/department/add.action",form,function (result) {
            if(result.success == true){
                layer.msg('成功');
                parent.refresh();
                parent.layer.close(index);
            }else{
                layer.msg('失败');
            }
        })
    }
</script>
</body>
</html>
