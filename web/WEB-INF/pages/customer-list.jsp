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
    <%--<jsp:include page="header.jsp"/>--%>
    <%@include file="header.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/lib/iCheck/1.0.2/skins/all.css"/>
    <title>客户列表</title>
    <style type="text/css">
        .modal-body input {
            margin: 5px;
            width: 22%;
        }

        .modal-body label {
            display: inline-block;
            width: 50px;
            text-align: right;
        }

        .modal .lb-sex {
            width: 40px;
            text-align: left;
            padding-left: 10px;
        }

        .modal hr {
            margin-top: 6px;
            height: 1px;
            border: none;
            border-top: 1px solid #dddddd;
        }

        .modal .input-2 {
            width: 38%;
        }

        .modal .input-3 {
            width: 17%;
        }

        .modal .input-4 {
            width: 60%;
        }

        .modal #customer_info {
            margin-bottom: 0px;
        }

        .valError{
            border:solid 1px #ee5f5b ;
            border-color: rgba(238, 101, 95, 0.8);
            box-shadow:0 1px 1px rgba(0,0,0,0.075) inset,0 0 8px rgba(246, 101, 95, 0.6)
        }
        .valSuccess{
            border:solid 1px #5eb95e ;
            border-color: rgba(108, 203, 108, 0.8);
            box-shadow:0 1px 1px rgba(0,0,0,0.075) inset,0 0 8px rgba(123, 224, 123, 0.6)
        }
    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 客户相关 <span
        class="c-gray en">&gt;</span> 客户信息 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="text-c">
        <button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
        <span class="select-box inline">
		<select name="" class="select">
			<option value="0">客户类型</option>
            <s:iterator value="#request.types" var="type" >
                <option value=${type.type_id}>${type.type_name}</option>
            </s:iterator>
		</select>
		</span> 日期范围：
        <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin"
               class="input-text Wdate" style="width:120px;">
        -
        <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax"
               class="input-text Wdate" style="width:120px;">
        <input type="text" name="" id="" placeholder=" 姓名" style="width:250px" class="input-text">
        <button name="" id="search" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索
        </button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="datadel()"
                                                               class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a
            class="btn btn-primary radius" data-title="添加客户" onclick="showDetail('add',0)"
            href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加客户</a></span> <span
            class="r">共有数据：<strong>${fn:length(requestScope.customers)}</strong> 条</span></div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="50">ID</th>
                <th width="70">姓名</th>
                <th width="50">性别</th>
                <th width="80">身份</th>
                <th width="70">来源</th>
                <th width="70">销售人员</th>
                <th width="60">类型</th>
                <th width="100">手机</th>
                <th width="160">邮箱</th>
                <th width="80">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.customers}" var="customer">
                <tr class="text-c">
                    <td><input type="checkbox" value="" name=""></td>
                    <td>${customer.customer_id}</td>
                    <td class="text-l"><u style="cursor:pointer" class="text-primary"
                                          onClick="showDetail('name',${customer.customer_id})"
                                          title="详细信息">${customer.customer_name}</u></td>
                    <td>${customer.customer_sex}</td>
                    <td>${customer.condition_name}</td>
                    <td>${customer.source_name}</td>
                    <td>${customer.user_name}</td>
                    <td>${customer.type_name}</td>
                    <td>${customer.customer_mobile}</td>
                    <td><a href="mailto:${customer.customer_email}">${customer.customer_email}</a></td>
                    <td class="f-14 td-manage"><a style="text-decoration:none" class="ml-5"
                                                  onClick="showDetail('edit',${customer.customer_id})"
                                                  href="javascript:;" title="编辑"><i class="Hui-iconfont">
                        &#xe6df;</i></a> <a
                            style="text-decoration:none" class="ml-5"
                            onClick="article_del(this,'${customer.customer_id}')"
                            href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
    <div id="modal-detail" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content radius">
                <div class="modal-header">
                    <h3 class="modal-title">客户详细信息</h3>
                    <a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void(0);">×</a>
                </div>
                <div class="modal-body skin-minimal">
                    <div id="customer_info" class="Huialert Huialert-info">信息状态提示</div>
                    <form id="customer_form" name="customer_form" method="post" action="#">
                        <label for="customer_name">姓名：</label><input id="customer_name" type="text"
                                                                     class=" input-text radius" placeholder="客户姓名">
                        <div style="display: inline-block"><label for="">性别：</label>
                            <input id="male" value="male" type="radio" name="sex"><label class="lb-sex" for="male">男</label>
                            <input id="female" value="female" type="radio" name="sex"><label class="lb-sex" for="female">女</label>
                        </div>
                        <br>
                        <label>身份：</label>
                        <span class="select-box inline">
                    <select id="customer_condition" name="" class="select">
                        <option value="0">客户身份</option>
                        <s:iterator value="#request.conditions" var="condition">
                            <option value=${condition.condition_id}>${condition.condition_name}</option>
                        </s:iterator>
                    </select>
                    </span>
                        <label>类型：</label>
                        <span class="select-box inline">
                    <select id="customer_type" name="" class="select">
                        <option value="0">客户类型</option>
                        <s:iterator value="#request.types" var="type">
                            <option value=${type.type_id}>${type.type_name}</option>
                        </s:iterator>
                    </select>
                    </span>
                        <label>来源：</label>
                        <span class="select-box inline">
                    <select id="customer_source" name="" class="select">
                        <option value="0">客户来源</option>
                        <s:iterator value="#request.sources" var="source">
                            <option value=${source.source_id}>${source.source_name}</option>
                        </s:iterator>
                    </select>
                    </span>
                        <hr>
                        <label for="customer_tel">手机：</label><input type="text" id="customer_tel" name="customer_tel"
                                                                    class=" input-text radius" placeholder="手机">
                        <label for="customer_mobile">电话：</label><input type="text" id="customer_mobile" name="customer_mobile"
                                                                       class=" input-text radius" placeholder="电话">
                        <label for="customer_qq">QQ：</label><input type="text" id="customer_qq"
                                                                   class=" input-text radius" placeholder="QQ">
                        <label for="customer_msn">MSN：</label><input type="text" id="customer_msn"
                                                                     class=" input-text radius" placeholder="MSN">
                        <label for="birth_day">生日：</label><input type="text" id="birth_day"
                                                                 onfocus="WdatePicker({ maxDate:'%y-%M-%d' })"
                                                                 class="input-text Wdate radius" placeholder="生日">
                        <label for="customer_job">职业：</label><input type="text" id="customer_job"
                                                                    class=" input-text radius" placeholder="职业">
                        <label for="customer_email">邮箱：</label><input type="text" id="customer_email"
                                                                      class="input-2 input-text radius"
                                                                      placeholder="邮箱">
                        <label for="customer_blog">博客：</label><input type="text" id="customer_blog"
                                                                     class="input-2 input-text radius" placeholder="博客">
                        <label for="customer_company">公司：</label><input type="text" id="customer_company"
                                                                        class="input-2 input-text radius"
                                                                        placeholder="公司">
                        <label for="customer_address">地址：</label><input type="text" id="customer_address"
                                                                        class="input-2 input-text radius"
                                                                        placeholder="地址">
                        <hr>
                        <label for="user_name">销售：</label><input type="text" id="user_name"
                                                                 class="input-3 input-text radius" placeholder="销售">
                        <label for="customer_remark">标记：</label><input type="text" id="customer_remark"
                                                                       class="input-4 input-text radius"
                                                                       placeholder="标记">
                        <div class="errorInfo" ></div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button id="btn-submit" onclick="customer_add()" class="btn btn-primary">确定</button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<jsp:include page="footer.jsp"/>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/iCheck/1.0.2/icheck.min.js"></script>
