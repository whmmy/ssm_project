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
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap3.3.7/js/bootstrap.min.js"></script>
	<!-- <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script> -->
	<script type="text/javascript" src="<%=basePath%>js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/bootstrap3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>手机列表</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">手机信息</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="getAll.do">手机列表</a></li>
					<li><a href="getAllByPage.do">手机列表（分页）</a></li>
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
		<table class="table">
			<caption>手机信息表</caption>
			<thead>
				<tr>
					<th>序号</th>
					<th>名称</th>
					<th>最低售价</th>
					<th>最高售价</th>
					<th>发售日期</th>
					<th>存储容量</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${findAllList}" var="s">
					<tr>
						<td>${s.pno}</td>
						<td>${s.pname}</td>
						<td>${s.lessprice}</td>
						<td>${s.hightprice}</td>
						<td>${s.date}</td>
						<td>${s.memory}</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
</body>
</html>