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
    <title>Title</title>
    <%@include file="../header.jsp"%>
</head>
<body>
<div class="page-container">
    <div class="panel panel-default f-l ml-10 mb-10">
        <div class="panel-header">客户数量</div>
        <div class="panel-body">
            <div id="customer_count" style="width: 500px;height:300px;"></div>
        </div>
    </div>
    <div class="panel panel-default f-l ml-10 mb-10">
        <div class="panel-header">客户有效率</div>
        <div class="panel-body">
            <div id="customer_is_used" style="width: 500px;height:300px;"></div>
        </div>
    </div>
    <div class="panel panel-default f-l ml-10 mb-10">
        <div class="panel-header">客户类型</div>
        <div class="panel-body">
            <div id="customer_type" style="width: 500px;height:300px;"></div>
        </div>
    </div>
    <div class="panel panel-default f-l ml-10 mb-10">
        <div class="panel-header">客户状态</div>
        <div class="panel-body">
            <div id="customer_condition" style="width: 500px;height:300px;"></div>
        </div>
    </div>
    <div class="panel panel-default f-l ml-10 mb-10">
        <div class="panel-header">客户来源</div>
        <div class="panel-body">
            <div id="customer_source" style="width: 500px;height:300px;"></div>
        </div>
    </div>
</div>
<%@include file="../footer.jsp"%>
<script type="text/javascript" src="<%=path%>/lib/echarts/echarts.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        getSexCount();
        getIsUsed();
        getType();
        getCondition();
        getSource();
    })
    function getSource() {
        $.getJSON("<%=path%>/chart/source.action",function (result) {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('customer_source'));
            var sources = [];
            var counts = [];
            result.forEach(function (source) {
                sources.push(source.source_name)
                counts.push(source.count)
            })
            // 指定图表的配置项和数据
            var option = {
                title : {
                    text: '客户来源',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} "
                },
                xAxis: {
                    type: 'category',
                    data: sources,
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
                        name: '客户来源',
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
    function getCondition() {
        $.getJSON("<%=path%>/chart/condition.action",function (result) {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('customer_condition'));
            var names = [];
            var counts = [];
            result.forEach(function (condition) {
                names.push(condition.condition_name)
                counts.push(condition.count)
            })
            // 指定图表的配置项和数据
            var option = {
                title : {
                    text: '客户状态',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} "
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
                        name: '客户状态',
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
        $.getJSON("<%=path%>/chart/type.action",function (result) {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('customer_type'));
            var types = [];
            var counts = [];
            result.forEach(function (type) {
                types.push(type.type_name)
                counts.push(type.count)
            })
            // 指定图表的配置项和数据
            var option = {
                title : {
                    text: '客户类型',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c}"
                },
                xAxis: {
                    type: 'category',
                    data: types,
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
                        name: '客户类型',
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
    function getIsUsed() {
        $.getJSON("<%=path%>/chart/isUsed.action",function (result) {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('customer_is_used'));

            // 指定图表的配置项和数据
            var option = {
                title : {
                    text: '客户有效率',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['有效','无效']
                },
                series : [
                    {
                        name: '客户有效率',
                        type: 'pie',
                        radius : '60%',
                        center: ['50%', '60%'],
                        data:[
                            {value:result[1].count, name:'有效'},
                            {value:result[0].count, name:'无效'}
                        ],
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
    function getSexCount() {
        $.getJSON("<%=path%>/chart/sexCount.action",function (result) {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('customer_count'));

            // 指定图表的配置项和数据
            var option = {
                title : {
                    text: '客户男女比例',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['男','女']
                },
                series : [
                    {
                        name: '男女比例',
                        type: 'pie',
                        radius : '60%',
                        center: ['50%', '60%'],
                        data:[
                            {value:result[1].count, name:'男'},
                            {value:result[0].count, name:'女'}
                        ],
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
