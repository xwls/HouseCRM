<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/4/24
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户相关统计</title>
    <%@include file="../header.jsp"%>
</head>
<body>
<div class="page-container">

    <div class="panel panel-default f-l ml-10 mb-10">
        <div class="panel-header">员工拥有客户数量</div>
        <div class="panel-body">
            <div id="users" style="width: 500px;height:300px;"></div>
        </div>
    </div>
    <div class="panel panel-default f-l ml-10 mb-10">
        <div class="panel-header">员工学历分布</div>
        <div class="panel-body">
            <div id="diploma" style="width: 500px;height:300px;"></div>
        </div>
    </div>

</div>
<%@include file="../footer.jsp"%>
<script type="text/javascript" src="<%=path%>/lib/echarts/echarts.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        getType();
        getDiploma();
    })
    function getDiploma() {
        $.getJSON("<%=path%>/chart/diploma.action",function (result) {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('diploma'));
            var names = [];
            var counts = [];
            result.forEach(function (user) {
                names.push(user.user_diploma)
                counts.push(user.count)
            })
            // 指定图表的配置项和数据
            var option = {
                title : {
                    text: '员工学历分布',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c}"
                },
                xAxis: {
                    type: 'category',
                    data: names,
                    axisTick: {
                        alignWithLabel: true
                    }
                },
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name: '员工学历分布',
                        type: 'bar',
                        data:counts,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        })
    }
    function getType() {
        $.getJSON("<%=path%>/chart/users.action",function (result) {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('users'));
            var names = [];
            var counts = [];
            result.forEach(function (user) {
                names.push(user.user_name)
                counts.push(user.count)
            })
            // 指定图表的配置项和数据
            var option = {
                title : {
                    text: '员工拥有客户数量',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c}"
                },
                xAxis: {
                    type: 'category',
                    data: names,
                    axisTick: {
                        alignWithLabel: true
                    }
                },
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name: '员工拥有客户数量',
                        type: 'bar',
                        data:counts,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        })
    }

</script>
</body>
</html>
