<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML>
<html>
<head>
<title>${product.productName} - 商品详情 - 波鞋街</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ctx}/common/css/single/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${ctx}/common/css/single/style1.css" rel="stylesheet" type="text/css" media="all" />
<link href="${ctx}/common/css/form.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/style.css"   />

<script src="${ctx}/common/js/jquery1.min.js"></script>
<script src="${ctx}/common/js/single.js"></script>

<!-- start menu -->
<link href="${ctx}/common/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="${ctx}/common/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script type="text/javascript" src="${ctx}/common/js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
			$(function()
			{
				$('.scroll-pane').jScrollPane();
			});
		</script>
<!-- start details -->
<script src="${ctx}/common/js/slides.min.jquery.js"></script>
   <script>
		$(function(){
			$('#products').slides({
				preload: true,
				preloadImage: 'img/loading.gif',
				effect: 'slide, fade',
				crossfade: true,
				slideSpeed: 350,
				fadeSpeed: 500,
				generateNextPrev: true,
				generatePagination: false
			});
		});
	</script>
	<!-- start zoom -->
	<link rel="stylesheet" href="${ctx}/common/css/zoome-min.css" />
	<script type="text/javascript" src="${ctx}/common/js/zoome-e.js"></script>
	<script type="text/javascript">
		$(function(){
		$('#img1,#img2,#img3,#img4').zoome({showZoomState:true,magnifierSize:[250,250]});
	});
	</script>
	
			
</head>
<body>
     <!-- 网站头部 -->
  <jsp:include page="../base/sneaker_header.jsp"></jsp:include>  
	
<div class="mens">    
  <div class="main">
    <div class="wrap">
     	<ul class="breadcrumb breadcrumb__t">
     	<a class="home" href="/shoe-shop/">首页</a> > <a href="${ctx}/products/list?brand=${product.brandName}">${product.brandName}</a> >${product.productName}
     	</ul>
        
		<div class="cont span_2_of_3">
        <form method="post" id="Form" action="${ctx}/shoppingcart/create" >
		  	<div class="grid images_3_of_2">
						<div id="container">
							<div id="products_example">
								<div id="products">
									<div class="slides_container">
									        <a href="#"><img class="a" id="img1" src="${ctx}/common/img/upload/${product.productPhoto}" alt="" rel="${ctx}/common/img/upload/${product.productPhoto}" /></a>
									</div>
									<ul class="pagination">
										<li><a href="#"><img src="${ctx}/common/img/upload/${product.productPhoto}" width="s-img" alt="1144953 3 2x"></a></li>
									</ul>
								</div>
							</div>
						</div>
		  	</div>
		  	<div class="desc1 span_3_of_2">
		         	<h1 data-spm="1000983" class="head">${product.productName}</h1><input type="hidden" name="productId" id="productId" value="${product.productId}">
		         	<h3 class="m_3"></h3>
                              <div class="show_info_left">波鞋街价</div>
                              <div class="show_info_right">
                                   <b class="d_price ">
                                        ￥<span id="salePriceTag">${product.productTradePrice}</span>
                                   </b><span class="discount" id="dc"></span></div>
                 
                           <div class="show_info_left">市场价</div>
                           <div class="show_info_right">
                                <i class="m_price">￥&nbsp;<span id="originalPriceTag">${product.productMarketPrice}</span></i>
                           </div>
                    
      
              <div class="sale_box clearfix m_t4" id="m_t4">
                        <div class="show_info_left">鞋码<input type="hidden" name="size" id="size" value="0"></div>
                            <div class="show_info_right o_h">
                                 <ul class="size"><li><a href="javascript:void(0);" onClick="chooseSize(this)" title="39" id="sl_0">39</a></li><li><a href="javascript:void(0);" onClick="chooseSize(this)" title="39.5" id="sl_1">39.5</a></li><li><a href="javascript:void(0);" onClick="chooseSize(this)" title="40" id="sl_2">40</a></li><li><a href="javascript:void(0);" onClick="chooseSize(this)" title="41" id="sl_3">41</a></li><li><a href="javascript:void(0);"  onClick="chooseSize(this)" title="41.5" id="sl_4">41.5</a></li><li><a href="javascript:void(0);" onClick="chooseSize(this)" title="42" id="sl_5">42</a></li><li><a href="javascript:void(0);" onClick="chooseSize(this)" title="43" id="sl_6">43</a></li><li><a href="javascript:void(0);" onClick="chooseSize(this)" title="43.5" id="sl_7">43.5</a></li><li><a href="javascript:void(0);" onClick="chooseSize(this)" title="44" id="sl_8">44</a></li><li><a href="javascript:void(0);" onClick="chooseSize(this)" title="45" id="sl_9">45</a></li><li id="cst" style="display:none;"></li></ul></div></div>                                                  <div class="show_info_left" id="number1">数量</div>
                                      <div class="show_info_right" id="proudctNumber">
                                                <a href="javascript:void(0)" class="num_del num_del_disabled" id="num_del" onClick="num_del()"></a>
                                                <input onpaste="return false" type="text" value="1" name="productAmount" id="product_amount" class="text" onchange="checknumber(this)" style="ime-mode:disabled">
                                           <a href="javascript:void(0)" class="num_add" id="num_add" onClick="num_add()"></a>件</div>

                                       
                                           <span id="buy_num_text" class="reminder" style="display:none" buy_num="1" olbn="0" plbn="0"><i class="red">请输入购买数量</i></span>
                                           <div class="clearfix m_t8">
                                         	<div class="show_info_left" id="number1">库存 <span id="kucun">${product.productStock}</span> 双 </div>
                                             <div class="show_info_right c_red" id="itemMessage">请选择：数量、鞋码</div>
                      
          </div>
          
        <!-- 加入购物车和一键购买 buttonSubmit()加form的action-->
            <div class="show_info_right" style="height:33px;">
            	<div class="btn_p">
           			 <span id="newpresale">
           			 	
           			 <c:if test="${sessionScope.user == null}">
						 <a href="javascript:;" onclick="toLogin()" title="加入购物车" id="part_buy_button" name="__Shopcar_b2c" iscatalog="true" class="btn_buy" dd_name="加入购物车"></a>
						
				  	</c:if>
				  	<c:if test= "${sessionScope.user != null}">
						 <a href="javascript:;" onclick="buttonSubmit('${ctx}/shoppingcart/create');" title="加入购物车" id="part_buy_button" name="__Shopcar_b2c" iscatalog="true" class="btn_buy" dd_name="加入购物车"></a>
						 
				  	</c:if>
           			 	
           			 </span>
           			 <!--  <a href="javascript:void(0);" class="btn_buy_now" onClick="javascript:buttonSubmit();" id="buy_now_button" value="1"></a>
           			-->
           		</div>
           	</div>
         
      </div>
      

      
	      <div class="clear"></div>
	      <div class="toogle">
	        <h3 class="m_3" style="margin-left:35px;">商品详情</h3>
            <div class="fengexian" style="width:890px; margin-right:5px;margin-bottom:10px;margin-left:5px; border-top:5px solid #999;"></div>
            <div style="margin-left:50px;">
            <img class="img" src="${ctx}/common/img/upload/${product.productBriefInfo}">
            </div>
     	
   </div>
      </form>
      </div>
    	
           		  <div class="rsidebar1 span_1_of_left">
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
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>