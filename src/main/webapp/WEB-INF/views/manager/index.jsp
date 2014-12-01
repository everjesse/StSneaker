<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>波鞋街</title>
 	<link rel="stylesheet" type="text/css" href="${ctx}/common/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/common/js/easyui/themes/icon.css">
    <script type="text/javascript" src="${ctx}/common/js/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/common/js/easyui/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout" style="margin:0 0">
        <!-- 头部 -->
        <div data-options="region:'north'" style="height:50px;text-align:center">
        	<img src="${ctx}/common/img/logintitle.gif" height="45px">
        </div>
        <!-- 底部 -->
        <div data-options="region:'south',split:true" style="height:30px;text-align:center;padding:5px">
        设计人员：李爽、刘方铭&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;美工：刘良军、黄厚文&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开发人员： 陈俊挺、季江舟、何朋聪
        </div>
        <!-- 左边功能 -->
        <div class="easyui-panel" data-options="region:'west',split:true" title="波鞋街功能管理" style="width:150px;">
        <ul class="easyui-tree">
            <li>
                <span>任务管理</span>
                <ul>
                    <li><a href="#"  onclick="addPanel('任务管理','../manager/task/view')" style="text-decoration:none;">任务管理</a></li>
                </ul>
            </li>
            
            <li>
                <span>商品管理</span>
                <ul>
                    <li><a href="#"  onclick="addPanel('商品管理','../manager/product/view')" style="text-decoration:none;">商品管理</a></li>
                </ul>
            </li>
        </ul>
			
        </div>
        <div id="tt" class="easyui-tabs" data-options="tools:'#tab-tools',region:'center',">
           
        </div>
	  <script type="text/javascript">
	        function addPanel(title,url){
	        	if($('#tt').tabs('exists',title)){
	        		//更新
	        		$('#tt').tabs('select',title);
	        	}else{
	        		//添加
	        		$('#tt').tabs('add',{
	                    title: title,
	                    content: '<iframe src="'+url+'" style="width:100%;height:100%" frameborder="0" scrolling="no"></iframe>',
	                    closable: true
	                });
	        	}
	            
	        }
	        function removePanel(){
	            var tab = $('#tt').tabs('getSelected');
	            if (tab){
	                var index = $('#tt').tabs('getTabIndex', tab);
	                $('#tt').tabs('close', index);
	            }
	        }
	    </script>
</body>
</html>


