<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



<script type="text/javascript">
	$(document).ready(function(){$(".megamenu").megamenu();});
</script>

     <div class="header-top">
	   <div class="wrap"> 
			  <div class="header-top-left">
   				    <div class="clear"></div>
   			 </div>
			 <div class="cssmenu">
				<ul>
					
					<c:if test="${sessionScope.user == null}">
						
						<li><a href="/shoe-shop/user/login">[登录]</a></li> |
				  		<li><a href="/shoe-shop/user/register">[免费注册]</a></li>
				  	</c:if>
				  	<c:if test= "${sessionScope.user != null}">
						
						<li style="color:white;">  欢迎你,${sessionScope.user.mailbox }  </li>  |
						<li><a href="/shoe-shop/usercenter/usercenter">用户中心</a></li> |
				  		<li><a href="/shoe-shop/shoppingcart/list">购物车</a></li> |
						<li><a href="${ctx}/user/logout">登出</a></li> 
				  		
				  	</c:if>
				</ul>
			</div>
			<div class="clear"></div>
 		</div>
	</div>
	
	<div class="header-bottom">
	    <div class="wrap">
			<div class="header-bottom-left">
				<div class="logo">
					<a href="/shoe-shop/"><img src="${ctx}/common/img/logo.png" alt=""/></a>
				</div>
				<div class="menu">
	            <ul class="megamenu skyblue">
			<li class="active grid"><a href="/shoe-shop/">首页</a></li>
			<li><a class="color4" href="#">类别</a>
				<div class="megapanel">
					<div class="row">
						<div class="col1">
							<div class="h_nav">
								<ul>
								<li><a href="${ctx}/products/list?type=篮球鞋" >篮球鞋</a></li>
								<li><a href="${ctx}/products/list?type=板鞋">板鞋</a></li>
								<li><a href="${ctx}/products/list?type=跑鞋">跑鞋</a></li>
								<li><a href="${ctx}/products/list?type=户外">户外</a></li>
								
								</ul>	
							</div>							
						</div>
					  </div>
					</div>
				</li>				
				<li><a class="color5" href="#">品牌</a>
				<script>
				</script>
				<div class="megapanel">
					<div class="col1">
							<div class="h_nav">
								<ul>
									<li><a href="${ctx}/products/list?brand=Adidas">Adidas</a></li>
									<li><a href="${ctx}/products/list?brand=Nike">Nike</a></li>
									<li><a href="${ctx}/products/list?brand=New Balance">New Balance</a></li>
									<li><a href="${ctx}/products/list?brand=Converse">Converse</a></li>
									<li><a href="${ctx}/products/list?brand=Reebok">Reebok</a></li>
								</ul>	
							</div>							
						</div>

					</div>
				</li>
				
				<li><a class="color7" href="${ctx}/products/list">所有商品</a></li>
			</ul>
			</div>
		</div>
	   <div class="header-bottom-right">
	   <form id="searchForm" method="POST" action="${ctx }/products/search">
         <div class="search">	  
				<input type="text" name="_key" class="textbox" value="${param._key}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
				<input type="submit" value="Subscribe" id="submit" name="submit">
				<div id="response"> </div>
		 </div>
	  </form>
    </div>
     <div class="clear"></div>
     </div>
	</div>