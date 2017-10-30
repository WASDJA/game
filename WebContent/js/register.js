$(function() {

	$('#switch_qlogin').click(function() {
		$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_bottom').animate({
			left : '0px',
			width : '70px'
		});
		$('#qlogin').css('display', 'none');
		$('#web_qr_login').css('display', 'block');

	});
	$('#switch_login').click(function() {

		$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({
			left : '154px',
			width : '70px'
		});

		$('#qlogin').css('display', 'block');
		$('#web_qr_login').css('display', 'none');
	});
	if (getParam("a") == '0') {
		$('#switch_login').trigger('click');
	}

});

function logintab() {
	scrollTo(0);
	$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({
		left : '154px',
		width : '96px'
	});
	$('#qlogin').css('display', 'none');
	$('#web_qr_login').css('display', 'block');

}

//username+phone+email
var usernamereg = /^[\w\W]{2,16}$/;
var userpwdreg = /^[\w\W]{6,16}$/;
var phonereg = /^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|18[0-9]{9}$/;
var usercodereg = /^\d{6,6}$/;
var emailreg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

//username
function checkusername() {
	var username = document.getElementById('username').value;
	if (!(usernamereg.test(username))) {
		return false;
	}
	$.post("http://localhost:8080/game/AjaxRegisterServlet", {
		username : $("#username").val()
	},
		function(data) { //回传函数  
			if (!data == "") {
				layer.alert(data, {
					skin : 'layui-layer-molv', //样式类名 自定义样式
					closeBtn : 1, // 是否显示关闭按钮
					anim : 1, //动画类型
					btn : [ '确定' ], //按钮
					icon : 5, // icon
				});
			}
		});
}

//usersubmit
function check1() {
	var username = document.getElementById('username').value;
	var userpassword = document.getElementById("p").value;
	var userphone = document.getElementById('phone').value;
	var usercode = document.getElementById("usercode").value;
	var useremail = document.getElementById('email').value;

	if (!(usernamereg.test(username)) || !(userpwdreg.test(userpassword)) || !(phonereg.test(userphone)) || !(usercodereg.test(usercode)) || !(emailreg.test(useremail))) {
		layer.alert("数据不能为空，请注意格式", {
			skin : 'layui-layer-molv', //样式类名 自定义样式
			closeBtn : 1, // 是否显示关闭按钮
			anim : 1, //动画类型
			btn : [ '确定' ], //按钮
			icon : 0, // icon
		});
		return false;
	}
	//	document.getElementById("reguser_form").submit();
	//	document.reguser_form.attributes["action"].value = "/UserRegisterServlet";
	//	document.reguser_form.submit();
	//	$('#reguser_form').attr("action", "UserRegisterServlet").submit();
	$.post("http://localhost:8080/game/UserRegisterServlet", {
		username : username,
		userpassword : userpassword,
		userphone : userphone,
		usercode : usercode,
		useremail : useremail
	},
		function(data) { //回传函数  
			var mail = "邮件发送成功,请前往注册邮箱进行激活";
			if (data == mail.toString()) {
				layer.alert(data, {
					skin : 'layui-layer-molv', //样式类名 自定义样式
					closeBtn : 0, // 是否显示关闭按钮
					anim : 1, //动画类型
					btn : [ '确定' ], //按钮
					icon : 6, // icon
					yes : function() { //按钮【按钮一】的回调
						window.location.href = 'http://www.hao123.com/mail';
					}
				});
			} else {
				layer.alert(data, {
					skin : 'layui-layer-molv', //样式类名 自定义样式
					closeBtn : 1, // 是否显示关闭按钮
					anim : 1, //动画类型
					btn : [ '确定' ], //按钮
					icon : 4, // icon
				});
			}
		});
}

//user验证码按钮
function showtime(t) {
	var username = document.getElementById('username').value;
	var phonenum = document.getElementById('phone').value;
	if (!(usernamereg.test(username)) || !(phonereg.test(phonenum))) {
		layer.msg('用户名和手机号不能为空，请您注意手机号码格式', {
			time : 2000, //1.5s后自动关闭
			btn : [ '确定' ]
		});
		return false;
	}
	document.getElementById('getcode').disabled = true;
	$.post("http://localhost:8080/game/AjaxUserPhoneServlet", {
		username : $("#username").val(),
		userphone : $("#phone").val()
	},
		function(data) { //回传函数  
			if (!(data == "")) {
				layer.alert(data, {
					skin : 'layui-layer-molv', //样式类名 自定义样式
					closeBtn : 1, // 是否显示关闭按钮
					anim : 1, //动画类型
					btn : [ '确定' ], //按钮
					icon : 5, // icon
				});
				return;
			}
			for (i = 1; i <= t; i++) {
				window.setTimeout("update_p(" + i + "," + t + ")", i * 1000);
			}
		});
}

function update_p(num, t) {
	if (num == t) {
		document.getElementById('getcode').value = " 获取验证码 ";
		document.getElementById('getcode').disabled = false;
	} else {
		printnr = t - num;
		document.getElementById('getcode').value = "重新发送" + "(" + printnr + ")";
	}
}

//business验证码按钮
function showtime2(t) {
	var phonenum1 = document.getElementById('phone1').value;
	if (!(phonereg.test(phonenum1))) {
		layer.msg('手机号不能为空，请您注意手机号码格式', {
			time : 2000, //1.5s后自动关闭
			btn : [ '确定' ]
		});
		return false;
	}
	document.getElementById('getcode2').disabled = true;
	for (i = 1; i <= t; i++) {
		window.setTimeout("update_p2(" + i + "," + t + ")", i * 1000);
	}
}

function update_p2(num, t) {
	if (num == t) {
		document.getElementById('getcode2').value = " 获取验证码 ";
		document.getElementById('getcode2').disabled = false;
	} else {
		printnr = t - num;
		document.getElementById('getcode2').value = "重新发送" + "(" + printnr + ")";
	}
}

//business_id
var business_idreg = /^\d{15,15}$/;

function checkbusiness_id() {
	var business_id = document.getElementById('business_id').value;
	if (!(business_idreg.test(business_id))) {
		return false;
	}
	$.post("http://localhost:8080/game/IdRegisterServlet", {
		business_id : $("#business_id").val()
	},
		function(data) { //回传函数  
			layer.alert(data, {
				skin : 'layui-layer-molv', //样式类名 自定义样式
				closeBtn : 1, // 是否显示关闭按钮
				anim : 1, //动画类型
				btn : [ '确定' ], //按钮
				icon : 5, // icon
			});
		});
}

//businesssubmit
function check2() {
	var business_id = document.getElementById('business_id').value;
	var business_phone = document.getElementById('phone1').value;
	var business_email = document.getElementById('business_email').value;

	if (!(business_idreg.test(business_id)) || !(phonereg.test(business_phone)) || !(emailreg.test(business_email))) {
		layer.alert("数据不能为空，请注意格式", {
			skin : 'layui-layer-molv', //样式类名 自定义样式
			closeBtn : 1, // 是否显示关闭按钮
			anim : 1, //动画类型
			btn : [ '确定' ], //按钮
			icon : 0, // icon
		});
		return false;
	}
}