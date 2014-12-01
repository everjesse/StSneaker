<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="totalAmount" value= "0" />
<c:set var="totalPrice" value= "0" />
<!DOCTYPE HTML>
<html>
<head>
<title>订单确认 - 波鞋街</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ctx}/common/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${ctx}/common/css/order.css" rel="stylesheet" type="text/css" media="all" />
<link href="${ctx}/common/css/form.css" rel="stylesheet" type="text/css" media="all" />

<script src="${ctx}/common/js/jquery1.min.js"></script>
<script src="${ctx}/common/js/jsAddress.js"></script>

<!-- start menu -->
<link href="${ctx}/common/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="${ctx}/common/js/megamenu.js"></script>
<script type="text/javascript" src="${ctx}/common/js/order.js"></script>
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
    <script type="text/javascript" src="${ctx}/common/js/pagetop2014_0611.js"></script>
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
<form action="${ctx}/order/add" method="post" class="checkoutForm" id="Form" onsubmit="return checkform()">   
  <div class="checkout">
     <div class="order_title">
        <h2>填写并核对订单信息</h2>
     </div> 
     <div class="checkout_steps">
        <div class="checkout_step" id="step1">
           <div class="step_title">
           <strong id="consigneeTitleDiv">收货人信息</strong></div>
           <div class="step_content">
           
           <div id="adrdiv">
           <c:forEach items="${pAddresses.content}" var="address">
           <div>
	              <c:if test="${address.isDefaultAddress == true}" >
	             	   <input type="radio" class="hookbox" name="addressId" id="choseConsignee" value="${address.addressId }" checked onclick="chooseAddress();">
	             </c:if>
	             <c:if test="${address.isDefaultAddress == false}">
	             	   <input type="radio" class="hookbox" name="addressId" id="choseConsignee" value="${address.addressId }"  onclick="chooseAddress();">
	             </c:if>
	              <label for="choseConsignee" >								    <b>${address.addressName }&nbsp;&nbsp; ${address.province} ${address.city} ${address.district } &nbsp;&nbsp;${address.detailAddress }&nbsp; Tel: ${address.phone } &nbsp;邮编: ${address.postcode }</b>
	                 </label>
            </div> 
            </c:forEach>     
           </div>
           
                 <div style="clear:both;height:0px; line-height:0px"></div>
                  <input type="radio" class="hookbox" name="addressId" id="newConsignee" value="0"  onclick="chooseAddress();">
              <label for="newConsignee" >								    <b>使用新地址</b>
                 </label>
             <div style="clear:both;height:0px; line-height:0px"></div>
             
            
             	<div class="consignee-form" id="consignee-form" name="consignee-form" style="padding-left: 12px;display:none; ">
	        
		   <div class="list" id="name_div">
			   <span class="label"><em>*</em>收货人：</span>
			     <div class="field">
				   <input type="text" class="textbox" id="consignee_name" name="addressName" maxlength="20" ">
			     </div>
				 <span class="status error" id="name_div_error"></span>
		   </div>
		   <div class="list select-address" id="area_div">
			   <span class="label"><em>*</em>所在地区：</span>
               
			     <div>
省：<select  id="cmbProvince"></select>
<input type="hidden" id="province" name="province" value="0">
市：<select  id="cmbCity"></select>
<input type="hidden" id="city" name="city" value="0">
区：<select onChange="changeArea(this)" id="cmbArea"></select>
<input type="hidden" id="district" name="district" value="成华区">
<script type="text/javascript">
	addressInit('cmbProvince', 'cmbCity', 'cmbArea', '四川', '成都市', '成华区');
