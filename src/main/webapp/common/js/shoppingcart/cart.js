// JavaScript Document
function deleteNumber(item){
	if(document.getElementById(item).value>1)
	{
	--document.getElementById(item).value;
		amountAdd(item);
	}}
function addNumber(item){
	++document.getElementById(item).value;
	amountAdd(item);
	}
function amountAdd(item){
	d=item+"price";
	f=item+"amount";
	a=$("#"+d).val()*$("#"+item).val();
	b=a-$("#"+f).text();
	$("#"+f).text(a);
	c=$("#totalPro").text()*1+b*1;
	$("#totalPro").text(c);
	}