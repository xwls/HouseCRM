<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/2/15
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!--_meta 作为公共模版分离出去 -->
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="WEB-INF/pages/header.jsp" %>
    <%
        Object userInfo = session.getAttribute("userInfo");
        if (userInfo == null) {
            response.sendRedirect("login.jsp");
        }
    %>
    <title>客户房屋信息关系管理系统</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <script type="text/javascript">
        function logout() {
            window.location.replace("${pageContext.request.contextPath}/user/logout.action")
        }
    </script>
</head>
<body>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl"><a class="logo navbar-logo f-l mr-10 hidden-xs" href="<%=request.getContextPath()%>/index.jsp">客户管理系统</a>
            <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="<%=request.getContextPath()%>/index.jsp">客户管理系统</a> <span
                    class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span> <a aria-hidden="false"
                                                                                  class="nav-toggle Hui-iconfont visible-xs"
                                                                                  href="javascript:;">&#xe667;</a>
            <nav class="nav navbar-nav">
                <ul class="cl">
                    <li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i
                            class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" onclick="article_add('添加资讯','article-add.html')"><i
                                    class="Hui-iconfont">&#xe616;</i> 资讯</a></li>
                            <li><a href="javascript:;" onclick="picture_add('添加资讯','picture-add.html')"><i
                                    class="Hui-iconfont">&#xe613;</i> 图片</a></li>
                            <li><a href="javascript:;" onclick="product_add('添加资讯','product-add.html')"><i
                                    class="Hui-iconfont">&#xe620;</i> 产品</a></li>
                            <li><a href="javascript:;" onclick="member_add('添加用户','member-add.html','','510')"><i
                                    class="Hui-iconfont">&#xe60d;</i> 用户</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li><s:property value="#session.userInfo.role_name"/></li>
                    <li class="dropDown dropDown_hover"><a href="#" class="dropDown_A"><s:property value="#session.userInfo.user_name"/> <%--${sessionScope.userInfo.user_name}--%> <i class="Hui-iconfont">
                        &#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="#">个人信息</a></li>
                            <li><a href="javascript:void(0)" onclick="logout()">退出</a></li>
                        </ul>
                    </li>
                    <li id="Hui-msg"><a href="#" title="消息"><%--<span class="badge badge-danger">1</span>--%><i
                            class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a></li>
                    <li id="Hui-skin" class="dropDown right dropDown_hover"><a href="javascript:;" class="dropDown_A"
                                                                               title="换肤"><i class="Hui-iconfont"
                                                                                             style="font-size:18px">
                        &#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
                            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                            <li><a href="javascript:;" data-val="orange" title="绿色">橙色</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<aside class="Hui-aside">
    <input runat="server" id="divScrollValue" type="hidden" value=""/>
    <div class="menu_dropdown bk_2">
        <dl id="menu-article">
            <dt class="selected"><i class="Hui-iconfont">&#xe616;</i> 客户相关<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd style="display: block;">
                <ul>
                    <li><a data-href="customer-info/list.action" data-title="客户信息" href="javascript:void(0)">客户信息</a></li>
                    <li><a data-href="customer-info/allocation.action" data-title="客户分配" href="javascript:void(0)">客户分配</a></li>
                    <li><a data-href="article-list.html" data-title="客户关怀" href="javascript:void(0)">客户关怀</a></li>
                    <li><a data-href="customer-type/list.action" data-title="客户类型" href="javascript:void(0)">客户类型</a></li>
                    <li><a data-href="customer-info/condition.action" data-title="客户状态" href="javascript:void(0)">客户状态</a></li>
                    <li><a data-href="customer-info/source.action" data-title="客户来源" href="javascript:void(0)">客户来源</a></li>
                    <li><a data-href="article-list.html" data-title="联系记录" href="javascript:void(0)">联系记录</a></li>
                    <li><a data-href="article-list.html" data-title="联系人" href="javascript:void(0)">联系人</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-user">
            <dt><i class="Hui-iconfont">&#xe613;</i> 员工相关<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="user/list.action" data-title="员工信息" href="javascript:void(0)">员工信息</a></li>
                    <li><a data-href="picture-list.html" data-title="房屋信息" href="javascript:void(0)">房屋信息</a></li>
                    <li><a data-href="picture-list.html" data-title="房屋类型" href="javascript:void(0)">房屋类型</a></li>
                    <li><a data-href="picture-list.html" data-title="部门信息" href="javascript:void(0)">部门信息</a></li>
                    <li><a data-href="picture-list.html" data-title="公   告" href="javascript:void(0)">公   告</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-email">
            <dt><i class="Hui-iconfont">&#xe620;</i> 邮件相关<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="product-brand.html" data-title="写邮件" href="javascript:void(0)">写邮件</a></li>
                    <li><a data-href="product-category.html" data-title="发邮件" href="javascript:void(0)">发邮件</a></li>
                    <li><a data-href="product-list.html" data-title="草稿箱" href="javascript:void(0)">草稿箱</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-admin">
            <dt><i class="Hui-iconfont">&#xe62d;</i> 管理员<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="admin-role.html" data-title="添加员工" href="javascript:void(0)">添加员工</a></li>
                    <li><a data-href="admin-permission.html" data-title="添加部门" href="javascript:void(0)">添加部门</a></li>
                    <li><a data-href="admin-list.html" data-title="添加角色" href="javascript:void(0)">添加角色</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-tongji">
            <dt><i class="Hui-iconfont">&#xe61a;</i> 系统统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="charts-1.html" data-title="折线图" href="javascript:void(0)">折线图</a></li>
                    <li><a data-href="charts-2.html" data-title="时间轴折线图" href="javascript:void(0)">时间轴折线图</a></li>
                    <li><a data-href="charts-3.html" data-title="区域图" href="javascript:void(0)">区域图</a></li>
                    <li><a data-href="charts-4.html" data-title="柱状图" href="javascript:void(0)">柱状图</a></li>
                    <li><a data-href="charts-5.html" data-title="饼状图" href="javascript:void(0)">饼状图</a></li>
                    <li><a data-href="charts-6.html" data-title="3D柱状图" href="javascript:void(0)">3D柱状图</a></li>
                    <li><a data-href="charts-7.html" data-title="3D饼状图" href="javascript:void(0)">3D饼状图</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-system">
            <dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="system-base.html" data-title="系统设置" href="javascript:void(0)">系统设置</a></li>
                    <li><a data-href="system-category.html" data-title="栏目管理" href="javascript:void(0)">栏目管理</a></li>
                    <li><a data-href="system-data.html" data-title="数据字典" href="javascript:void(0)">数据字典</a></li>
                    <li><a data-href="system-shielding.html" data-title="屏蔽词" href="javascript:void(0)">屏蔽词</a></li>
                    <li><a data-href="system-log.html" data-title="系统日志" href="javascript:void(0)">系统日志</a></li>
                </ul>
            </dd>
        </dl>
    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active"><span title="主页" data-href="welcome.action">主页</span><em></em></li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S"
                                                  href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a
                id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">
            &#xe6d7;</i></a></div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" src="welcome.action"></iframe>
        </div>
    </div>
</section>

<div class="contextMenu" id="Huiadminmenu">
    <ul>
        <li id="closethis">关闭当前</li>
        <li id="closeall">关闭全部</li>
    </ul>
</div>
<!--_footer 作为公共模版分离出去-->
<%@ include file="/WEB-INF/pages/footer.jsp" %>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
    $(function () {
        /*$("#min_title_list li").contextMenu('Huiadminmenu', {
         bindings: {
         'closethis': function(t) {
         console.log(t);
         if(t.find("i")){
         t.find("i").trigger("click");
         }
         },
         'closeall': function(t) {
         alert('Trigger was '+t.id+'\nAction was Email');
         },
         }
         });*/
    });
    /*资讯-添加*/
    function article_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*图片-添加*/
    function picture_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*产品-添加*/
    function product_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*用户-添加*/
    function member_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }
</script>


</body>
</html>