</script>
</div>
	       </div>
	       <div class="list full-address" id="address_div">
			   <span class="label"><em>*</em>详细地址：</span>
			     <div class="field">
			     <span class="fl selected-address" id="areaNameTxt"></span>
				 <input type="text" class="textbox" id="consignee_address" name="detailAddress" maxlength="50" onblur="check_Consignee('address_div')">
			     </div>
				 <span class="status error" id="address_div_error"></span>
		   </div>
		   <div class="list" id="call_div">
			   <span class="label"><em>*</em>手机号码：</span>
			    <div class="field">
				  <div class="phone">
					<input type="text" class="textbox" id="consignee_mobile" name="phone" onblur="check_Consignee('call_mobile_div')" maxlength="11" >
					
				  </div>
			     <span class="status error" id="call_div_error"></span>
		      </div>
		   </div>
		   <div class="list" id="email_div">
			   <span class="label"><em>*</em>邮编：</span>
		        <div class="field">
				   <input type="text" class="textbox" id="consignee_email" name="postcode" maxlength="50" onblur="check_Consignee('email_div')">
			     </div>
				 <span class="status error" id="email_div_error"></span>
		   </div>
		   <div class="list" id="defalut_div">
		   		<input type="checkbox" class="textbox" id="consignee_default" name="isDefaultAddress" maxlength="50" onblur="" value="1">
		   
			   <span class="label"><em>*</em>是否设为默认地址</span>
		        
				 <span class="status error" id="email_div_error"></span>
		   </div>
		   <div style="clear:both;height:0px; line-height:0px"></div>
		   <div class="list" id="defalut_div">
		   		<span class="label">
		   			<button id="addressSubmit" type="button" value="保存新地址" onclick="ad_submit()" style="margin-right: 10px;">保存新地址</button>
		   		</span>
		   </div>
		   <div style="height: 50px;"></div>
		</div>
        
        
        
        
        
          
            
           </div>
        </div>
        <div class="checkout_step" id="step2">          
           <div class="step_title">
              <strong>支付及配送方式</strong>           
           </div>
           <div class="step_content">
              <div class="payment">
                 <h3>支付方式</h3>
                <div class="label">
	                        
	                            <input type="hidden"  name="payment"   id="payment" class="hookbox" value="货到付款">
	                               
	                            <label for="pay-method-4">货到付款
	                                	                               										                            </label>
	                                
	                        </div>
              </div>
              <div class="way">
                 <h3>配送方式</h3>
                 <div class="label">
                       
                         <p style="margin-left:10px;font-size:14px;">快递运输</p>
                 </div>
              </div>
              <div class="ps">
                 <h3>留言：</h3>
                 <div class="label">
                       
				   <input type="text" class="textbox" id="consignee_remarks" name="feedbackRemark" maxlength="50" onblur="check_Consignee()">
                 </div>
              </div>
           </div>
        </div>
  
        <div class="checkout_step" id="step3">
          <div class="step_title">
             <strong>商品清单</strong>
             <a href="/shoe-shop/shoppingcart/list" id="cartRetureUrl" class="return-edit">返回修改购物车</a>            
          </div>
          <div class="step_content">
          	<div id="part_order">
            	<div class="order_review">
                	<table class="review-thead">
	<tbody>
		<tr>
		<td class="fore1">商品</td>
		<td class="fore2">波鞋街价</td>
		<td class="fore3">数量</td>
		<td class="fore3">库存状态</td>
	    </tr>
	</tbody>
</table>
               </div>
               
                <div class="review_body">
                <c:forEach items="${lShoppingcarts}" var="shoppingcart">
                	<div class="review-tbody">
		<table class="order-table">
			<tbody>
			  <tr>
			  
			    <td class="fore1">
				   <div class="p-goods">		   
					  <div class="p-img"><a href="${ctx}/shoppingcart/detail?productId=${shoppingcart.product.productId}" target="_blank"><img alt="" src="${ctx}/common/img/upload/${shoppingcart.product.productPhoto }"></a></div>
						 <div class="p-detail">
							<div class="p-name">
								<a href="${ctx}/shoppingcart/detail?productId=${shoppingcart.product.productName}" target="_blank"> </a>
								 ${shoppingcart.product.productName}
							</div>
							<div class="p-more">商品编号：${shoppingcart.product.productId}<br>
						
							</div>
						 </div>
					   </div>			 					   		 					
					 				  </td>
				  <td class="p-price"><strong>￥${shoppingcart.product.productTradePrice}</strong>
				  					  </td>				 
				  <td class="fore3">x ${shoppingcart.productAmount }</td>

					<c:set var="totalAmount" value="${totalAmount+shoppingcart.productAmount}"></c:set>
					<c:set var="totalPrice" value="${totalPrice + shoppingcart.product.productTradePrice*shoppingcart.productAmount }"></c:set>
				  <td class="fore3 p-inventory" skuid="997949">有货</td>
				  <br>
				  	 </c:forEach> 
			   </tr>  				 			  			  </tbody>
			   
        </table>
       
	 </div>
                </div>
                <div class="order_summary">
                	<div class="order_summary_right">
                    	<div class="list"><span><em id="span-skuNum">${totalAmount}</em> 件商品，总商品金额：</span><em class="price" id="warePriceId" v="1299">￥${totalPrice }</em>			</div>
                        <div class="list" id="showFreightPrice" style="padding-left:130px;">
                                                		<span id="freightSpan" style="width:50px;"><font color="#000000">运费：</font></span> 
                                                		<em class="price" id="freightPriceId"><font color="#000000"> ￥0.00</font></em>                        </div> 
                        <div class="list"><span>应付总额：</span><em id="sumPayPriceId" class="price">￥${totalPrice }</em>					</div>                    </div>
                      
                      <div style="clear:both;height:0px; line-height:0px"></div>
                </div>
            </div>           
              
            <div class="checkout_but">
            	<button type="submit" class="checkout-submit" id="order-submit" >
                                        提交订单<b></b>
              </button>
            	<span class="total">应付总额：<strong id="payPriceId">￥${totalPrice }</strong>元</span>
             

                <div style="clear:both;height:0px; line-height:0px"></div>
            </div> 				 
          </div>
        </div>
     </div>			 
  </div>
  </form>
</div>
	
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
<!-- 网站尾部  -->
   <jsp:include page="../base/sneaker_footer.jsp"></jsp:include>
</body>
</html>