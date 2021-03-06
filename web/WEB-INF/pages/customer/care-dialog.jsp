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
    <title>添加关怀</title>
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

    <form id="care_form" name="care_form">
        <input type="hidden" name="care_id" value="<s:property value="#request.care.care_id"/> ">
        <div class="row">
            <label for="care_theme">关怀主题：</label>
            <input id="care_theme" value="<s:property value="#request.care.care_theme"/>" name="care_theme" type="text" placeholder="关怀主题" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="customer_id">关怀对象：</label> <span class="select-box">
          <select id="customer_id" class="select" size="1" name="customer_id">
            <s:iterator value="#request.customers" var="customer">
              <option <s:if test="#request.care.customer_id == #customer.customer_id"> selected="selected"</s:if> value="${customer_id}">${customer_name}</option>
            </s:iterator>
          </select>
        </span>
        </div>
        <div class="row">
            <label for="care_nexttime">下次关怀时间：</label>
            <input id="care_nexttime" value="<s:property value="#request.care.care_nexttime"/>" name="care_nexttime" type="text" placeholder="下次关怀时间：" onfocus="WdatePicker({ minDate:'%y-%M-%d' })" class="input-text Wdate radius size-M">
        </div>
        <div class="row">
            <label for="care_way">关怀方式：</label> <span class="select-box">
          <select id="care_way" class="select" size="1" name="care_way">
            <option <s:if test="#request.care.care_way == '发短信'"> selected="selected"</s:if> value="发短信">发短信</option>
            <option <s:if test="#request.care.care_way == '送礼品'"> selected="selected"</s:if> value="送礼品">送礼品</option>
            <option <s:if test="#request.care.care_way == '电话问候'"> selected="selected"</s:if> value="电话问候">电话问候</option>
            <option <s:if test="#request.care.care_way == '上门拜访'"> selected="selected"</s:if> value="上门拜访">上门拜访</option>
            <option <s:if test="#request.care.care_way == '其他'"> selected="selected"</s:if> value="其他">其他</option>
          </select>
        </span>
        </div>
        <div class="row">
            <label for="care_remark">关怀备注：</label>
            <%--<div class="col-xs-8">--%>
                <textarea id="care_remark" class="textarea" placeholder="备注" rows="" cols="" name="care_remark"><s:property value="#request.care.care_remark"/></textarea>
            <%--</div>--%>
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
        var form = $("#care_form").serialize();
        var index = parent.layer.getFrameIndex(window.name);
        $.getJSON("<%=path%>/customer-care/add.action",form,function (result) {
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
