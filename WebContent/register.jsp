<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
    <meta charset="utf-8"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/Validform_v5.3.2.js"></script>
	<script type="text/javascript" src="js/register.js"></script>
	<script type="text/javascript" src="layer-v3.0.3/layer/layer.js"></script>

	<link rel="stylesheet" type="text/css" href="css/register.css" />
	<link rel="stylesheet" type="text/css" href="css/style.css" />

  </head>
  
  <body>
    
    <h1>欢迎注册<sup>nick</sup></h1>

		<div class="login" style="margin-top:50px;">

			<div class="header">
				<div class="switch" id="switch">
					<a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);">个人注册</a>
					<a class="switch_btn" id="switch_login" href="javascript:void(0);">商家注册</a>
					<div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
				</div>
			</div>

			<div class="web_qr_login" id="web_qr_login" style="display: block; height: 420px;">
				<div class="web_login" id="web_login">
					<div class="login-box">
						<div class="login_form">
							<form action="" name="registerform" id="reguser_form" class="loginForm" method="post">

								<div class="uinArea" id="uinArea">
									<label class="input-tips" for="username">用户名：</label>
									<div class="inputOuter" id="uArea">
										<input type="text" id="username" name="username" class="inputstyle" onblur="checkusername()" placeholder="username" maxlength="20" datatype="*2-16" nullmsg="用户昵称不能为空" errormsg="昵称至少2个字符,最多16个字符！" />
									</div>
								</div>

								<div class="pwdArea" id="pwdArea">
									<label class="input-tips" for="p">密码：</label>
									<div class="inputOuter" id="pArea">
										<input type="password" id="p" name="userpassword" class="inputstyle" placeholder="password" maxlength="20" datatype="*6-16" nullmsg="密码不能为空" errormsg="密码至少6个字符,最多16个字符！" />
									</div>
								</div>

								<div class="pwdArea" id="pwdArea">
									<label class="input-tips" for="phone">phone：</label>
									<div class="inputOuter" id="pArea">
										<input type="text" id="phone" name="phone" class="inputstyle" onblur="checkuserphone()" placeholder="phonenumber" maxlength="11" datatype="m" nullmsg="手机号不能为空" errormsg="手机格式不正确" />
									</div>
								</div>

								<div class="pwdArea" id="pwdArea">
									<label class="input-tips" for="usercode">验证码：</label>
									<div class="inputOuter" id="pArea">
										<input type="text" id="usercode" name="usercode" class="inputstyle" style="width: 96px;" placeholder="code" maxlength="6" datatype="n6-6" nullmsg="验证码不能为空" errormsg="验证码为6位随机数字" />
										<input type="button" id="getcode" value="获取验证码" class="button_blue" style="float: right; font-size: 14px;" onclick="showtime(10)" />
									</div>
								</div>

								<div class="pwdArea" id="pwdArea">
									<label class="input-tips" for="email">邮箱：</label>
									<div class="inputOuter" id="pArea">
										<input type="text" id="email" name="email" class="inputstyle" onblur="checkuseremail()" placeholder="e-mail" maxlength="20" datatype="e" nullmsg="邮箱不能为空" errormsg="邮箱格式不正确" />
									</div>
								</div>

								<div style="padding-left:65px;margin-top:20px;">
									<input type="button" value="注册" style="width:150px;" class="button_blue" onclick="check1()" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<!--注册-->
			<div class="qlogin" id="qlogin" style="display: none; ">
				<div class="web_login">
					<form name="form2" id="regBus" action="" method="post">
						<ul class="reg_form" id="reg-ul">
							<!--<div id="userCue" class="cue">商家注册请注意格式</div>-->
							<li>
								<label for="business_id" class="input-tips2">工商号：</label>
								<div class="inputOuter2">
									<input type="text" id="business_id" name="business_id" class="inputstyle2" onblur="checkbusiness_id()" placeholder="business_id" maxlength="15" datatype="n15-15" nullmsg="工商号不能为空" errormsg="工商号为15位数字" />
								</div>
							</li>

							<li>
								<label for="business_name" class="input-tips2">企业名：</label>
								<div class="inputOuter2">
									<input type="text" id="business_name" name="business_name" class="inputstyle2" placeholder="business_name" maxlength="16" datatype="*" nullmsg="企业名不能为空" />
								</div>
							</li>

							<li>
								<label for="passwd2" class="input-tips2">密码：</label>
								<div class="inputOuter2">
									<input type="password" id="passwd2" name="business_pwd" class="inputstyle2" placeholder="business_password" maxlength="16" datatype="*6-16" nullmsg="密码不能为空" errormsg="密码至少6个字符,最多16个字符！" />
								</div>
							</li>

							<li>
								<label for="phone1" class="input-tips2">phone：</label>
								<div class="inputOuter2">
									<input type="text" id="phone1" name="business_phone" class="inputstyle2" onblur="checkbusiness_phone()" placeholder="business_phone" maxlength="11" datatype="m" nullmsg="号码不能为空" errormsg="手机号码格式错误" />
								</div>
							</li>

							<li>
								<label for="qq" class="input-tips2">验证码：</label>
								<div class="inputOuter2">
									<input type="text" id="qq" name="business_code" class="inputstyle2" style="width: 100px;" placeholder="code" maxlength="6" datatype="n6-6" nullmsg="验证码不能为空" errormsg="验证码为6位随机数字" />
									<input type="button" id="getcode2" value="获取验证码" class="button_blue" style="float: right; font-size: 14px;" onclick="showtime2(10)" />
								</div>
							</li>

							<li>
								<label for="business_email" class="input-tips2">邮箱：</label>
								<div class="inputOuter2" style="margin-top: 10px;">
									<input type="text" id="business_email" name="business_email" class="inputstyle2" onblur="checkbusiness_email()" placeholder="business_email" maxlength="20" datatype="e" nullmsg="邮箱不能为空" errormsg="邮箱格式错误" />
								</div>
							</li>

							<li>
								<div style="padding-left:85px;margin-top:20px;">
									<input type="submit" value="同意注册" style="width:150px;" class="button_blue" onclick="check2()" />
								</div>
							</li>
							<div class="cl"></div>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		$("#reguser_form,#regBus").Validform({
			tiptype: 4,
		});
	</script>
    
</html>