<script type="text/javascript">

    $('.table-sort').dataTable({
        "aaSorting": [[1, "desc"]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable": false, "aTargets": [0, 8]}// 不参与排序的列
        ]
    });

    function validate(){
        return $("#customer_form").validate({
            rules:{
                customer_tel:{
                    required:true,
                    minlength:3,
                    maxlength:6
                },
                customer_mobile:{
                    required:true,
                    digits:true
                },
                onsubmit:true,// 是否在提交是验证
                onfocusout:true,// 是否在获取焦点时验证
                onkeyup :false,// 是否在敲击键盘时验证
            },
            messages: {
                customer_tel: {
                    required: "必填",
                    minlength:"最小3",
                    maxlength:"最大6"
                },
                customer_mobile: {
                    required: "必填",
                    digits:"只能输数字"
                }
            },
            errorPlacement: function(error, element){
                console.log(error)
                error.appendTo($(".errorInfo"));
            }
        });
    }

    $(function () {

        //表单验证
        validate();

        //启动iCheck
        $(("[type='radio']")).iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_square-blue'
        });
        /* Modal打开之前执行*/
        $("#modal-detail").on("show.bs.modal", function () {

        });
        $("#customer_tel").bind("input propertychange",function () {
//            var value = $("#customer_tel").val();
//            if(value.length != 5){
//                $("#customer_tel").removeClass('input-text')
//                $("#customer_tel").addClass('valError')
//            }else{
//                $("#customer_tel").addClass('valSuccess')
//            }
        })
    })

    function getCustomerDetail(customer_id) {
        $.getJSON("${pageContext.request.contextPath}/customer/detail?id=" + customer_id, function (result) {
//            $.Huimodalalert(result,2000);
            console.log(result);
            if (result.customer_sex == '男') {
                $("#male").iCheck('check');
            } else {
                $("#female").iCheck('check');
            }
            $("#customer_condition").val(result.condition_id);
            $("#customer_type").val(result.type_id);
            $("#customer_name").val(result.customer_name);
            $("#customer_source").val(result.source_id);
            $("#user_name").val(result.user_name);
            $("#customer_mobile").val(result.customer_mobile);
            $("#customer_email").val(result.customer_email);
            $("#customer_qq").val(result.customer_qq);
            $("#customer_address").val(result.customer_address);
            $("#customer_remark").val(result.customer_remark);
            $("#customer_job").val(result.customer_job);
            $("#customer_blog").val(result.customer_blog);
            $("#customer_tel").val(result.customer_tel);
            $("#customer_msn").val(result.customer_msn);
            $("#birth_day").val(result.birth_day);
            $("#customer_company").val(result.customer_company);
            console.log($("#customer_info").text());
            $("#customer_info").text("客户由\"" + result.customer_addman + "\"在\"" + result.customer_addtime + "\"添加，由\"" + result.change_man + "\"在\"" + result.customer_changtime + "\"修改！");

        });
    }

    function showDetail(action,customer_id) {
        console.log(action+"--"+customer_id)
        if(action == 'add'){
            $("#customer_info").hide();
            $("#btn-submit").show();
            $('#male, #female').iCheck('enable');
            $('#male').iCheck('check');
            $('input,select,textarea',$('form[name="customer_form"]')).removeAttr('disabled');
            $('input,select,textarea',$('form[name="customer_form"]')).removeAttr('readonly');
            $('input,select,textarea',$('form[name="customer_form"]')).val("");
        }else if(action == 'name'){
            getCustomerDetail(customer_id);
            $("#customer_info").show();
            $("#btn-submit").hide();
            $('#male, #female').iCheck('disable');
            $('select',$('form[name="customer_form"]')).attr('disabled','disabled');
            $('input,textarea',$('form[name="customer_form"]')).attr('readonly',true);
            $("#birth_day").attr('disabled','disabled');
        }else if(action == 'edit'){
            getCustomerDetail(customer_id);
            $("#customer_info").show();
            $("#btn-submit").show();
            $('#male, #female').iCheck('enable');
            $('input,select,textarea',$('form[name="customer_form"]')).removeAttr('disabled');
            $('input,select,textarea',$('form[name="customer_form"]')).removeAttr('readonly');
        }
        $("#modal-detail").modal("show");
    }
    
    function customer_add() {
        var json = {
            "customer_name":$("#customer_name").val(),
            "customer_sex":$('#male').is(':checked')?'男':'女',
            "customer_tel":$("#customer_tel").val(),
            "customer_mobile":$("#customer_mobile").val(),
            "customer_qq":$("#customer_qq").val()
        }
        console.log(json)
        layer.alert(JSON.stringify(json));
    }

    /*资讯-添加*/
    function article_add(title, url, w, h) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*资讯-编辑*/
    function article_edit(title, url, id, w, h) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*资讯-删除*/
    function article_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function (data) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                },
                error: function (data) {
                    console.log(data.msg);
                },
            });
        });
    }

    /*资讯-审核*/
    function article_shenhe(obj, id) {
        layer.confirm('审核文章？', {
                btn: ['通过', '不通过', '取消'],
                shade: false,
                closeBtn: 0
            },
            function () {
                $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                $(obj).remove();
                layer.msg('已发布', {icon: 6, time: 1000});
            },
            function () {
                $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
                $(obj).remove();
                layer.msg('未通过', {icon: 5, time: 1000});
            });
    }
    /*资讯-下架*/
    function article_stop(obj, id) {
        layer.confirm('确认要下架吗？', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
            $(obj).remove();
            layer.msg('已下架!', {icon: 5, time: 1000});
        });
    }

    /*资讯-发布*/
    function article_start(obj, id) {
        layer.confirm('确认要发布吗？', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
            $(obj).remove();
            layer.msg('已发布!', {icon: 6, time: 1000});
        });
    }
    /*资讯-申请上线*/
    function article_shenqing(obj, id) {
        $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
        $(obj).parents("tr").find(".td-manage").html("");
        layer.msg('已提交申请，耐心等待审核!', {icon: 1, time: 2000});
    }

</script>
</body>
</html>