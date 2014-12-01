// JavaScript Document
function chooseAddress(){
	if(document.getElementById("newConsignee").checked==true) {
		$("#consignee-form").css("display","block");
		$("#consignee-form").css("border","2px solid #f00");
	}else {
		$("#consignee-form").css("display","none");
		$("#consignee-form").css("border","1px solid #ddd");
	}
}

function checkform(){ 
	var radArr = document.getElementsByName("addressId"); 
	var radValue = ""; 
	for(var i=0; i<radArr.length; i++){ 
	if(radArr[i].checked){ 
	radValue = radArr[i].value; 
	} 
	} 
	if(radValue==""||radValue==0){
	alert("请选择收货地址！！！");	return false;
	}
	else{return true;}
}

function changeArea(obj){
	document.getElementById("district").value=obj.value;
}



function ad_submit(){
	
	$.post("../order/newaddress",$("#Form").serializeArray(),
		function(result){
//			var result = $.parseJSON(result);
			if (result.success) {
				document.getElementById("newConsignee").checked=false;
				chooseAddress();
				$("#adrdiv").html("");
				var addresses = result.addresses;
				var html = "";
				$.each(addresses.content,function(i,address){  
                    if(address.isDefaultAddress == true){ 
                        html += "<div><input type='radio' class='hookbox' name='addressId' id='choseConsignee' value='"+address.addressId+"' checked onclick='chooseAddress();'/>";
                    }else{  
                    	html += "<div><input type='radio' class='hookbox' name='addressId' id='choseConsignee' value='"+address.addressId+"' onclick='chooseAddress();'/>";
                    }    
                    html += "<label for='choseConsignee'><b>";
                    html += address.addressName+"&nbsp;&nbsp;"+address.province+address.city+address.district+"&nbsp;&nbsp;";
                    html += address.detailAddress + "&nbsp; Tel:"+address.phone+"&nbsp;邮编:"+address.postcode;
                    html += "</b></label></div>";
                });  
				$("#adrdiv").html(html);
//				$(':input','#Form').not(':button,:submit,:reset,:hidden').val('').removeAttr('checked').removeAttr('checked');
			} else {
			}
	});
}

  

function getAddressId() {
	
	return $('input[name="addressId"]:checked').val();
};

