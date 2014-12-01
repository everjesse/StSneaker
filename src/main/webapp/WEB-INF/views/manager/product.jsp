<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>商品管理</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/common/js/easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/common/js/easyui/themes/icon.css"/>
    <script type="text/javascript" src="${ctx}/common/js/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/common/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        var url;
        function create(){
            $('#dlg').dialog('open').dialog('setTitle','添加商品');
            $('#fm').form('clear');
            url = '../../manager/product/create';
        }
        
        function update(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','编辑商品');
                $('#fm').form('load',row);
                url = '../../manager/product/update?productId='+row.productId;
            }
        }
        function save(){
        	   $('#fm').form('submit',{
                   url: url,
                   onSubmit: function(){
                       return $(this).form('validate');
                   },
                   success: function(result){
                       var result = eval('('+result+')');
                       if (result.errorMsg){
                           $.messager.show({
                               title: 'Error',
                               msg: result.errorMsg
                           });
                       } else {
                           $('#dlg').dialog('close');        
                           $('#dg').datagrid('reload');   
                       }
                   }
               });
        }
        function deleteOne(){
        	 var row = $('#dg').datagrid('getSelected');
             if (row){
                 $.messager.confirm('删除商品','你确认要删除这个商品嘛?',function(r){
                     if (r){
                         $.get('../../manager/product/delete/'+row.productId,function(result){
                             if (result.success){
                                 $('#dg').datagrid('reload'); 
                             } else {
                                 $.messager.show({
                                     title: 'Error',
                                     msg: result.errorMsg
                                 });
                             }
                         },'json');
                     }
                 });
             }
        }
        </script>
</head>
<body>
<h2>商品管理</h2>
    <p></p>
<!-- 列表 -->
    <table id="dg" title="商品管理" class="easyui-datagrid" style=""
            url="../../manager/product/list"
            toolbar="#dgtoolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="productId" width="50">商品Id</th>
                <th field="productName" width="50">商品名称</th>
                <th field="brandName" width="50">品牌名称</th>
                <th field="productStock" width="50">商品数量</th>
                <th field="productMarketPrice" width="50">商品售价</th>
                <th field="productTradePrice" width="50">商品交易价</th>
                <th field="type" width="50">鞋子类型</th>
                <th field="isOnSale" width="50">是否在售</th>
                <th field="firstPageModule" width="50">首页标识</th>
                <th field="size" width="50">商品码数</th>
                <th field="productPhoto" width="50">商品图片</th>
                <th field="productBriefInfo" width="50">商品详情</th>
            </tr>
        </thead>
    </table>

<!-- 功能按钮 -->
    <div id="dgtoolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="create();">添加商品</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="update();">编辑商品</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteOne();">删除商品</a>
    </div>

   <!-- 编辑框及功能 -->
    <div id="dlg" class="easyui-dialog" style="width:400px;height:550px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
        <div class="ftitle">商品信息</div>
        <form id="fm" method="post" enctype="multipart/form-data" novalidate>
            <div class="fitem">
                <label>商品名称:</label>
                <input name="productName" class="easyui-validatebox" required="true"/>
            </div>
           
             <div class="fitem">
            	<label>商品数量:</label>
            	<input name="productStock" class="easyui-validatebox" required="true"/>
            </div>
               <div class="fitem">
            	<label>商品售价:</label>
            	<input name="productMarketPrice" class="easyui-validatebox" required="true"/>
            </div>
            <div class="fitem">
            	<label>商品交易价:</label>
            	<input name="productTradePrice" class="easyui-validatebox" required="true"/>
            </div>
            <div class="fitem">
            	<label>商品码数:</label>
            	<input name="size" class="easyui-validatebox" required="true"/>
            </div>
            
            <div class="fitem">
            	<label>品牌名称:</label>
            	<select name="brandName" class="easyui-combobox" style="width:100px"/>
            		<option value="Adidas">Adidas</option>
        			<option value="Nike">Nike</option>
        			<option value="New Balance">NB</option>
        			<option value="Converse">converse</option>
        			<option value="Reebok">Reebok</option>
        		</select>
            </div>
            
              <div class="fitem">
            	<label>鞋子类型:</label>
            	<select name="type" class="easyui-combobox" style="width:100px"/>
            		<option value="篮球鞋">篮球鞋</option>
        			<option value="板鞋">板鞋</option>
        			<option value="跑鞋">跑鞋</option>
        			<option value="户外">户外</option>
        		</select>
            </div>
           
             <div class="fitem">
            	<label>是否在售:</label>
            	<select name="isOnSale" class="easyui-combobox" style="width:100px"/>
            	    <option value="1" selected>上架</option>
        			<option value="0">下架</option>
        		</select>
            </div>
             <div class="fitem">
            	<label>首页标识:</label>
            	<select name="firstPageModule" class="easyui-combobox" style="width:100px"/>
            		<option value="0" selected>非首页</option>
        			<option value="1">推荐</option>
        			<option value="2">热销</option>
        			<option value="3">新品</option>
        		</select>
            </div> 
        
             <div class="fitem">
            	<label>商品图片:</label>
                <input name="file" type="file"/>
            </div>
             <div class="fitem">
            	<label>商品详情:</label>
                <input name="file1" type="file"/>
            </div> 
            <input type="hidden" name="productBriefInfo" />
             <input type="hidden" name="productPhoto" />
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
    </div>


   <style type="text/css">
        #fm{
            margin:0;
            padding:10px 30px;
        }
        .ftitle{
            font-size:14px;
            font-weight:bold;
            padding:5px 0;
            margin-bottom:10px;
            border-bottom:1px solid #ccc;
        }
        .fitem{
            margin-bottom:5px;
        }
        .fitem label{
            display:inline-block;
            width:80px;
        }
    </style>
</body>
</html>