<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>用户中心 - 波鞋街</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/style.css"  />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/megamenu.css"  />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/common/css/usercenter/usercenter.css"  />
<link type="text/css" rel="stylesheet" href="${ctx}/common/js/bootstrap/2.3.2/css/page.css"/>
<!-- start menu
<link href='http://fonts.googleapis.com/css?family=Exo+2' rel='stylesheet' type='text/css'> 
-->
<script type="text/javascript" src="${ctx}/common/js/usercenter/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/common/js/usercenter/usercenterreset.js"></script>
<script type="text/javascript" src="${ctx}/common/js/usercenter/jsAddress.js"></script>
<script type="text/javascript" src="${ctx}/common/js/usercenter/usercenter.js"></script>
<script type="text/javascript" src="${ctx}/common/js/jquery1.min.js"></script>
<script type="text/javascript" src="${ctx}/common/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<!-- dropdown -->
<script type="text/javascript" src="${ctx}/common/js/jquery.easydropdown.js"></script>

<style type="text/css"> 

div.personnalitemc
{
display:none;
}

div.newAddress
{
display:none;
}
</style>
</head>
<body>

  </head>
  <!-- 网站头部 -->
  <jsp:include page="../base/sneaker_header.jsp"></jsp:include>
  
 
  
<div style="width:100%;height:auto" align="center">
	<div style="width:80%; height:auto">
		<div class="tab1" >
            <div class="selectmenu">
                <ul id="tab1">
                    <li id="one1" onclick="setTab('one',1)">个人资料</li>
                    <li id="one2" onclick="setTab('one',2)">我的订单</li>
                    <li id="one3" onclick="setTab('one',3)">地址管理</li>
                    <li id="one4" onclick="setTab('one',4)">关于我们</li>
                </ul>
            </div>
            <div class="selectmenudiv">
                <div id="con_one_1" >
                    
                    <div class="personnalitem" align="center">
                         <div style="width:100%;height:30%"></div>
                         <div class="item_left" >&nbsp;&nbsp;&nbsp;&nbsp;绑定邮箱&nbsp;&nbsp;：</div>
                         <div class="item_right" align="left">
                              <div>${user.mailbox}</div>
                         </div>
                    </div>
                    
                    <div class="personnalitem" >
                          <div style="width:30%;height:65px;float:left;text-align:center;color:#46468E;font-weight:bolder" id="changePassword">修改密码</div>
                          <div class="item_right"><p></p></div>
                    </div>      
                    <form id="resetform" method="POST" action="${ctx}/usercenter/updatepassword">
                    <div class="personnalitemc" align="center">
                         <div class="item_left" >&nbsp;&nbsp;&nbsp;&nbsp;原密码&nbsp;&nbsp;：</div>
                         <div class="item_right" align="left">
                              <div >
                                    <input type="password" id="oldpassword" name="oldpassword" tabindex="1" value="">
                              </div>
                         </div>     
                    </div>
                    <div class="personnalitemc" align="center">
                         
                         <div class="item_left" >&nbsp;&nbsp;&nbsp;&nbsp;新密码&nbsp;&nbsp;：</div>
                         <div class="item_right" align="left" >
                              <div >
                                   <div style="float:left"><input type="password" id="newpassword" name="newpassword" tabindex="2" value=""> </div>
                                   <div id="newtext" style="float:left;font-size:smaller"></div> 
                              </div>
                         </div>     
                    </div>
                    
                    <div class="personnalitemc" align="center">
                         <div class="item_left" >&nbsp;&nbsp;&nbsp;&nbsp;确认密码&nbsp;&nbsp;：</div>
                         <div class="item_right" align="left">
                              <div >
                                    <div style="float:left"><input type="password" id="acknewpassword" name="acknewpassword" tabindex="3" value=""></div>
                                    <div id="acktext" style="float:left;font-size:smaller"></div>
                              </div>
                         </div>     
                    </div>
                    
                    <div class="personnalitemc" align="center">
                         <div class="item_left"></div>
                         <div class="item_right" align="left">
                              <div style="width:100%;height:7%"></div>
                              <div><input type="submit" id="newpasswordsubmit" name="newpasswordsubmit"tabindex="4" style="width:160px;height:30px;background-color:#4cb1ca;border:none">
                              </div>
                         </div>     
                    </div> 
                    </form> 
                  
                </div>

                <div id="con_one_2" style="display:none">
                <tags:pagination page="${Order}" paginationSize="5" />
                     <c:forEach items="${Order.content}" var="orderinfo">
                     <div class="order_item" align="center">
                     
                          <div class="order_item_span1" align="left"><div>&nbsp;&nbsp;订单号 S00${orderinfo.orderId}</div></div>
                          <div class="order_item_span1" align="right"><div>${orderinfo.orderCreateTime }&nbsp;&nbsp;</div></div>
                      
                          <div class="order_item_span2" align="left"><div>&nbsp;&nbsp;收件人：${orderinfo.addressName}</div></div>
                          <div class="order_item_span2" align="center"><div>货到付款</div></div>
                          <div class="order_item_span2" align="right"><div>正在派送&nbsp;&nbsp;</div></div>
                       
                          <div class="order_item_span2" align="left"><div>&nbsp;&nbsp;总金额：￥${orderinfo.orderTotalMoney}</div></div>
                          <div class="order_item_span2" align="center"><div>收货地址：${orderinfo.deliveryAddress}&nbsp;&nbsp;</div></div>
                          <div class="order_item_span2" align="right"><div><button name="orderdetail" id="orderdetail" style="color:#90F; border:none; background-color:#F3F3F3 " onClick="show(${orderinfo.orderId})" value="1">订单详情</button> | &nbsp;&nbsp;<a href="${ctx}/usercenter/deletes/${orderinfo.orderId}" style="color:#90F; font-size:small">删除&nbsp;&nbsp;</a></div></div>
                     </div>
                     
                     <div id="orderinfo${orderinfo.orderId}" style="display:none">
                     	<c:forEach items="${orderinfo.orderdetails}" var="orderdetail">
                         <div class="order_item2" align="left" >
                              <div style="width:100%;height:auto">
                                   <div class="item_img" style="width:30%;height:100% ;float:left;" >
                                    <a href="${ctx}/products/detail?productId=${orderdetail.productId}"><img src="${ctx}/common/img/upload/${orderdetail.productPhoto }" width="90px" height="90px" ></a>
                                  </div> 
                                  <div class="item_info"  style="width:40%;height:100%;float:left;" align="center" >
                                       <div style="width:100% ;height:28px"><p></p></div>
                                      购买单价：${orderdetail.productTradePrice}元
                                  </div>
                                 <div class="item_amt" style="width:30%;height:100%;float:left;"  align="center">
                                      <div style="width:100% ;height:28px"><p></p></div>
                                                                                                 数量:${orderdetail.productAmount}
                                 </div> 
                              </div>
                        </div> 
                        <div class="clear"></div>  
                        </c:forEach>
                      <div class="clear"></div>  
                      </div>
                     </c:forEach> 
                </div>
                
                
                <div id="con_one_3" style="display:none;">
                     <!--  显示已有地址   -->
                     <tags:pagination page="${Address}" paginationSize="5" />
                     <div class="address_item" align="center">           
                          <div class="address_item_span1">收件人</div>
                          <div class="address_item_span2">所在地区</div>
                          <div class="address_item_span3">街道地址</div>
                          <div class="address_item_span4">电话/手机</div>
                          <div class="address_item_span5">操作</div>
                     </div>               
                <c:forEach items="${Address.content}" var="address">
                     <div class="address_item" align="center">           
                          <div class="address_item_span1">${address.addressName}</div>
                          <div class="address_item_span2">${address.province} ${address.city} ${address.district}</div>
                          <div class="address_item_span3">${address.detailAddress}</div>
                          <div class="address_item_span4">${address.phone}</div>
                          <c:if test="${address.isDefaultAddress==true}">
                             <div class="address_item_span5"><b>默认地址</b> | <a href="${ctx}/usercenter/delete/${address.addressId}" style="color:#90F">删除</a></div>
                          
                          </c:if>
                          <c:if test="${address.isDefaultAddress==false}">
                          <div class="address_item_span5"><a href="${ctx}/usercenter/default/${address.addressId}?#con_one_3"style="color:#90F">设为默认</a> | <a href="${ctx}/usercenter/delete/${address.addressId}" style="color:#90F">删除</a></div>
                          
                          </c:if>
                     </div> 
                 </c:forEach> 	                
                     <!--  添加地址   -->
                     <div style="width:100%;height:360px;margin:3px;background-color:#F3F3F3;font-size:small" align="center">  
                          <div style="width:100%;height:25px">
                           <div style="width:20% ;height:100%;float:left;font-size:18px;font-weight:bold;color:#2D015C" align="center" id="addNew">添加地址</div>
                           <div style="width:80% ;height:100%;float:left"><p></p></div>
                          </div> 
                           <form id="addressSetForm" method="post" action="${ctx}/usercenter/create" >
                                 <div style="width:20% ;height:40px;float:left" align="right" class="newAddress">收件人姓名：</div>  
                                 <div style="width:80% ;height:40px;float:left" align="left" class="newAddress"><input type="text" name="addressName" tabindex="1" value=""></input></div>
                                  
                                 <div style="width:20% ;height:40px;float:left" align="right"class="newAddress">电话/手机：</div>  
                                 <div style="width:80% ;height:40px;float:left" align="left" class="newAddress"><input type="text" name="phone" tabindex="2" value=""></input></div> 
                                 
                                 <div style="width:20% ;height:40px;float:left" align="right" class="newAddress">邮编：</div>  
                                 <div style="width:80% ;height:40px;float:left" align="left" class="newAddress"><input type="text" name="postcode" tabindex="3" value=""></input></div> 
                                 
                                 <div style="width:20% ;height:40px;float:left" align="right" class="newAddress">所在地区：</div>  
                                 <div style="width:80% ;height:40px;float:left" align="left" class="newAddress">
                                                                                                    省：<select id="cmbProvince" name="province"  tabindex="4" onchange="document.getElementById('province').value=document.getElementById('cmbProvince').value"></select>  
                                                                                                    市：<select id="cmbCity"     name="city"      tabindex="5" onchange="document.getElementById('city').value=document.getElementById('cmbCity').value"></select>
                                                                                                    区：<select id="cmbArea"     name="district"  tabindex="6" onchange="document.getElementById('district').value=document.getElementById('cmbArea').value"></select>
                                 <input type="hidden" id="province" name="province" value="" ></input>
                                 <input type="hidden" id="city" name="city" value="" ></input>
                                 <input type="hidden" id="district" name="district" value="" ></input>
                                            
                                 </div>
                                 <script type="text/javascript">
	                                     addressInit('cmbProvince', 'cmbCity', 'cmbArea', '四川', '成都市', '成华区');
	                                    // addressInit('Select1', 'Select2', 'Select3');
                                 </script>
                                 <div style="width:20% ;height:90px;float:left" align="right" class="newAddress">详细地址：</div>  
                                 <div style="width:80% ;height:90px;float:left" align="left" class="newAddress"><textarea name="detail"  id="detail" tabindex="4"   cols="40" rows="4" onBlur="document.getElementById('detailarea').value=document.getElementById('detail').value"></textarea>
                                 <input type="hidden" id="detailarea" name="detailAddress" value=""></input></div>
                                 
                                 <div style="width:20% ;height:40px;float:left; vertical-align:middle" align="right" class="newAddress">是否设为默认地址</div>  
                                 <div style="width:80% ;height:40px;float:left; vertical-align:middle" align="left" class="newAddress">
                                 <div style="width:100%;height:7%" class="newAddress"><p></p></div>
                                  <input type="checkbox"  name="isDefaultAddress" value="1"  tabindex="7" ></input>
                                  </div> 
                                 
                                 <div style="width:20% ;height:40px;float:left" align="right" class="newAddress"><p></p></div>  
                                 <div style="width:80% ;height:40px;float:left" align="left" class="newAddress"><input type="submit" id="newaddresssubmit" name="newaddresssubmit" value="保存"tabindex="8" style="width:160px;height:30px;background-color:#4cb1ca;border:none"></input></div> 
                           </form>  
                     </div>
                
                
                </div>
                
                <div id="con_one_4" style="display:none;">我的网站我做主</div>
            </div>
            
    	</div>
	</div>
</div>      
             
        <!-- 网站尾部  -->
   <jsp:include page="../base/sneaker_footer.jsp"></jsp:include>
        
</body>
</html>