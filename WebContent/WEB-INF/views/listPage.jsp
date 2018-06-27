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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/kkpager/jpager.js"></script>
<script type="text/javascript" src="<%=basePath%>js/listpage.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/kkpager/jpager.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/bootstrap3.3.7/css/bootstrap.min.css">
<title>手机列表（分页）</title>
<script type="text/javascript">
	function load() {
		hmPage(${pageResult.pages},${pageResult.total})
	}
</script>
<script type="text/javascript">
	function del(pno){
		if(!confirm("确认删除")){
			window.event.returnValue=false;
		}else{
			window.event.returnValue=true;
			$.ajax({
				type:"post",
				async:true,
				url:"del.do",
				data:{pno:pno},
				dataType:"text",
				success:function(res){
					if(res=="yes"){
						alert("删除成功");
						location.href="getAllByPage.do";
					}
				}
			})
		}
	}
</script>
<style>
	#a td,th
	{
		vertical-align: middle;
		text-align:center;
	}
</style>
</head>
<body onload="load()">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">手机信息</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="getAll.do">手机列表</a></li>
					<li class="active"><a href="getAllByPage.do">手机列表（分页）</a></li>
					<li><a href="getAllJson.do">手机数据（Json数据）</a></li>
					<li><a href="reg.jsp">添加手机</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							图表显示
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href="<%=basePath%>echarts1.jsp">折线图</a></li>
							<li><a href="<%=basePath%>echarts2.jsp">玫瑰图</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav> 
	<div>
		<table id="a" class="table table-hover">
			<caption>手机信息表</caption>
			<thead>
				<tr>
					<th>序号</th>
					<th>名称</th>
					<th>最低售价</th>
					<th>最高售价</th>
					<th>发售日期</th>
					<th>存储容量</th>
					<th>数据操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageResult.dataList}" var="s">
					<tr>
						<td>${s.pno}</td>
						<td>${s.pname}</td>
						<td>${s.lessprice}</td>
						<td>${s.hightprice}</td>
						<td>${s.date}</td>
						<td>${s.memory}</td>
						<td>
							<ul class="pagination">
							    <li><a onclick="del(${s.pno})">删除</a></li>
							    <li><a href="toUpdataByPno.do?pno=${s.pno}">修改</a></li>
							</ul>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="jpager" style="padding-left: 30px;padding-top: 30px;"></div>
</body>
</html>