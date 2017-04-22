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

    <form id="care_form">
        <div class="row">
            <label for="care_theme">关怀主题：</label> <input id="care_theme" name="care_theme" type="text" placeholder="关怀主题" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="care_people">关怀对象：</label> <span class="select-box">
          <select id="care_people" class="select" size="1" name="demo1">
            <option value="" selected>默认select</option>
            <option value="1">菜单一</option>
            <option value="2">菜单二</option>
            <option value="3">菜单三</option>
          </select>
        </span>
        </div>
        <div class="row">
            <label for="care_nexttime">下次关怀时间：</label> <input id="care_nexttime" name="care_nexttime" type="text" placeholder="下次关怀时间：" class="input-text radius size-M">
        </div>
        <div class="row">
            <label for="care_way">关怀方式：</label> <span class="select-box">
          <select id="care_way" class="select" size="1" name="demo1">
            <option value="" selected>默认select</option>
            <option value="1">菜单一</option>
            <option value="2">菜单二</option>
            <option value="3">菜单三</option>
          </select>
        </span>
        </div>
        <div class="row">
            <label for="care_remark">关怀备注：</label>
            <%--<div class="col-xs-8">--%>
                <textarea id="care_remark" class="textarea" placeholder="备注" rows="" cols="" name=""></textarea>
            <%--</div>--%>
        </div>
    </form>

    <div class="center-horizontally">
        <button id="btn-submit" style="width: 80px;" onclick="allocate()" class="btn btn-primary">确定</button>
    </div>


</div>


<jsp:include page="../footer.jsp"/>

<script type="text/javascript"
        src="<%=path%>/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=path%>/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="<%=path%>/lib/iCheck/1.0.2/icheck.min.js"></script>
<script type="text/javascript">
    function allocate() {
        var customer_id = $("input[name='ids']").val();
        var user_id = $("select[name='user']").val();
        console.log(customer_id+"---"+user_id);
        var index = parent.layer.getFrameIndex(window.name);

        $.getJSON('<%=path%>/customer-info/allocate.action?customer_id='+customer_id+'&user_id='+user_id,function (result) {
            console.log(result);
            if (result.success == true){
                layer.msg('分配成功');
                parent.refresh();
                parent.layer.close(index);
            }else{
                layer.msg('分配失败');
            }
        })
    }
</script>
</body>
</html>
