<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="count" value="0"></c:set>
<!DOCTYPE HTML>
<html>
<head>
<title>购物车 - 波鞋街</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/style.css"  />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/megamenu.css"  />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/shoppingcart/shoppingcart.css"  />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/shoppingcart/shoppingcart1.css"  />
<!-- start menu
<link href='http://fonts.googleapis.com/css?family=Exo+2' rel='stylesheet' type='text/css'> 

-->
<script type="text/javascript" src="${ctx}/common/js/jquery1.min.js"></script>
<script type="text/javascript" src="${ctx}/common/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script type="text/javascript" src="${ctx}/common/js/shoppingcart/cart.js"></script>
<!-- dropdown -->
<script type="text/javascript" src="${ctx}/common/js/jquery.easydropdown.js"></script>


</head>
<body>
        <!-- 网站头部 -->
  <jsp:include page="../base/sneaker_header.jsp"></jsp:include>     
	 
  
<div style="width:100%;height:auto" align="center">
 <div style="width:80%;height:auto">
     <div style="width:100%;height:35px;font-size:16px;color:#666" align="left">我的购物车</div>
     <form id="cartform" method="get" action="${ctx}/order/confirm" >
     <c:forEach items="${shoppingcarts}" var="shoppingcart">
     <div class="item"  align="left"> 
        <div class="item_img">
          <a href="${ctx}/products/detail?productId=${shoppingcart.product.productId}"><img src="${ctx}/common/img/upload/${shoppingcart.product.productPhoto }" width="200px" height="150px" ></a>
        </div> 
        <div class="item_info"  align="center" >
        <div class="item_po" ></div>
          ${shoppingcart.product.productName}
        </div>
        <div class="item_amt" align="center">
        <div class="item_po"></div>
         数量 
        
        <span class="number_change">
         
          <input id="${shoppingcart.product.productId}" type="text" value="${shoppingcart.productAmount }" onChange="amountAdd(${shoppingcart.product.productId})" name="productAmount" style="width: 20px"  >
          <input id="${shoppingcart.product.productId}price" name="productTradePrice" value="${shoppingcart.product.productTradePrice}">
         <input type="text"  id="amount" value="${shoppingcart.shoppingcartId} " name="shoppingcartId" style="width: 20px" >
       <span class="add" onClick="addNumber(${shoppingcart.product.productId})"></span>
       <span class="delete" onClick=" deleteNumber(${shoppingcart.product.productId})"></span>
             </span>
             
        </div> 
        <div class="item_op"  align="center">
        <div class="item_blank" ></div>
        <div class="item_price" > <p style="color:orange;">¥<span id="${shoppingcart.product.productId}amount">${shoppingcart.product.productTradePrice*shoppingcart.productAmount}</span></p></div>
        <a href="${ctx}/shoppingcart/delete/${shoppingcart.shoppingcartId}" style="color:#6CF">删除</a>
        </div>
        <c:set var="count" value="${count + shoppingcart.product.productTradePrice*shoppingcart.productAmount }"></c:set>
        
     </div>
     <hr>
      </c:forEach> 	
     <div style="width:100%;height:60px" align="left">
        <div style="width:80%;height:100%;float:left"></div>
        <div style="width:20%;height:100%;float:left">
          <div class="item_po" align="left"></div>
           <div style="width:40%;height:100%;float:left">商品总价： </div>
           <div style="width:60%;height:100%;float:left;color:#F00" id="total" >¥<span id="totalPro">${count}</span></div>
     
        </div>
     </div>
     <hr>
     <div style="width:100%;height:50px"></div>
     <div style="width:100%; height:52px" align="left">
        <div style="width:60%;height:100%;float:left"></div>
        <div style="width:20%;height:100%;float:left"><a href="${ctx}/products/list"><img src="${ctx}/common/img/shoppingcart/g_17.jpg"></a></div>
        <div style="width:20%;height:100%;float:left"><input type="submit"  style="border:0px;background-image:url(${ctx}/common/img/shoppingcart/g_19.jpg);width:143px;height:50px;"value=""></div>
     </div>
     </form>
          
 </div>
</div>        
        
<div style="width:100%;height:100px"></div>
    <!-- 网站尾部  -->
   <jsp:include page="../base/sneaker_footer.jsp"></jsp:include>  
    
</body>
</html>