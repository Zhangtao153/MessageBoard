<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>发布留言</title>
	<link rel="stylesheet" href="css/bootstrap.min.css" />

	<link rel="stylesheet" href="kindeditor/themes/default/default.css" />
	<script charset="UTF-8" src="kindeditor/kindeditor-all-min.js"></script>
	<script charset="UTF-8" src="kindeditor/lang/zh-CN.js"></script>

	<style type="text/css">
		.navtit{ height: 50px; }
		.navbut{ line-height: 50px;}
	</style>

	<script>
        //KindEditor脚本
        var editor;
        KindEditor.ready(function(K) {
            editor = K.create('textarea[name="content"]', {
                resizeType : 0,
                width:'180px',
                height:'180px',
                allowPreviewEmoticons : false,
                allowImageUpload : false,
                items : [
                    'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                    'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                    'insertunorderedlist', '|',  'image'],
            });
        });

	</script>

</head>
<body>
<!--  -->
<div style="height: 50px;"></div>
<div class="container">
	<div class="row navtit">
		<div class="col-xs-6">
			<p class="navbut">
				<a href="#" class="btn btn-primary">首页</a>
				<a href="#" class="btn btn-danger">发布留言</a>
			</p>
		</div>
	</div>

	<div class="row">
		<div class="panel panel-success" style="">
			<div class="panel-heading"> 发布问题</div>
			<div class="panel-body">

				<form action="msg" method="post">
					<input type="hidden" name="token" />
					<input type="hidden" name="action" value="msg_saveadd" />
					<input type="hidden" name="admin_id" value="" />


					<div class="form-group">
						<input type="text" name="title" class="form-control" id="msg_title" placeholder="请输入标题" />
					</div>

					<div class="form-group">
						<textarea name="content" class="form-control" cols="25" rows="8"></textarea>
					</div>

					<button type="submit" class="btn btn-success">留言</button>

				</form>


			</div>
		</div>
	</div>
</div>
<%@include file="booter.jsp"%>
</body>
</html>

