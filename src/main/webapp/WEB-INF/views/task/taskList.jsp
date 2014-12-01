<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>任务列表</title>
<jsp:include page="../base/cssjs.jsp" />
</head>
<body>

	<div class="container">
		<jsp:include page="../base/header.jsp" />
		<div id="content">
			<c:if test="${not empty message}">
				<div id="message" class="alert alert-success">
					<button data-dismiss="alert" class="close">×</button>${message}
				</div>
			</c:if>

			<div class="row">
				<div class="span4 offset7">
					<form class="form-search" action="#">
						<label>名称：</label> 
						<input type="text" name="_taskName" class="input-medium" value="${param._taskName}" />
						<button type="submit" class="btn" id="search_btn">Search</button>
					</form>
				</div>
				<tags:sort />
			</div>

			<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>id</th>
						<th>名称</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${tasks.content}" var="task">
						<tr>
							<td>${task.taskId}</td>
							<td>${task.taskName}</td>
							<td>
								<a href="${ctx}/task/update/${task.taskId}">修改</a>&nbsp;&nbsp;&nbsp;||&nbsp;&nbsp;&nbsp;
								<a href="${ctx}/task/delete/${task.taskId}">删除</a><br />
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div>
				<span style="float: left;"> 
					<a class="btn" href="${ctx}/task/create">添加</a>
				</span> 
				<span style="float: right;"> 
					<tags:pagination page="${tasks}" paginationSize="5" />
				</span>
			</div>
		</div>
		<jsp:include page="../base/footer.jsp" />
	</div>
</body>
</html>