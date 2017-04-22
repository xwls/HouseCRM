<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/4/22
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="../header.jsp" %>
    <title>Title</title>
</head>
<body>
<form class="form form-horizontal" id="form-article-add">
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>收件人：</label>
        <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="customer_id" class="select">
					<option value="0">全部类型</option>
					<option value="1">帮助说明</option>
					<option value="2">新闻资讯</option>
				</select>
				</span> </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>主题：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" value="" placeholder="" id="email_theme" name="email_theme">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章摘要：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <textarea name="abstract" cols="" rows="10" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,500)"></textarea>
            <p class="textarea-numberbar"><em class="textarea-length">0</em>/500</p>
        </div>
    </div>
    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
            <button onClick="send();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe603;</i> 发送</button>
            <button onClick="save();" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 存草稿</button>
        </div>
    </div>

</form>
<%@ include file="../footer.jsp"%>
<script type="text/javascript">
    function send() {
//        window.location.href = "https://www.baidu.com";
        console.log("哈哈哈")
    }
    function save() {
//        window.location.href = "https://www.baidu.com";
        console.log("哈哈哈哈")
    }
</script>
</body>
</html>
