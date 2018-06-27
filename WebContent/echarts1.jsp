<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/echarts.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/bootstrap3.3.7/css/bootstrap.min.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>折线图</title>
</head>
<body>
<!-- 初始化div -->
	<div style="height:410px;min-height:100px;margin: 0 auto;" id="main">
	</div>
	<script type="text/javascript">
		var mychart=echarts.init($("#main")[0]);
		option = {
		    title: {
		        text: '手机价格分布图',
		        subtext: '纯属虚构，不是真的价格'
		    },
		    tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		        data: ['最高价格', '最低价格']
		    },
		    toolbox: {
		        show: true,
		        feature: {
		            dataZoom: {},
		            dataView: {
		                readOnly: false
		            },
		            magicType: {
		                type: ['line', 'bar']
		            },
		            restore: {},
		            saveAsImage: {}
		        }
		    },
		    xAxis: {
		        type: 'category',
		        boundaryGap:false,
		        data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
		    },
		    yAxis: {
		        type: 'value',
		        axisLabel: {
		            formatter: '¥：{value}'
		        }
		    },
		    series: [{
		            name: '最高价格',
		            type: 'line',
		            data: [11, 11, 15, 13, 12, 13, 10],
		            markPoint: {
		                data: [{
		                        type: 'max',
		                        name: '最大值'
		                    },
		                    {
		                        type: 'min',
		                        name: '最小值'
		                    }
		                ]
		            },
		            markLine: {
		                data: [{
		                    type: 'average',
		                    name: '平均值'
		                }]
		            }
		        },
		        {
		            name: '最低价格',
		            type: 'line',
		            data: [1, -2, 2, 5, 3, 2, 0],
		            markPoint: {
		                data: [{
		                    name: '周最低',
		                    value: -2,
		                    xAxis: 1,
		                    yAxis: -1.5
		                }]
		            },
		            markLine: {
		                data: [{
		                    type: 'average',
		                    name: '平均值'
		                }]
		            }
		        }
		    ]
		};
		//加载动画
		mychart.showLoading();
		//对数据进行重写，变成动态数据
		var heightPrices=[];
		var lessPrices=[];
		var pnames=[];
		$.ajax({
			type:"post",
			async:true,//异步请求数据
			url:"getAllJsonTwo.do",
			data:{},
			dataType:"json",
			success:function(res){
				if(res!=null&&res.length>0){
					for(var i=0;i<res.length;i++){
						heightPrices.push(res[i].hightprice);
						lessPrices.push(res[i].lessprice);
						pnames.push(res[i].pname)
					}
					//隐藏动画
					mychart.hideLoading();	
					mychart.setOption({
						xAxis:{//重写x轴
							data:pnames
						},
						series:[
							{
								name:'最高售价',
								data:heightPrices,
								color:["#f91"]
							},
							{
								name:'最低售价',
								data:lessPrices,
								color:["#ddd"]
							}
						]
					});
				}
			}
		});
		//载入图标
		mychart.setOption(option);
	</script>
	<a href="#" style="padding-left: 30px;"><button type="button" class="btn btn-default btn-xs">返回主页</button></a>
</body>
</html>