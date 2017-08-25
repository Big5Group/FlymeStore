


/* Ajax: Asynchronous JavaScript And XML */
$(function() {
	var reg = /^\w{4,}$/; // 正则表达式: 至少匹配 4 位任意字母,数字,下划线
	$("input[name='username']").keyup(function() {
		if (!reg.test($(this).prop("value"))) {
			$(this).addClass("redBorder");
		} else {
			$(this).removeClass("redBorder")
		}
	}).blur(function() {
		// 第三种方法实现
		$.getJSON("doLoginServlet", {"username" : $(this).prop("value")},
            function(result) {
            if (result == "true")//请求成功后要执行的代码
                $("#mess").html("用户名可以使用");
            else
                $("#mess").html("用户名已經存在");
            });
	});
});

