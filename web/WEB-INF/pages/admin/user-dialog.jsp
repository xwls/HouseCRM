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
    <title>添加用户</title>
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

    <form id="user_form" name="user_form">
        <input type="hidden" name="user_id" value="<s:property value="#request.user.user_id"/> ">
        <div class="row">
            <label for="user_name">姓名：</label>
            <input id="user_name" value="<s:property value="#request.user.user_name"/>" name="user_name" type="text" placeholder="姓名" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="user_age">年龄：</label>
            <input id="user_age" value="<s:property value="#request.user.user_age"/>" name="user_age" type="number" placeholder="年龄" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="user_sex">性别：</label>
            <span class="select-box">
              <select id="user_sex" class="select" size="1" name="user_sex">
                    <option <s:if test="#request.user.user_sex == '男'"> selected="selected"</s:if> value="男">男</option>
                    <option <s:if test="#request.user.user_sex == '女'"> selected="selected"</s:if> value="女">女</option>
              </select>
            </span>
        </div>
        <div class="row">
            <label for="user_diploma">学历：</label>
            <span class="select-box">
              <select id="user_diploma" class="select" size="1" name="user_diploma">
                <option <s:if test="#request.user.user_diploma == '初中'"> selected="selected"</s:if> value="初中">初中</option>
                <option <s:if test="#request.user.user_diploma == '高中'"> selected="selected"</s:if> value="高中">高中</option>
                <option <s:if test="#request.user.user_diploma == '大专'"> selected="selected"</s:if> value="大专">大专</option>
                <option <s:if test="#request.user.user_diploma == '本科'"> selected="selected"</s:if> value="本科">本科</option>
                <option <s:if test="#request.user.user_diploma == '博士'"> selected="selected"</s:if> value="博士">博士</option>
                <option <s:if test="#request.user.user_diploma == '硕士'"> selected="selected"</s:if> value="硕士">硕士</option>
              </select>
            </span>
        </div>
        <div class="row">
            <label for="department_id">部门：</label>
            <span class="select-box">
              <select id="department_id" class="select" size="1" name="department_id">
                  <s:iterator value="#request.depts">
                    <option value="${department_id}">${department_name}</option>
                  </s:iterator>
              </select>
            </span>
        </div>
        <div class="row">
            <label for="user_tel">座机：</label>
            <input id="user_tel" value="<s:property value="#request.user.user_tel"/>" name="user_tel" type="text" placeholder="座机" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="user_mobile">手机：</label>
            <input id="user_mobile" value="<s:property value="#request.user.user_mobile"/>" name="user_mobile" type="text" placeholder="手机" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="user_num">账号：</label>
            <input id="user_num" value="<s:property value="#request.user.user_num"/>" name="user_num" type="text" placeholder="账号（用于登录）" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="user_pw">密码：</label>
            <input id="user_pw" value="<s:property value="#request.user.user_pw"/>" name="user_pw" type="password" placeholder="联系类型" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="role_id">角色：</label>
            <span class="select-box">
              <select id="role_id" class="select" size="1" name="role_id">
                  <option value="2">员工</option>
                  <option value="1">管理员</option>
              </select>
            </span>
        </div>
        <div class="row">
            <label for="user_email">邮箱：</label>
            <input id="user_email" value="<s:property value="#request.user.user_email"/>" name="user_email" type="text" placeholder="邮箱" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="user_address">家庭地址：</label>
            <input id="user_address" value="<s:property value="#request.user.user_address"/>" name="user_address" type="text" placeholder="家庭地址" class="input-text radius size-M">
        </div>
    </form>

    <div class="center-horizontally">
        <button id="btn-submit" style="width: 80px;" onclick="user_submit()" class="btn btn-primary">确定</button>
    </div>


</div>


<%@include file="../footer.jsp"%>
<script type="text/javascript" src="<%=path%>/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
        src="<%=path%>/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=path%>/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="<%=path%>/lib/iCheck/1.0.2/icheck.min.js"></script>
<script type="text/javascript">
    function user_submit() {
        var form = $("#user_form").serialize();
        var index = parent.layer.getFrameIndex(window.name);
        $.getJSON("<%=path%>/user/add.action",form,function (result) {
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
