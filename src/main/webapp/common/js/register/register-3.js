
$(function(){
	$("#ackPassWord").focus(function(){
		//console.log("hello");
		    if(this.value=="")
			{
				$("#test2").html("请再次输入密码");
		        this.style.color="#333";
			}
		});
	$("#ackPassWord").blur(function(){
		checkAckPassWord(this);  
	});
	
	$("#passWord").blur(function(){
		checkPassword(this);
	});
	
	$("#passWord").focus(function(){
		//console.log("hello");
		if(this.value=="")
		{$("#test1").html("请输入密码,6到16个字符");
		this.style.color="#333";
		}
	});
	
	$("#regName").blur(function(){
		checkRegName(this);	
	});
	
	$("#regName").focus(function(){
		//console.log("hello");
		if(this.value=="请输入邮箱")
		  this.value="";  
		  $("#test").html("请输入邮箱");
		  this.style.color="#333";		
		});
	
	$("#registerForm").bind("submit", function() {
		var boo=false;
		boo = checkRegName(document.getElementById("regName"));
		if(boo==true){
			boo = checkPassword(document.getElementById("password("));
			if(boo==true){
				boo = checkAckPassWord(document.getElementById("ackPassWord"));
			}
		}
		return boo;
    });
});

function checkRegName(flied){
	with(flied){
		apos=value.indexOf("@")
        dotpos=value.lastIndexOf(".")
        if (apos<1||dotpos-apos<2){
        	$("#test").html("邮箱地址错误！");
        	return false;
		 }
        else {$("#test").html("邮箱地址正确。")
		      return true ;
		}
	}
}
	 
function checkPassword(flied){
	with(flied){
		if(value=="")
		{
		   $("#test1").html("")
		   return false;
		}
		else if(value.length<6||value.length>16)
		 {
			  $("#test1").html("密码长度不符，请输入6到16个字符！")
			  $("#test1").style.color="red"
				  return false;
		 }
		else{
			 $("#test1").html("");
			 return true;
			}	  
	}
}

function checkAckPassWord(flied){
	with(flied){
	    if(value=="")
		   {
			   $("#test2").html("");
			   return false;
		   }
		 else if(value===$("#passWord").val())
		   {
			   $("#test2").html("密码一致，可以使用");		   
			   return true ;
		   }   
		 else if(value!=$("#passWord").val())
		   {
			   $("#test2").html("密码不一致！"); 
			   return false; 
			    
		   }  
	}
}
