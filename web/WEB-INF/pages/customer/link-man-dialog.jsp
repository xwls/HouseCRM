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
    <title>添加联系记录</title>
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

    <form id="link_man_form" name="link_man_form">
        <input type="hidden" name="linkman_id" value="<s:property value="#request.linkman.linkman_id"/> ">
        <div class="row">
            <label for="customer_id">关联客户：</label>
            <span class="select-box">
              <select id="customer_id" class="select" size="1" name="customer_id">
                <s:iterator value="#request.customers" var="customer">
                  <option <s:if test="#request.linkman.customer_id == #customer.customer_id"> selected="selected"</s:if> value="${customer_id}">${customer_name}</option>
                </s:iterator>
              </select>
            </span>
        </div>
        <div class="row">
            <label for="linkman_name">联系人名称：</label>
            <input id="linkman_name" value="<s:property value="#request.linkman.linkman_name"/>" name="linkman_name" type="text" placeholder="联系类型" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="linkman_sex">联系人性别：</label>
            <span class="select-box">
              <select id="linkman_sex" class="select" size="1" name="linkman_sex">
                    <option <s:if test="#request.linkman.linkman_sex == '男'"> selected="selected"</s:if> value="男">男</option>
                    <option <s:if test="#request.linkman.linkman_sex == '女'"> selected="selected"</s:if> value="女">女</option>
              </select>
            </span>
        </div>
        <div class="row">
            <label for="linkman_age">联系人年龄：</label>
            <input id="linkman_age" value="<s:property value="#request.linkman.linkman_age"/>" name="linkman_age" type="number" placeholder="联系人年龄" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="linkman_job">联系人职位：</label>
            <input id="linkman_job" value="<s:property value="#request.linkman.linkman_job"/>" name="linkman_job" type="text" placeholder="联系人职位" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="linkman_mobile">联系人手机：</label>
            <input id="linkman_mobile" value="<s:property value="#request.linkman.linkman_mobile"/>" name="linkman_mobile" type="text" placeholder="联系人手机" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="linkman_relation">与客户关系：</label>
            <input id="linkman_relation" value="<s:property value="#request.linkman.linkman_relation"/>" name="linkman_relation" type="text" placeholder="与客户关系" class="input-text radius size-M">
        </div>
    </form>

    <div class="center-horizontally">
        <button id="btn-submit" style="width: 80px;" onclick="care_submit()" class="btn btn-primary">确定</button>
    </div>


</div>


<%@include file="../footer.jsp"%>
<script type="text/javascript" src="<%=path%>/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
        src="<%=path%>/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=path%>/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="<%=path%>/lib/iCheck/1.0.2/icheck.min.js"></script>
<script type="text/javascript">
    function care_submit() {
        var form = $("#link_man_form").serialize();
        var index = parent.layer.getFrameIndex(window.name);
        $.getJSON("<%=path%>/customer-link-man/add.action",form,function (result) {
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
