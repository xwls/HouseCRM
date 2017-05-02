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

    <form id="link_record_form" name="link_record_form">
        <input type="hidden" name="record_id" value="<s:property value="#request.record.record_id"/> ">
        <div class="row">
            <label for="customer_id">客户名称：</label> <span class="select-box">
          <select id="customer_id" class="select" size="1" name="customer_id">
            <s:iterator value="#request.customers" var="customer">
              <option <s:if test="#request.record.customer_id == #customer.customer_id"> selected="selected"</s:if> value="${customer_id}">${customer_name}</option>
            </s:iterator>
          </select>
        </span>
        </div>
        <div class="row">
            <label for="link_type">联系类型：</label>
            <input id="link_type" value="<s:property value="#request.record.link_type"/>" name="link_type" type="text" placeholder="联系类型" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="link_theme">联系主题：</label>
            <input id="link_theme" value="<s:property value="#request.record.link_theme"/>" name="link_theme" type="text" placeholder="联系主题" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="link_nexttime">下次联系时间：</label>
            <input id="link_nexttime" value="<s:property value="#request.record.link_nexttime"/>" name="link_nexttime" type="text" placeholder="下次联系时间：" onfocus="WdatePicker({ minDate:'%y-%M-%d' })" class="input-text Wdate radius size-M">
        </div>

        <div class="row">
            <label for="link_remark">关怀备注：</label>
            <textarea id="link_remark" class="textarea" placeholder="备注" rows="" cols="" name="link_remark"><s:property value="#request.record.link_remark"/></textarea>
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
        var form = $("#link_record_form").serialize();
        var index = parent.layer.getFrameIndex(window.name);
        $.getJSON("<%=path%>/customer-link-record/add.action",form,function (result) {
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
