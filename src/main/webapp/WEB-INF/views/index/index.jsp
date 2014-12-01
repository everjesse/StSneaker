<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML>
<html>
<head>
<title>波鞋街   - 首页</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/style.css"   />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/form.css"   />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/megamenu.css"  />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/fwslider.css" />
<!-- 
<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Exo+2' />
 -->
<script type="text/javascript" src="${ctx}/common/js/jquery1.min.js"></script>
<script type="text/javascript" src="${ctx}/common/js/megamenu.js"></script>
<script type="text/javascript" src="${ctx}/common/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${ctx}/common/js/css3-mediaqueries.js"></script>
<script type="text/javascript" src="${ctx}/common/js/fwslider.js"></script>
<script type="text/javascript" src="${ctx}/common/js/jquery.easydropdown.js"></script>

<script type="text/javascript">
	$(document).ready(function(){$(".megamenu").megamenu();});
</script>
    
    
</head>
  <!-- 网站头部 -->
  <jsp:include page="../base/sneaker_header.jsp"></jsp:include>
	
  <!-- start slider -->
    <div id="fwslider">
        <div class="slider_container">
            <div class="slide"> 
                <!-- Slide image -->
                <a href="${ctx}/products/detail?productId=20" target="_blank">
                
                    <img src="${ctx}/common/img/ad4.jpg" alt=""/>
                <!-- /Slide image -->
                <!-- Texts container -->
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <!-- Text title -->
                        <h4 class="title">Nike Air Force 1 LW CMFT Pigalle SP</h4>
                        <!-- /Text title -->
                        
                        <!-- Text description -->
                        <p class="description">New design for Classic</p>
                        <!-- /Text description -->
                    </div>
                </div>
                </a>
                 <!-- /Texts container -->
            </div>
            
            <div class="slide"> 
                <!-- Slide image -->
                <a href="${ctx}/products/detail?productId=21" target="_blank">
                
                    <img src="${ctx}/common/img/index/ad5.jpg" alt=""/>
                <!-- /Slide image -->
                <!-- Texts container -->
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <!-- Text title -->
                        <h4 class="title">Nike Flyknit Air Max</h4>
                        <!-- /Text title -->
                        
                        <!-- Text description -->
                        <p class="description">The new era for runner.</p>
                        <!-- /Text description -->
                    </div>
                </div>
                </a>
                 <!-- /Texts container -->
            </div>
            
            <div class="slide"> 
                <!-- Slide image -->
                <a href="/shoe-shop/products/list?brand=Converse" target="_blank">
                    <img src="${ctx}/common/img/index/ad12.jpg" alt=""/>
                <!-- /Slide image -->
                <!-- Texts container -->
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <!-- Text title -->
                        <h4 class="title">Converse All Star</h4>
                        <!-- /Text title -->
                        
                        <!-- Text description -->
                        <p class="description">Chuck Taylor Sneakers</p>
                        <!-- /Text description -->
                    </div>
                </div>
                </a>
                 <!-- /Texts container -->
            </div>
            <!-- /Duplicate to create more slides -->
            <div class="slide">
            <a href="${ctx}/products/detail?productId=22" target="_blank">
                <img src="${ctx}/common/img/index/ad8.jpg" alt=""/>
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <h4 class="title">adidas Originals Hidden Heel Pack</h4>
                        <p class="description">Designed for girls.</p>
                    </div>
                </div>
               </a>
            </div>
            <!--/slide -->
        </div>
        <div class="timers"></div>
        <div class="slidePrev"><span></span></div>
        <div class="slideNext"><span></span></div>
    </div>
    <!--/slider -->
