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
			    title : {
			        text: '手机价格',
			        subtext: '玫瑰图',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        x : 'center',
			        y : 'bottom',
			        data:['藏族 143','彝族 18','羌族 6']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {
			                show: true,
			                type: ['pie', 'funnel']
			            },
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    series : [
			        {
			            name:'半径模式',
			            type:'pie',
			            radius : [30, 110],
			            center : ['25%', '50%'],
			            roseType : 'radius',
			            data:[
			                {value:143, name:'藏族 143'},
			                {value:18, name:'彝族 18'},
			                {value:6, name:'羌族 6'},
			            ]
			        },
			        {
			            name:'面积模式',
			            type:'pie',
			            radius : [30, 110],
			            center : ['75%', '50%'],
			            roseType : 'area',
			            data:[
			                {value:143, name:'藏族 143'},
			                {value:18, name:'彝族 18'},
			                {value:6, name:'羌族 6'},
			            ]
			        }
			    ]
			};

		//加载动画
		mychart.showLoading();
		//对数据进行重写，变成动态数据
		var selfDatas=[];
		$.ajax({
			type:"post",
			async:true,//异步请求数据
			url:"getAllBypie.do",
			data:{},
			dataType:"json",
			success:function(res){
				if(res!=null&&res.length>0){
					for(var i=0;i<res.length;i++){
						selfDatas.push(res[i].name);
					}
					//隐藏动画
					mychart.hideLoading();	
					mychart.setOption({
						legend:{
							data:selfDatas
						},
						series:[
							{
								data:res
							},
							{
								data:res
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