<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>任务表单</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<jsp:include page="../base/cssjs.jsp" />
</head>
<body>

	<form id="inputForm" action="${ctx}/test/update" method="post">
		<input type="hidden" name="testId"  value="${test.testId}"/> 
		<input type="text" name="testName"  value="${test.testName}"/> 
		<input type="submit" value="更新" />
	</form>
</body>
</html>