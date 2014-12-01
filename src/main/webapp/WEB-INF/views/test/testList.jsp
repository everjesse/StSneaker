<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test列表</title>
<jsp:include page="../base/cssjs.jsp" />
</head>
<body>

<c:forEach items="${tests.content}" var="test">
${test.testId}<br/>
${test.testName}

<table>
	<tr>
		<td><h1>${test.testId}</h1></td>
		<td><h1>${test.testName}</h1></td>
		<td>
			<a href="${ctx}/test/update/${test.testId}">修改</a>&nbsp;&nbsp;&nbsp;||&nbsp;&nbsp;&nbsp;
			<a href="${ctx}/test/delete/${test.testId}">删除</a><br />
		</td>
	</tr>
</table>
</c:forEach>

<br/>
<a href="${ctx}/test/testAdd">添加</a>
<br/>
<tags:pagination page="${tests}" paginationSize="5" />

</body>
</html>