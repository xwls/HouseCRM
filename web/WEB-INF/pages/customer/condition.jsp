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
    <title>客户状态</title>
    <style type="text/css">
        label.error {
            position: relative;
            left: 330px;
            top: -27px;
            color: #ef392b;
            font-size: 12px;
            text-align: right;
            width: 128px;
        }
        label{
            display: block;
        }
    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 客户相关 <span
        class="c-gray en">&gt;</span> 客户状态 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

    <div class="cl pd-5 bg-1 bk-gray"><span class="l"> <a
            class="btn btn-primary radius" data-title="添加状态" onclick="showModal('add',0)"
            href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加状态</a></span> <span
            class="r">共有数据：<strong>${fn:length(requestScope.conditions)}</strong> 条</span></div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c">
                <th width="50">ID</th>
                <th width="70">状态名称</th>
                <th width="50">状态说明</th>
                <th width="80">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.conditions}" var="condition">
                <tr class="text-c">
                    <td>${condition.condition_id}</td>
                    <td>${condition.condition_name}</td>
                    <td>${condition.condition_explain}</td>
                    <td class="f-14 td-manage"><a style="text-decoration:none" class="ml-5"
                                                  onClick="showModal('edit',${condition.condition_id})"
                                                  href="javascript:;" title="编辑"><i class="Hui-iconfont">
                        &#xe6df;</i></a> <a
                            style="text-decoration:none" class="ml-5"
                            onClick=""
                            href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
    <div id="modal-detail" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content radius" style="width: 500px;">
                <div class="modal-header">
                    <h3 class="modal-title">编辑客户状态</h3>
                    <a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void(0);">×</a>
                </div>
                <div class="modal-body skin-minimal">
                    <form id="dondition_form" name="condition_form" method="post" action="#">
                        <input type="hidden" id="condition_id" name="condition_id">
                        <label for="condition_name">类型名称</label><input type="text" id="condition_name" name="condition_name" class=" input-text" placeholder="状态名称">
                        <label for="condition_explain">类名描述</label><input type="text" id="condition_explain" name="condition_explain" class=" input-text" placeholder="状态描述">
                    </form>
                </div>
                <div class="modal-footer">
                    <button id="btn-submit" onclick="modalSubmit()" class="btn btn-primary">确定</button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                </div>
            </div>
        </div>
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
            {"orderable": false, "aTargets": [3]}// 不参与排序的列
        ]
    });





    $(function () {
        validate();
    })

    function validate() {
        return $('#dondition_form').validate({
            rules:{
                condition_name:{
                    required:true,
                    minlength:2,
                    maxlength:8,
                },
                condition_explain:{
                    required:true,
                    minlength:2,
                    maxlength:12,
                },
                onsubmit:true,// 是否在提交是验证
                onfocusout:true,// 是否在获取焦点时验证
                onkeyup :true,// 是否在敲击键盘时验证
            },
            message:{
                condition_name:{
                    required:'必须填写',
                    minlength:'至少2个字符',
                    maxlength:'最多8个字符',
                },
                condition_explain:{
                    required:'必须填写',
                    minlength:'至少2个字符',
                    maxlength:'最多12个字符',
                }
            }
        })
    }

    function modalSubmit() {
        var validate = $('#dondition_form').validate();
        if(!validate.form()){
            layer.msg('数据格式有误，请修改后再试',{icon: 2})
            return;
        }
        var form = $('#dondition_form').serialize();
        var condition_id = $("#condition_id").val();
        var url;
        if (condition_id == ''){
            url = "<%=path%>/customer-condition/add.action";
        }else{
            url = "<%=path%>/customer-condition/update.action";
        }
        $.getJSON(url,form,function (result) {
            console.log(result.success);
            $("#modal-detail").modal("hide");
            location.reload();
        })
    }

    function showModal(action,condition_id) {
        var validate = $('#dondition_form').validate();
        validate.resetForm();
        $("#condition_name").removeClass('error');
        $("#condition_explain").removeClass('error');
        if (action == 'add'){
            $(".modal-title").text("添加客户状态");
            $("#condition_id").val('');
            $("#condition_name").val('');
            $("#condition_explain").val('');
        }else if(action == 'edit'){
            $(".modal-title").text("编辑客户状态");
            layer.load();
            $.getJSON('<%=path%>/customer-condition/getById.action?condition_id='+condition_id,function (result) {
                $("#condition_id").val(result.condition_id);
                $("#condition_name").val(result.condition_name);
                $("#condition_explain").val(result.condition_explain);
                layer.closeAll('loading');
            })
        }
        $("#modal-detail").modal("show");
    }


</script>
</body>
</html>