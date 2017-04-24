<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/4/22
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <%@ include file="../header.jsp" %>
    <title>Title</title>
    <style type="text/css">
        .textarea{
            height: 160px;
        }
    </style>
</head>
<body>
<form class="form form-horizontal" id="email_form" name="email_form">
    <input type="hidden" name="email_id" value="<s:property value="#request.email.email_id"/> ">
    <%--<s:debug/>--%>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>收件人：</label>
        <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="customer_id" class="select">
                    <s:iterator value="#request.customers" var="customer">
                    <option <s:if test="#request.email.customer_id == #customer.customer_id"> selected="selected"</s:if> value="${customer.customer_id}">${customer.customer_name}</option>
                    </s:iterator>
				</select>
				</span> </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>主题：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" value="<s:property value="#request.email.email_theme"/> " placeholder="" id="email_theme" name="email_theme">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章摘要：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <textarea name="email_content" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,500)"><s:property value="#request.email.email_content"/></textarea>
            <p class="textarea-numberbar"><em class="textarea-length">0</em>/500</p>
        </div>
    </div>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
            <button onClick="send();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe603;</i> 发送</button>
            <button onClick="save();" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 存草稿</button>
        </div>
    </div>

</form>
<%@ include file="../footer.jsp"%>
<script type="text/javascript">
    function send() {
        var form = $("#email_form").serialize();
        $.post("<%=path%>/email/send.action",form,function (result) {
            console.log(result);
            if(result.success == true){
                layer.alert("发送成功")
            }else{
                layer.alert("发送失败")
            }
        })
    }
    function save() {
        var form = $("#email_form").serialize();
        $.post("<%=path%>/email/save.action",form,function (result) {
            var json = JSON.parse(result)
            console.log(json);
            if(json.success == true){
                layer.alert("保存成功")
            }else{
                layer.alert("保存失败")
            }
        })
    }
</script>
</body>
</html>
