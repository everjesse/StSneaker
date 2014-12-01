<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>注册 - 波鞋街</title>
<script src="../common/js/register/jquery-1.11.1.min.js"  type="text/javascript"></script>
<script src="../common/js/register/register-3.js"  type="text/javascript"></script>
<link href="../common/css/register/register.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="common" >
  <div style="padding-top:8px ;float:left;text-align:right"><a href="/shoe-shop/"><img src='${ctx}/common/img/logo.png' alt="Logo"></a></div>
</div>
<hr>
<div style="width:100%;height:50px;font-size:13px;font-weight:lighter">已有账号，立即<a style="text-align:right;color:#0FF;text-decoration:none " href="/shoe-shop/user/login">登陆</a>。
</div>
<h>
${msg }</h>
<div class="table">
  <form id="registerForm" method="POST" action="${ctx }/user/registerUser">
  
   <div id="selectRegisterName" class="item" >
     <div class="itemText">&nbsp;&nbsp;&nbsp;账户名：
     <input type="text" id="regName" name="mailbox" class="text" tabindex="1" autocomplete="off" onpaste="return false;" value="请输入邮箱">
     </div>
     <div id="test" style=" float:left;font-size: 14px;"></div>  
   </div>
    
   
   <div id="enterPassWord" class="item" >
     <div class="itemText">&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码：
     <input type="password" id="passWord" name="password" class="text" tabindex="2" autocomplete="off" onpaste="return false;" >
     </div>
     <div id="test1" style=" float:left;font-size: 14px;"></div> 
   </div>
     
     
   <div id="enterAckPassWord" class="item" >
     <div class="itemText">确认密码：
     <input type="password" id="ackPassWord" name="ackPassWord" class="text" tabindex="3" autocomplete="off" onpaste="return false;" >
     </div>
     <div id="test2" style=" float:left;font-size: 14px;"></div> 
   </div>
   
   <div id="ackRegister" class="item" >
     <div style="padding-left:108px ;float:left">
     <input id="subRegister"  tabindex="4" name="subRegister"  type="submit" value=""
       style="width:270px; height:36px; border:none; background:url(../common/img/register/regist-btn.jpg); overflow:hidden; outline:none">
    </div>
   </div>
  </form>
</div>
<br></br>

<div style="text-align:center;width:100%;height:80px;font-size:14px">
<p>Copyright©2014 St.Sneaker.  All Rights Reserved.</p>
</div>

</body>
</html>
