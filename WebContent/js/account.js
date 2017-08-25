


/* Ajax: Asynchronous JavaScript And XML */
$(function() {
//	var reg = /^\w{4,}$/; // 正则表达式: 至少匹配 4 位任意字母,数字,下划线
//	$("input[name='username']").keyup(function() {
//		if (!reg.test($(this).prop("value"))) {
//			$(this).addClass("redBorder");
//		} else {
//			$(this).removeClass("redBorder")
//		}
//	}).blur(function() {
//		$.getJSON("doLoginServlet", {"username" : $(this).prop("value")},
//            function(result) {
//            if (result == "true")//请求成功后要执行的代码
//                $("#mess").html("用户名可以使用");
//            else
//                $("#mess").html("用户名已經存在");
//            });
//	});
	
	$("#name").keyup(function(){
		//alert("sb");
		$.post("doCheckServlet",{name:$("#name").val()},function(n){
			 if(n==1){
	    		  alert("用戶名已存在");
	    	  }
		})
	});
});

