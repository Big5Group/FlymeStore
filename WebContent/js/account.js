/* Ajax: Asynchronous JavaScript And XML */
$(function() {
	/* 获取验证码 */
	$('#refreshAuthCode').click(function() {
		$('#authImg').attr('src', 'getAuthCode.do');
	});

	/* 注册名长度 Jquery 表单验证 */
	var reg = /^\w{4,}$/; // 正则表达式: 至少匹配 4 位任意字母,数字,下划线
	$("input[name='registerName']").keyup(function() {
		if (!reg.test($(this).prop("value"))) {
			$(this).addClass("redBorder");
		} else {
			$(this).removeClass("redBorder")
		}
	});
	/* 注册名 Jquery 表单验证 */
	$("input[name='registerName']").keyup(function() {
		$.post("doCheckServlet", {
			name : $("#registerName").val()
		}, function(n) {
			if (n == 1) {
				alert("用戶名已存在");
			}
		})
	});
	/* 修改 bug */

});
