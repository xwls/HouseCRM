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
    <title>客户分配</title>
    <style type="text/css">
        .input-text{
            width: auto;
        }
        .select{
            margin-top: 10px;
            height: 30px;
            width: 160px;
        }
        label{
            width: 60px;
            display: inline-block;
            text-align: right;
        }
        .center-horizontally{
            text-align: center;
        }
    </style>
</head>
<body>


<div class="page-container">

    <c:forEach items="${customers}" var="customer" varStatus="status">
        <input type="hidden" value="${customer.customer_id}" name="ids">
        <label>客户${status.count}：</label><input class="input-text" style="width: 160px;" type="text" readonly="readonly" name="customer_name" value="${customer.customer_name}">
    </c:forEach>
    <br>
    <label>分配给：</label><select class="select" name="user">
        <s:iterator value="#request.users" var="user">
            <option value="${user.user_id}">${user.user_name}</option>
        </s:iterator>
    </select>

    <br><br>
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
    <%--function refresh() {--%>
        <%--window.location.replace('<%=path%>/customer-source/list.action');--%>
    <%--}--%>
</script>
</body>
</html>
