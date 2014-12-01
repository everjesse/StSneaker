<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>任务表单</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<jsp:include page="../base/cssjs.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {
			$("#taskName").focus();
			$("#inputForm").validation();
		});
	</script>
</head>
<body>
	
	<div class="container">
		<jsp:include page="../base/header.jsp" />
		<div id="content">
			<form id="inputForm" action="${ctx}/task/${action}" method="post" class="form-horizontal">
				<input type="hidden" name="taskId" value="${task.taskId}"/>
				<fieldset>
					<legend><small>任务管理</small></legend>
					<div class="control-group">
						<label for="task_name" class="control-label">任务名称:</label>
						<div class="controls">
							<input type="text" id="taskName" name="taskName" value="${task.taskName}" class="input-large"
								check-type="required" required-message="请填写任务名称信息"/>
						</div>
					</div>
					<div class="form-actions">
						<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
						<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
					</div>
				</fieldset>
			</form>
		</div>
		<jsp:include page="../base/footer.jsp" />
	</div>
</body>
</html>