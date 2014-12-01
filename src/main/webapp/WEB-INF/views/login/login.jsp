<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录 - 波鞋街</title>
<link href="${ctx}/common/css/login/login.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/common/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/common/js/login.js" type="text/javascript"></script>
</head>

<body>
<div class="head">
            <a href="/shoe-shop/"><img src="${ctx}/common/img/logo.png"></a> 
</div>

<form id="Form" action="${ctx}/user/submit" method="post" >
   <div class="all">
      <div class="pic"></div>
      <div class="background"></div>
      <div class="infor">
         <div class="loginHead" style="display:block">
           <p class="title">登录波鞋街</p>
           		<p>${msg }</p>
             <div class="usernameDiv" id="username"><span class="smallimg" style="background-image:url(${ctx}/common/img/login/uesername.jpg)"></span>
                <input type="text" name="mailbox" id="usernameText" autocomplete="off" value="" maxlength="30" title="请输入邮箱/用户名">
                <label id="userReplace" class="Replace" style="display: block;" for="usernameText">&nbsp;邮箱/用户名</label>                      <p class="tips" >                    <span class="message" id="promptMessge" style="display:block"></span></p> 
             </div>        
         </div>
      <div class="passwordDiv" id="password">
         <span class="smallimg" style="background: 27px 27px url(${ctx}/common/img/login/password.jpg)"></span>
         <input class="pass" id="passwordText" name="password" value=""
 type="password" title="请输入密码" maxlength="16" autocomplete="off" >
          <label id="passReplace" class="Replace" style="display:block" for="passwordText">&nbsp;密码</label>
          <p class="tips">
             <span id="passPromptMessge" class="message" style="display:block"></span>
          </p>
      </div>  
      <p class="autoLogin"><a href="" style="color:#b0b0b0;" >忘记密码？</a><input type="checkbox" id="autoLogin" name="autoLogin" class="autoBox" ><span>自动登录</span><span class="safe">请勿在公用电脑上勾选此选项</span></p>
      <input class="submit" id="loginsubmit" value="登&nbsp;&nbsp;&nbsp;录" type="submit" />
      <p class="register" id="immedateRegister" style="display:block"><a href="/shoe-shop/user/register" class="registerBtn" style="color: #7cbe56;">立即注册</a><span>还不是波鞋街用户？</span></p>
     </div>
   </div>
</form> 

</body>
</html>