<div class="main">
	<div class="wrap">
		<div class="section group">
		  <div class="cont span_2_of_3">
		  	<h2 class="head">推荐鞋款 Recommend</h2>
			<div class="top-box">
			
			<c:forEach items="${lRecommand}" var="recommand">
			
			 <div class="col_1_of_3 span_1_of_3"> 
			   <a href="${ctx}/products/detail?productId=${recommand.productId}" target="_blank">
				<div class="inner_content clearfix">
					<div class="product_image">
						<img src="${ctx}/common/img/upload/${recommand.productPhoto}" alt=""/>
					</div>
                    <div class="sale-box"><span class="on_sale title_shop">New</span></div>	
                    <div class="price">
					   <div class="cart-left">
							<p class="title">${recommand.productName }</p>
							<div class="price1">
							  <span class="actual">￥${recommand.productTradePrice }</span>
							</div>
					  </div>
						<div class="cart-right"> </div>
						<div class="clear"></div>
				  </div>				
               </div>
               </a>
			  </div>
			 </c:forEach> 				
				<div class="clear"></div>
			</div>	
				
			
		  <h2 class="head">新品上架 New arrivals</h2>
		  <div class="top-box1">
		  	<c:forEach items="${lNewArrival}" var="new">
		  	
			  <div class="col_1_of_3 span_1_of_3">
			  	 <a href="${ctx}/products/detail?productId=${new.productId}" target="_blank">
				 <div class="inner_content clearfix">
					<div class="product_image">
						<img src="${ctx}/common/img/upload/${new.productPhoto}" alt=""/>
					</div>
                     <div class="sale-box"><span class="on_sale title_shop">New</span></div>	
                    <div class="price">
					   <div class="cart-left">
							<p class="title">${new.productName }</p>
							<div class="price1">
							  <span class="actual">￥${new.productTradePrice }</span>
							</div>
					  </div>
						<div class="cart-right"> </div>
						<div class="clear"></div>
				   </div>				
                 </div>
                </a>
			</div>
				
			</c:forEach>
				<div class="clear"></div>
			</div>	
			
	        <h2 class="head">热销商品 Hot</h2>	
		    <div class="section group">
		     <c:forEach items="${lHot}" var="hot">
			  <div class="col_1_of_3 span_1_of_3">
			  	 <a href="${ctx}/products/detail?productId=${hot.productId}" target="_blank">
				 <div class="inner_content clearfix">
					<div class="product_image">
						<img src="${ctx}/common/img/upload/${hot.productPhoto}" alt=""/>
					</div>
                     <div class="sale-box"><span class="on_sale title_shop">New</span></div>	
                    <div class="price">
					   <div class="cart-left">
							<p class="title">${hot.productName }</p>
							<div class="price1">
							  <span class="actual">￥${hot.productTradePrice }</span>
							</div>
					  </div>
						<div class="cart-right"> </div>
						<div class="clear"></div>
				   </div>				
                 </div>
                </a>
			  </div>
				
			 </c:forEach>	
				<div class="clear"></div>
			</div>			 						 			    
		  </div>
		  <div class="rsidebar span_1_of_left">
				<div class="top-border"> </div>
		    <div class="border">
	             <link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/default.css"  />
	             <link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/nivo-slider.css"  />
			  <script src="${ctx}/common/js/jquery.nivo.slider.js"></script>
		      <script type="text/javascript">
				    $(window).load(function() {
				        $('#slider').nivoSlider();
				    });
				    </script>
		    <div class="slider-wrapper theme-default">
              <div id="slider" class="nivoSlider">
              <a href="${ctx}/products/detail?productId=23" target="_blank">
                <img src="${ctx}/common/img/index/1.jpg"  alt="" />
              </a>
              <a href="/shoe-shop/products/list?brand=Nike" target="_blank">
               	<img src="${ctx}/common/img/index/8.jpg"  alt="" />
               	</a>
               	<a href="${ctx}/products/detail?productId=24" target="_blank">
                <img src="${ctx}/common/img/index/3.jpg"  alt="" />
                </a>
              </div>
             </div>
            </div>
		  </div>
	   <div class="clear"></div>
	</div>
	</div>
	</div>
	<!-- 网站尾部  -->
   <jsp:include page="../base/sneaker_footer.jsp"></jsp:include>

</body>
</html>