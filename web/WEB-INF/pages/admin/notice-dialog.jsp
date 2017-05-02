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
    <title>添加公告</title>
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

    <form id="notice_form" name="notice_form">
        <input type="hidden" name="notice_id" value="<s:property value="#request.notice.notice_id"/> ">
        <div class="row">
            <label for="notice_item">公告主题：</label>
            <input id="notice_item" value="<s:property value="#request.notice.notice_item"/>" name="notice_item" type="text" placeholder="公告主题" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="notice_content">联系主题：</label>
            <textarea id="notice_content" class="textarea" placeholder="备注" rows="" cols="" name="notice_content"><s:property value="#request.notice.notice_content"/></textarea>
        </div>
        <div class="row">
            <label for="notice_endtime">截止时间：</label>
            <input id="notice_endtime" value="<s:property value="#request.record.notice_endtime"/>" name="notice_endtime" type="text" placeholder="截止时间：" onfocus="WdatePicker({ minDate:'%y-%M-%d' })" class="input-text Wdate radius size-M">
        </div>
    </form>

    <div class="center-horizontally">
        <button id="btn-submit" style="width: 80px;" onclick="notice_submit()" class="btn btn-primary">确定</button>
    </div>


</div>


<%@include file="../footer.jsp"%>
<script type="text/javascript" src="<%=path%>/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
        src="<%=path%>/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=path%>/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    function notice_submit() {
        var form = $("#notice_form").serialize();
        var index = parent.layer.getFrameIndex(window.name);
        $.getJSON("<%=path%>/notice/add.action",form,function (result) {
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
