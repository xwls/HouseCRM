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
    <title>角色信息</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 员工相关 <span
        class="c-gray en">&gt;</span> 角色信息 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<div class="cl pd-5 bg-1 bk-gray"><span class="l"> <a
        class="btn btn-primary radius" data-title="添加" onclick=""
        href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加</a></span> <span
        class="r">共有数据：<strong>${fn:length(requestScope.roles)}</strong> 条</span></div>
<div class="mt-20">
    <table class="table table-border table-bordered table-bg table-hover table-sort">
        <thead>
        <tr class="text-c">
            <th width="50">ID</th>
            <th width="70">角色名称</th>
            <th width="100">角色等级</th>
            <th width="80">操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="#request.roles">
            <tr class="text-c">
                <td>${role_id }</td>
                <td>${role_name}</td>
                <td>${role_power}</td>
                <td class="f-14 td-manage"><a style="text-decoration:none" class="ml-5"
                                              onClick=""
                                              href="javascript:;" title="编辑"><i class="Hui-iconfont">
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
            {"orderable": false, "aTargets": [3]}// 不参与排序的列
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
