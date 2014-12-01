
function setTab(name,cursel){
	cursel_0=cursel;
	for(var i=1; i<=links_len; i++){
		var menu = document.getElementById(name+i);
		var menudiv = document.getElementById("con_"+name+"_"+i);
		if(i==cursel){
			menu.className="off";
			menudiv.style.display="block";
		}
		else{
			menu.className="";
			menudiv.style.display="none";
		}
	}
}
function Next(){
	cursel_0++;
	if (cursel_0>links_len)cursel_0=1
	setTab(name_0,cursel_0);
}
var name_0='one';
var cursel_0=1;
//var ScrollTime=3000;//循环周期（毫秒）
var links_len,iIntervalId;
onload=function(){
	//var links = document.getElementById("tab1").getElementsByTagName('li');
	
	var links = $('.selectmenu ul li')

	links_len=links.length;
	for(var i=0; i<links_len; i++){
		links[i].onmouseover=function(){
			clearInterval(iIntervalId);
			this.onmouseout=function(){
//				iIntervalId = setInterval(Next,ScrollTime);;
			}
		}
	}
	document.getElementById("con_"+name_0+"_"+links_len).parentNode.onmouseover=function(){
		clearInterval(iIntervalId);
		this.onmouseout=function(){
//			iIntervalId = setInterval(Next,ScrollTime);;
		}
	}
	setTab(name_0,cursel_0);
//	iIntervalId = setInterval(Next,ScrollTime);
}




function show(id){
	var pid = "#orderinfo" + id;
    if($(pid).css("display")=="none")
         {$(pid).css("display","block");}
    else
       {$(pid).css("display","none");}


}



//$(document).ready(function(){
//$("#orderinfo").click(function(){
//    $(".newAddress").slideToggle("2000");
//  });
//});



$(document).ready(function(){
$("#changePassword").click(function(){
    $(".personnalitemc").slideToggle("2000");
  });
});



$(document).ready(function(){
$("#addNew").click(function(){
    $(".newAddress").slideToggle("2000");
  });
});


$(document).ready(function(){
	var myurl = new objURL();
	if(myurl.get('msg') == 1){
		alert('密码修改成功！');
		myurl.remove("msg");
		location.href=myurl.url();
	}
	else if(myurl.get('msg') == 2){
		alert('密码修改失败，请重试！');
		myurl.remove("msg");
		location.href=myurl.url();
	}
	else if(myurl.get('msg') == 3){
		alert('所选订单删除成功！');
		myurl.remove("msg");
		location.href=myurl.url();
	}
	else if(myurl.get('msg') == 4){
		alert('所选地址信息删除成功！');
		myurl.remove("msg");
		location.href=myurl.url();
	}
	else if(myurl.get('msg') == 5){
		alert('默认地址设置成功！');
		myurl.remove("msg");
		location.href=myurl.url();
	}
	else if(myurl.get('msg') == 6){
		alert('添加地址成功！');
		myurl.remove("msg");
		location.href=myurl.url();
	}
	});


/* 
 * 感谢！！！！！
说明：本代码可自由复制修改并且使用，但请保留作者信息！
Author: Kevin  WebSite: http://iulog.com/  QQ:251378427

JS 操作 URL 函数使用说明：
初始化 var myurl=new objURL(); //也可以自定义URL： var myurl=new objURL('http://iulog.com/?sort=js'); 
读取url参数值 var val=myurl.get('abc'); // 读取参数abc的值
设置url参数 myurl.set("arg",data); // 新增/修改 一个arg参数的值为data
移除url参数 myurl.remove("arg"); //移除arg参数
获取处理后的URL myurl.url();//一般就直接执行转跳 location.href=myurl.url();
调试接口：myurl.debug(); //修改该函数进行调试
 */
function objURL(url){
	var ourl=url||window.location.href;
	var href="";//?前面部分
	var params={};//url参数对象
	var jing="";//#及后面部分
	var init=function(){
		var str=ourl;
		var index=str.indexOf("#");
		if(index>0){
			jing=str.substr(index);
			str=str.substring(0,index);
		}
		index=str.indexOf("?");
		if(index>0){
			href=str.substring(0,index);
			str=str.substr(index+1);
			var parts=str.split("&");
			for(var i=0;i<parts.length;i++){
				var kv=parts[i].split("=");
				params[kv[0]]=kv[1];
			}
		}else{
			href=ourl;
			params={};
		}
	};
	this.set=function(key,val){
		params[key]=encodeURIComponent(val);
	};
	this.remove=function(key){
		if(key in params) params[key]=undefined;
	};
	this.get=function(key){
		return params[key];
	};
	this.url=function(key){
		var strurl=href;
        var objps=[];
        for(var k in params){
            if(params[k]){
                objps.push(k+"="+params[k]);
            }
        }
        if(objps.length>0){
            strurl+="?"+objps.join("&");
        }
        if(jing.length>0){
            strurl+=jing;
        }
        return strurl;
	};
	this.debug=function(){
		// 以下调试代码自由设置
		var objps=[];
		for(var k in params){
			objps.push(k+"="+params[k]);
		}
		alert(objps);//输出params的所有值
	};
	init();
}
