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
    <title>客户关怀</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 客户相关 <span
        class="c-gray en">&gt;</span> 客户关怀 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<div class="cl pd-5 bg-1 bk-gray"><span class="l"> <a
        class="btn btn-primary radius" data-title="添加关怀" onclick="add()"
        href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加关怀</a></span> <span
        class="r">共有数据：<strong>${fn:length(requestScope.cares)}</strong> 条</span></div>
<div class="mt-20">
    <table class="table table-border table-bordered table-bg table-hover table-sort">
        <thead>
        <tr class="text-c">
            <th width="50">ID</th>
            <th width="70">客户</th>
            <th width="100">关怀主题</th>
            <th width="100">关怀方式</th>
            <th width="70">关怀时间</th>
            <th width="60">下次关怀时间</th>
            <th width="100">备注</th>
            <th width="100">关怀人</th>
            <th width="80">操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="#request.cares">
            <tr class="text-c">
                <td>${care_id }</td>
                <td>${customer_name}</td>
                <td>${care_theme}</td>
                <td>${care_way}</td>
                <td>${care_time}</td>
                <td>${care_nexttime}</td>
                <td>${care_remark}</td>
                <td>${care_people}</td>
                <td class="f-14 td-manage"><a style="text-decoration:none" class="ml-5"
                                              onClick="edit(${care_id})"
                                              href="javascript:;" title="编辑"><i class="Hui-iconfont">
                    &#xe6df;</i></a> <a
                        style="text-decoration:none" class="ml-5"
                        onClick="del('${care_id}')"
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
            {"orderable": false, "aTargets": [8]}// 不参与排序的列
        ]
    });
    function add() {
        layer_show("添加关怀","<%=path%>/customer-care/care-dialog.action","450","400")
//        layer.alert('编辑'+care_id);
    }

    function edit(care_id) {
        layer_show("编辑关怀","<%=path%>/customer-care/care-dialog.action?care_id="+care_id,"450","400")
    }

    function del(care_id) {
        layer.confirm("确认删除吗？",{btn:['确定','取消']},function () {
            $.getJSON("<%=path%>/customer-care/delete.action?care_id=" + care_id, function (result) {
                if(result.success == true){
                    layer.msg('成功');
                    location.reload();
                }else{
                    layer.msg('失败');
                }
            })
        })
    }

    function refresh() {
        window.location.replace('<%=path%>/customer-care/list.action');
    }
</script>
</body>
</html>
