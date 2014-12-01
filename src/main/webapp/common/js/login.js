// JavaScript Document
var bull1=false,bull2=false;
$(document).ready(function() {
	//checkCondition();
    $("#usernameText").focus(function() {
        $("#promptMessge").html("请输入邮箱地址/用户名");
		$("#userReplace").html("");
		$("#username").css("border","1px solid red");
    });
	$("#usernameText").blur(function() {
		$("#username").css("border","1px solid gray");
		if(validateEmail(this)){
        $("#promptMessge").html(""); bull1=true;}
		else{
		 $("#promptMessge").html("邮箱地址/用户名不正确！");
		}
    });
	 $("#passwordText").focus(function() {
		 $("#password").css("border","1px solid red");
        $("#passPromptMessge").html("请填写长度为6-16个字符密码");
		$("#passReplace").html("");
    });
	$("#passwordText").blur(function() {
		$("#password").css("border","1px solid gray");
		if(this.value.length<=16&&this.value.length>=6){
        $("#passPromptMessge").html("");bull2=true;
		}
		else{
			$("#passPromptMessge").html("密码长度不正确！");
		}
    });
	$("#autoLogin").click(function() {
        if(document.getElementById("autoLogin").checked==true){
					$(".autoLogin").find("span").css("display","none");
					$(".autoLogin").find(".safe").css("display","inline-block");        
				}
		else{
			$(".autoLogin").find("span").css("display","");
					$(".autoLogin").find(".safe").css("display","none"); 
			}
    });
	
	$("#Form").bind("submit", function() {
		var boo=false;
		//验证账号
		boo = validateEmail(document.getElementById("usernameText"));
		//验证密码
		if(boo==true){
			var pwd = $("#passwordText").val();
			if(pwd.length>=6&&pwd.length<=16){
				boo = true;
			}else{
				$("#passPromptMessge").html("密码长度不正确！");
				boo = false;
			}
		}
		return boo;
    });


});
function validateEmail(field)
{
	console.log(field);
	with (field)
	{
	apos=value.indexOf("@");
	dotpos=value.lastIndexOf(".");
	if (apos<1||dotpos-apos<2) 
	  {return false}
	else {return true}
	}
}
function checkCondition(){
	 if(bull1==true&&bull2==true){
		 $("#loginsubmit").removeAttr("disabled");
	 }
	 else{
		  $("#loginsubmit").attr("disabled","true");
	 }
     }
	