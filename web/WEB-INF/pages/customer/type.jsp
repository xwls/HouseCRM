<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/2/16
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="../header.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=path%>/lib/iCheck/1.0.2/skins/all.css"/>
    <title>客户类型</title>
    <style type="text/css">

    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 客户相关 <span
        class="c-gray en">&gt;</span> 客户类型 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="text-c">
        <button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
        <span>选择查询方式：</span>
        <span class="select-box inline">
		<select id="queryBy" name="queryBy" class="select">
			<option value="customer_name">客户姓名</option>
			<option value="user_name">所属员工</option>
			<option value="customer_company">客户公司</option>
		</select>
		</span>&nbsp;&nbsp;&nbsp;&nbsp;

        <input type="text" name="queryBy-input" id="queryBy-input" placeholder=" 姓名" style="width:200px" class="input-text">
        <button name="search" id="search"onclick="search()" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索
        </button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="datadel()"
                                                               class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a
            class="btn btn-primary radius" data-title="添加类型" onclick=""
            href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加类型</a></span> <span
            class="r">共有数据：<strong>12</strong> 条</span></div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="50">ID</th>
                <th width="70">类型名称</th>
                <th width="80">操作</th>
            </tr>
            </thead>
            <tbody>


            </tbody>
        </table>
    </div>

</div>
<!--_footer 作为公共模版分离出去-->
<jsp:include page="../footer.jsp"/>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=path%>/lib/My97DatePicker/4.8/WdatePicker.js"></script>
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
            {"orderable": false, "aTargets": [0, 3]}// 不参与排序的列
        ]
    });





    $(function () {

    })

    function search() {

    }


</script>
</body>
</html>