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

    <div class="cl pd-5 bg-1 bk-gray"><span class="l"> <a
            class="btn btn-primary radius" data-title="添加类型" onclick="add()"
            href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加类型</a></span> <span
            class="r">共有数据：<strong>${fn:length(requestScope.types)}</strong> 条</span></div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c">
                <th width="50">ID</th>
                <th width="70">类型名称</th>
                <th width="50">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.types}" var="type">
                <tr class="text-c">
                    <td>${type.type_id}</td>
                    <td>${type.type_name}</td>
                    <td class="f-14 td-manage"><a style="text-decoration:none" class="ml-5"
                                                  onClick="edit(${type.type_id},'${type.type_name}')"
                                                  href="javascript:;" title="编辑"><i class="Hui-iconfont">
                        &#xe6df;</i></a> <a
                            style="text-decoration:none" class="ml-5"
                            onClick="del(${type.type_id},'${type.type_name}')"
                            href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                </tr>
            </c:forEach>
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
            {"orderable": false, "aTargets": [2]}// 不参与排序的列
        ]
    });


    function edit(type_id,type_name) {
        //formType：输入框类型，支持0（文本）默认1（密码）2（多行文本）
        layer.prompt({title: '修改类型名称',value:type_name, formType: 0},function(val, index){
            if(type_name == val){
                layer.msg('内容未修改');
            }else{
                $.getJSON('<%=path%>/customer-type/update.action?type_id='+type_id+'&type_name='+val,function (result) {
//                    console.log(result)
                    if (result.success == true){
                        layer.msg('修改成功');
                        refresh();
                    }else{
                        layer.msg('修改失败');
                    }
                })

            }
//            layer.msg('得到了'+val);
            layer.close(index);
        });
    }




    $(function () {

    })

    function refresh() {
        window.location.replace('<%=path%>/customer-type/list.action');
    }

    function del(type_id,type_name) {
        layer.confirm('删除类型\"'+type_name+'\"？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            $.getJSON('<%=path%>/customer-type/delete.action?type_id='+type_id,function (result) {
                if (result.success == true) {
                    layer.msg('删除成功', {icon: 1});
                    refresh();
                }else{
                    layer.msg('删除成功', {icon: 2});
                }
            })
        });
    }
    
    function dataDel() {

        var cbox = $("input[name='type_id']");
//        console.log(cbox);
        $(cbox).each(function () {
            console.log(this)
        })
    }

    function add() {
        layer.prompt({title: '添加新类型', formType: 0},function(val, index){
            $.getJSON('<%=path%>/customer-type/add.action?type_name='+val,function (result) {
//                    console.log(result)
                if (result.success == true){
                    layer.msg('添加成功');
                    refresh();
                }else{
                    layer.msg('添加失败');
                }
            })
//            layer.msg('得到了'+val);
            layer.close(index);
        });
    }


</script>
</body>
</html>