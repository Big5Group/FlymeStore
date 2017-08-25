<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'index.jsp' starting page</title>

<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.5.2/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.5.2/themes/icon.css">
<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>

</head>

<script type="text/javascript">
	var url;
	function newUser() {
		$('#dlg').dialog('open').dialog('setTitle', '新增');
		$('#fm').form('clear');
		url = 'DoSearchCustomerServlet?f=add';
	}
	function editUser() {
		var row = $('#mTb').datagrid('getSelected');
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', '修改');
			$('#fm').form('load', row);
			url = 'DoSearchCustomerServlet?f=update&id=' + row.CustomerID;
		}
	}


	function saveUser(){
		$("#fm").form('submit', {
			url : url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(result) {
				if(result==0){
					alert("insert error");
				}
				else{
					$("#dlg").dialog('close');
					$("#mTb").datagrid('reload');
				}
			}
		})
	}
	
	
	
	function removeUser() {
		var row = $('#mTb').datagrid('getSelected');
		if (row) {
			$.messager.confirm('确认', '您确定要删除吗？', function(r) {
				if (r) {
					$.post('DoSearchCustomerServlet?f=delete', {
						id : row.CustomerID
					}, function(result) {
						if (result.success) {
							$.messager.show({ // show error message
								title : '提示',
								msg : result.message
							});
							$('#mTb').datagrid('reload'); // reload the user data
						} else {
							$.messager.show({ // show error message
								title : '提示',
								msg : result.message
							});
						}
					}, 'json');
				}
			});
		}
	}
		
	function doSearch() {
		$('#mTb').datagrid('load', {
			name : $('#username').val(),
			xueli : $('#userxueli').val()
		});
	}
	
    function pagerFilter(data){
        if (typeof data.length == 'number' && typeof data.splice == 'function'){    // 判断数据是否是数组
            data = {
                total: data.length,
                rows: data
            }
        }
        var dg = $(this);
        var opts = dg.datagrid('options');
        var pager = dg.datagrid('getPager');
        pager.pagination({
            onSelectPage:function(pageNum, pageSize){
                opts.pageNumber = pageNum;
                opts.pageSize = pageSize;
                pager.pagination('refresh',{
                    pageNumber:pageNum,
                    pageSize:pageSize
                });
                dg.datagrid('loadData',data);
            }
        });
        if (!data.originalRows){
            data.originalRows = (data.rows);
        }
        var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
        var end = start + parseInt(opts.pageSize);
        data.rows = (data.originalRows.slice(start, end));
        return data;
    }

    $(function(){//加载数据
        $('#mTb').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData());
    });
</script>

<body>
	<table id="mTb" class="easyui-datagrid" width="100%"
		url="DoSearchCustomerServlet?f=query" toolbar="#toolbar"
		pagination="true" rownumbers="true" fitColumns="true"
		singleSelect="true" pageSize="5" pageList="[3,5,8,10]">
		<thead>
			<tr>
				<th field="CustomerID" width="50" data-options="hidden: true">CustomerID</th>
				<th field="CallName" width="50">CallName</th>
				<th field="CustomPass" width="50">CustomPass</th>
				<th field="Email" width="50">Email</th>
				<th field="CustomSex" width="50">CustomSex</th>
				<th field="FoundDate" width="50">FoundDate</th>
				<th field="State" width="50">State</th>
			</tr>
		</thead>
	</table>

	<div id="toolbar">
	<a type="button" class="easyui-linkbutton" iconCls="icon-add"
			plain="true" onclick="newUser()">新增</a>
	<a type="button" class="easyui-linkbutton" iconCls="icon-edit"
			plain="true" onclick="editUser()">修改</a>	
	<a type="button" class="easyui-linkbutton" iconCls="icon-remove"
			plain="true" onclick="removeUser()">删除</a>

	</div>
	<div id="dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">用户信息</div>
		
		
		
		<form id="fm" method="post">
			<div class="fitem">
				<label>昵称:</label> 
				<input name="CallName"  class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>密码:</label> 
				<input name="CustomPass" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>邮箱:</label> 
				<input name="Email" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>性别:</label> <input name="CustomSex"
					class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>日期:</label> <input name="FoundDate"class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>状态:</label> <input name="State" class="easyui-validatebox"
					required="true">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveUser()">提交</a> 
		<a href="#" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
</body>
</html>