<%--
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
    <title>草稿箱</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 邮件相关 <span
        class="c-gray en">&gt;</span> 草稿箱 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<div class="cl pd-5 bg-1 bk-gray"> <span
        class="r">共有数据：<strong>${fn:length(requestScope.linkRecords)}</strong> 条</span></div>
<div class="mt-20">
    <table class="table table-border table-bordered table-bg table-hover table-sort">
        <thead>
        <tr class="text-c">
            <th width="50">序号</th>
            <th width="70">发件人</th>
            <th width="100">收件人</th>
            <th width="100">主题</th>
            <th width="70">发送内容</th>
            <th width="60">保存时间</th>
            <th width="80">操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="#request.emails">
            <tr class="text-c">
                <td>${email_id }</td>
                <td>${user_name}</td>
                <td>${customer_name}</td>
                <td>${email_theme}</td>
                <td>${email_content}</td>
                <td>${email_time}</td>
                <td class="f-14 td-manage"><a style="text-decoration:none" class="ml-5"
                                              href="<%=path%>/email/add.action?email_id=${email_id}" title="编辑"><i class="Hui-iconfont">
                    &#xe6df;</i></a> <a
                        style="text-decoration:none" class="ml-5"
                        onClick=""
                        href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr>
        </s:iterator>


        </tbody>
    </table>
</div>
</div>
<jsp:include page="../footer.jsp"/>

<script type="text/javascript"
        src="<%=path%>/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=path%>/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="<%=path%>/lib/iCheck/1.0.2/icheck.min.js"></script>
<script type="text/javascript">
    $('.table-sort').dataTable({
        //"aaSorting": [[1, "desc"]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable": false, "aTargets": [6]}// 不参与排序的列
        ]
    });
    function allocation(care_id) {
        <%--layer_show("客户分配","<%=path%>/customer-info/allocation-dialog.action?ids="+customer_id,"300","220")--%>
        layer.alert('编辑'+care_id);
    }
    function refresh() {
        window.location.replace('<%=path%>/customer-info/allocation.action');
    }
</script>
</body>
</html>
