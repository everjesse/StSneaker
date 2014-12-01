<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML>
<html>
<head>
<title>商品列表 - 波鞋街</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/style.css"  />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/form.css"  />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/megamenu.css" />

<!--<link rel='stylesheet' type='text/css'href='http://fonts.googleapis.com/css?family=Exo+2'> -->

<!-- start menu -->

<link type="text/css" rel="stylesheet" href="${ctx}/common/js/bootstrap/2.3.2/css/page.css"/>


<script src="${ctx}/common/js/jquery1.min.js"></script>
<script type="text/javascript" src="${ctx}/common/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script type="text/javascript" src="${ctx}/common/js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
			$(function()
			{
				$('.scroll-pane').jScrollPane();
			});
		</script>
</head>
<body>
	  <!-- 网站头部 -->
  <jsp:include page="../base/sneaker_header.jsp"></jsp:include>
     
	
<div class="mens">    
  <div class="main">
     <div class="wrap">
		<div class="cont span_2_of_3">
		  	<h2 class="head">商品列表&nbsp;Products List</h2>
		  	<div class="mens-toolbar" >
		  	  <div class="pager" style="width:auto;height:auto">
		  	  <!-- 
		  	    <ul class="dc_pagination dc_paginationA dc_paginationA06">
			    <li><a href="#" class="previous">Pages</a></li>
			    
		  	</ul>-->
          		<tags:pagination page="${products}" paginationSize="5" />
	   		<div class="clear"></div>
    	</div>
     	<div class="clear"></div>
	</div>
	<%
		int count =1;
	    //request.setAttribute("count", count);
	%>
	 <c:forEach items="${products.content}" var="product">
	 	<% if(count%3 ==1){ %>
			<div class="top-box">
		<% } %>	
			 <div class="col_1_of_3 span_1_of_3"> 
			   <a href="${ctx}/products/detail?productId=${product.productId}" target="_blank">
				<div class="inner_content clearfix">
					<div class="product_image">
						<img src="${ctx}/common/img/upload/${product.productPhoto}" alt=""/>
					</div>
                    <div class="sale-box"><span class="on_sale title_shop">New</span></div>	
                    <div class="price">
					   <div class="cart-left">
							<p class="title">${product.productName }</p>
							<div class="price1">
							  <span class="actual">￥${product.productTradePrice }</span>
							</div>
						</div>
						<div class="cart-right"> </div>
						<div class="clear"></div>
					 </div>				
                   </div>
                 </a>
				</div>
			   
			<% if(count%3 ==0){ %>	
				
			</div>	
			<div class="clear"></div>
			<% } %>	
			
			<% count++; %>
		</c:forEach>		
		</div>

			  <div class="clear"></div>
			</div>
		   </div>
		</div>
		
		<script src="${ctx}/common/js/jquery.easydropdown.js"></script>
		<!-- 网站尾部  -->
		<div class="clear"></div>
   <jsp:include page="../base/sneaker_footer.jsp"></jsp:include>
</body>
</html>