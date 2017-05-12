<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/3/8
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <%@ include file="../header.jsp"%>
    <title>用户列表</title>
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span> 员工相关
    <span class="c-gray en">&gt;</span> 员工信息
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新">
        <i class="Hui-iconfont">&#xe68f;</i>
    </a>
</nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a class="btn btn-primary radius" data-title="添加员工" onclick="add()" href="javascript:;">
                <i class="Hui-iconfont">&#xe600;</i> 添加员工
            </a>
        </span>
        <span class="r">共有数据：<strong>${fn:length(requestScope.users)}</strong> 条</span></div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c">
                <th width="30">ID</th>
                <th width="70">姓名</th>
                <th width="40">性别</th>
                <th width="40">年龄</th>
                <th width="70">部门</th>
                <th width="60">角色</th>
                <th width="40">学历</th>
                <th width="80">家庭住址</th>
                <th width="80">手机</th>
                <th width="80">电话</th>
                <th width="120">邮箱</th>
                <th width="80">操作</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="#request.users">
                <tr class="text-c">
                    <td>${user_id }</td>
                    <td>${user_name}</td>
                    <td>${user_sex}</td>
                    <td>${user_age}</td>
                    <td>${department_name}</td>
                    <td>${role_name}</td>
                    <td>${user_diploma}</td>
                    <td>${user_address}</td>
                    <td>${user_mobile}</td>
                    <td>${user_tel}</td>
                    <td>${user_email}</td>
                    <td class="f-14 td-manage">
                        <a style="text-decoration:none" class="ml-5" onClick="edit('${user_id}')" href="javascript:;" title="编辑">
                            <i class="Hui-iconfont">&#xe6df;</i>
                        </a>
                        <a style="text-decoration:none" class="ml-5" onClick="del('${user_id}')" href="javascript:;" title="删除">
                            <i class="Hui-iconfont">&#xe6e2;</i>
                        </a>
                    </td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </div>

</div>
    <%@ include file="../footer.jsp"%>
<script type="text/javascript" src="<%=path%>/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript">

    $('.table-sort').dataTable({
        //"aaSorting": [[1, "desc"]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable": false, "aTargets": [0, 11]}// 不参与排序的列
        ]
    });

    $(function () {

    })

    function add() {
        layer_show("添加用户","<%=path%>/user/dialog.action","450","600")
    }

    function edit(user_id) {
        layer_show("编辑用户","<%=path%>/user/dialog.action?user_id="+user_id,"450","600")
    }

    function del(user_id) {
        layer.confirm("确认删除吗？",{btn:['确定','取消']},function () {
            $.getJSON("<%=path%>/user/delete.action?user_id=" + user_id, function (result) {
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
        window.location.replace('<%=path%>/user/list.action');
    }
</script>
</body>
</html>
