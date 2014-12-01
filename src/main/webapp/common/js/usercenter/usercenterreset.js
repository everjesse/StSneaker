// JavaScript Document
$(function(){
	
	
	$("#newpassword").focus(function(){
		//console.log("hello");
		if(this.value=="")
		{$("#newtext").html("请输入密码,6到16个字符");
		this.style.color="#333";
		}
	});
	
	
	$("#newpassword").blur(function(){
		checkPassword(this);
	});
	
	
	
	
	
	
	
	
	$("#acknewpassword").focus(function(){
		//console.log("hello");
		    if(this.value=="")
			{
				$("#acktext").html("请再次输入密码");
		        this.style.color="#333";
			}
		});
	$("#acknewpassword").blur(function(){
		checkAckPassWord(this);  
	});
	
	
	
	

	
	$("#resetform").bind("submit", function() {
		var boo=false;
		boo = checkPassword(document.getElementById("password"));
		if(boo==true){
			boo = checkAckPassWord(document.getElementById("ackpassword"));
		}
		return boo;
    });
});


	 
function checkPassword(flied){
	with(flied){
		if(value=="")
		{
		   $("#newtext").html("")
		   return false;
		}
		else if(value.length<6||value.length>16)
		 {
			  $("#newtext").html("密码长度不符，请输入6到16个字符！")
			  $("#newtext").style.color="red"
				  return false;
		 }
		else{
			 $("#newtext").html("");
			 return true;
			}	  
	}
}

function checkAckPassWord(flied){
	with(flied){
	    if(value=="")
		   {
			   $("#acktext").html("");
			   return false;
		   }
		 else if(value===$("#newpassword").val())
		   {
			   $("#acktext").html("密码一致，可以使用");		   
			   return true ;
		   }   
		 else if(value!=$("#newpassword").val())
		   {
			   $("#acktext").html("密码不一致！"); 
			   return false; 
			    
		   }  
	}
}
