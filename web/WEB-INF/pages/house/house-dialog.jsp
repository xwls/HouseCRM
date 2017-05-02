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
    <title>房屋信息</title>
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
        <input type="hidden" name="house_id" value="<s:property value="#request.house.house_id"/> ">
        <div class="row">
            <label for="type_id">房屋类型：</label>
            <span class="select-box">
              <select id="type_id" class="select" size="1" name="type_id">
                <s:iterator value="#request.types" var="type">
                  <option <s:if test="#request.house.type_id == #type.type_id"> selected="selected"</s:if> value="${type_id}">${type_name}</option>
                </s:iterator>
              </select>
            </span>
        </div>
        <div class="row">
            <label for="house_address">地址：</label>
            <input id="house_address" value="<s:property value="#request.house.house_address"/>" name="house_address" type="text" placeholder="地址" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="house_price">价格：</label>
            <input id="house_price" value="<s:property value="#request.house.house_price"/>" name="house_price" type="number" placeholder="价格" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="house_ambient">环境：</label>
            <textarea id="house_ambient" class="textarea" placeholder="环境" rows="" cols="" name="house_ambient"><s:property value="#request.house.house_ambient"/></textarea>
        </div>
    </form>

    <div class="center-horizontally">
        <button id="btn-submit" style="width: 80px;" onclick="house_submit()" class="btn btn-primary">确定</button>
    </div>


</div>


<%@include file="../footer.jsp"%>
<script type="text/javascript" src="<%=path%>/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
        src="<%=path%>/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=path%>/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="<%=path%>/lib/iCheck/1.0.2/icheck.min.js"></script>
<script type="text/javascript">
    function house_submit() {
        var form = $("#link_man_form").serialize();
        var index = parent.layer.getFrameIndex(window.name);
        $.getJSON("<%=path%>/house/add.action",form,function (result) {
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
