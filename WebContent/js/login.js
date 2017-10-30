jQuery(document).ready(function() {
	var code = 9999;

	function codes() {
		var ranColor = '#' + ('00000' + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6); //随机生成颜色
		// alert(ranColor)
		var ranColor2 = '#' + ('00000' + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6);
		var num1 = Math.floor(Math.random() * 100);
		var num2 = Math.floor(Math.random() * 10);
		code = num1 + num2;

		$("#code").html(num1 + "+" + num2 + "=?");
		$("#code").css('background', ranColor);
		$("#code").css('color', ranColor2);

	}
	codes()
	$("#code").on('click', codes)

	function ajaxPost() {
		$.post("http://localhost:8080/game/LoginServlet", {
			username : $("#username").val(),
			userpwd : $("#userpwd").val(),
			usertype : $("#usertype").val()
		},
			function(data) { //回传函数  
				var gu = "管理员";
				var qi = "企业用户";
				if (data == "") {
					window.location.href = 'http://localhost:8080/game/gameweb/gameweb.jsp';
				} else if (data == gu.toString()) {
					window.location.href = 'http://localhost:8080/game/gameweb/backend.jsp';
				} else if (data == qi.toString()) {
					window.location.href = 'http://localhost:8080/game/gameweb/backend.jsp';
				}
				$("#userfont1").text(data);
			});
	}

	$('#userlogin').click(function() {
		var username = $("#admin").find('.username').val();
		var password = $("#admin").find('.password').val();

		if (username.replace(/\s/ig, "").length < 1) {
			$("#admin").find('.error').fadeOut('fast', function() {
				$(this).css('top', '27px');
			});
			$("#admin").find('.error').fadeIn('fast', function() {
				$(this).parent().find('.username').focus();
			});
			return false;
		}
		if (password.replace(/\s/ig, "").length < 6 || password.replace(/\s/ig, "").length > 16) {
			$("#admin").find('.error').fadeOut('fast', function() {
				$(this).css('top', '96px');
				alert("输入有误，密码长度为6-16位！")
			});
			$("#admin").find('.error').fadeIn('fast', function() {
				$(this).parent().find('.password').focus();
			});
			return false;
		}
		if ($("#yanzhengma").val() == code && code != 9999) {
			ajaxPost();
		} else {
			$('#admin').find('.error').fadeOut('fast', function() {
				$(this).css('top', '161px');
			});
			$('#admin').find('.error').fadeIn('fast', function() {
				$(this).parent().find('#yanzhengma').focus();
			});
			return false;
		}
	});

	$('#admin form .username, #admin form .password,  #yanzhengma').keyup(function() {
		$(this).parent().find('.error').fadeOut('slow');
	});

});