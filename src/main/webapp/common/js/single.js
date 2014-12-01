// JavaScript Document
function buttonSubmit(address){
		$("#Form").action=address;
		$("#Form").submit();
	
}
function num_del(){
	if(document.getElementById("product_amount").value>1)
	{
	--document.getElementById("product_amount").value;}
	}
function num_add(){
	a=$("#kucun").text()*1;
	if(document.getElementById("product_amount").value<a){
	++document.getElementById("product_amount").value;
	}}
function chooseSize(id){
	$("#size").value=id.title;
	$(".size a").css("border","1px #dcdcdc solid");
	$(id).css("border","1px #ff0000 solid");
	$("#itemMessage").html("已选择："+'“'+id.title+'”');
}

function toLogin(){
	alert("请先登录");
	window.location.href="/shoe-shop/user/login"; 
}
function checknumber(obj){
	b=$("#kucun").text()*1;
	if(obj.value>b){
		obj.value=b;
	}
}