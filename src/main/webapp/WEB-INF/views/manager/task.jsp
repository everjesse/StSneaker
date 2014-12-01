<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>任务管理</title>
    <meta http-equiv="Cache-Control" content="no-store" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
    <link rel="stylesheet" type="text/css" href="${ctx}/common/js/easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/common/js/easyui/themes/icon.css"/>
    <script type="text/javascript" src="${ctx}/common/js/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/common/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        var url;
        function create(){
            $('#dlg').dialog('open').dialog('setTitle','添加任务');
            $('#fm').form('clear');
            url = '../../manager/task/create';
        }
        
        function update(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','编辑任务');
                $('#fm').form('load',row);
                url = '../../manager/task/update';
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
        
        function deleteAll(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('删除任务','你确认要删除这个任务嘛?',function(r){
                    if (r){
                        $.get('../../manager/task/delete/'+row.taskId,function(result){
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
    <h2>任务管理</h2>
    <p></p>
    <!-- 列表 -->
    <table id="dg" title="任务管理" class="easyui-datagrid" style=""
            url="../../manager/task/list"
            toolbar="#dgtoolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="taskId" width="50">任务Id</th>
                <th field="taskName" width="50">任务名称</th>
            </tr>
        </thead>
    </table>
    <!-- 功能按钮 -->
    <div id="dgtoolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="create();">添加任务</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="update();">编辑任务</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteAll();">删除任务</a>
    </div>
    <!-- 编辑框及功能 -->
    <div id="dlg" class="easyui-dialog" style="width:400px;height:200px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
        <div class="ftitle">任务信息</div>
        <form id="fm" method="post" novalidate>
            <div class="fitem">
                <label>任务名称:</label>
                <input name="taskId" type="hidden"/>
                <input name="taskName" class="easyui-validatebox" required="true"/>
            </div>
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