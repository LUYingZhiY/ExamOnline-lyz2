<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://static.runoob.com/assets/jquery-validation-1.14.0/demo/milk/milk.css">
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.mockjax.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

	<script>
	$(document).ready(function() {
		$.mockjax({
			url: "emails.action",
			response: function(settings) {
				var email = settings.data.email,
					emails = ["glen@marketo.com", "george@bush.gov", "me@god.com", "aboutface@cooper.com", "steam@valve.com", "bill@gates.com"];
				this.responseText = "true";
				if ($.inArray(email, emails) !== -1) {
					this.responseText = "false";
				}
			},
			responseTime: 500
		});

		$.mockjax({
			url: "users.action",
			response: function(settings) {
				var user = settings.data.username,
					users = ["asdf", "Peter", "Peter2", "George"];
				this.responseText = "true";
				if ($.inArray(user, users) !== -1) {
					this.responseText = "false";
				}
			},
			responseTime: 500
		});

		// 在关键字上验证注册表单并提交。
		var validator = $("#signupform").validate({
			rules: {
				firstname: "required",
				lastname: "required",
				username: {
					required: true,
					minlength: 2,
					remote: "users.action"
				},
				password: {
					required: true,
					minlength: 5
				},
				password_confirm: {
					required: true,
					minlength: 5,
					equalTo: "#password"
				},
				email: {
					required: true,
					email: true,
					remote: "emails.action"
				},
				dateformat: "required",
				terms: "required"
			},
			messages: {
				firstname: "Enter your firstname",
				lastname: "Enter your lastname",
				username: {
					required: "Enter a username",
					minlength: jQuery.validator.format("Enter at least {0} characters"),
					remote: jQuery.validator.format("{0} is already in use")
				},
				password: {
					required: "Provide a password",
					minlength: jQuery.validator.format("Enter at least {0} characters")
				},
				password_confirm: {
					required: "Repeat your password",
					minlength: jQuery.validator.format("Enter at least {0} characters"),
					equalTo: "Enter the same password as above"
				},
				email: {
					required: "Please enter a valid email address",
					minlength: "Please enter a valid email address",
					remote: jQuery.validator.format("{0} is already in use")
				},
				dateformat: "Choose your preferred dateformat",
				terms: " "
			},
			//错误放置必须考虑表布局。
			errorPlacement: function(error, element) {
				if (element.is(":radio"))
					error.appendTo(element.parent().next().next());
				else if (element.is(":checkbox"))
					error.appendTo(element.next());
				else
					error.appendTo(element.parent().next());
			},
			// 指定一个submitHandler可以防止默认提交，这对演示很好。
			submitHandler: function(){
				alert("submitted!");
			},
			//将该类设置为错误标签，以指示有效字段。
			success: function(label) {
				// set &nbsp; as text for IE
				label.html("&nbsp;").addClass("checked");
			},
			highlight: function(element, errorClass) {
				$(element).parent().next().find("." + errorClass).removeClass("checked");
			}
		});

		// 建议用户名，通过合并第一个和最后一个名字。
		$("#username").focus(function() {
			var firstname = $("#firstname").val();
			var lastname = $("#lastname").val();
			if (firstname && lastname && !this.value) {
				this.value = (firstname + "." + lastname).toLowerCase();
			}
		});
	});
	</script>
</head>
<body>
<h1 id="banner">参考<a href="http://jqueryvalidation.org/">jQuery Validation Plugin</a></h1>
<div id="main">
	<div id="content">
		<div id="header">
	
		</div>
		<div style="clear: both;">
			<div></div>
		</div>
		<div class="content">
			<div id="signupbox">
				<div id="signuptab">
					<ul>
						<li id="signupcurrent"><a href=" ">注册</a>
						</li>
					</ul>
				</div>
				<div id="signupwrap">
					<form id="signupform" autocomplete="off" method="get" action="">
						<table>
							<tr>
								<td class="label">
									<label id="lfirstname" for="firstname">姓氏</label>
								</td>
								<td class="field">
									<input id="firstname" name="firstname" type="text" value="" maxlength="100">
								</td>
								<td class="status"></td>
							</tr>
							<tr>
								<td class="label">
									<label id="llastname" for="lastname">名</label>
								</td>
								<td class="field">
									<input id="lastname" name="lastname" type="text" value="" maxlength="100">
								</td>
								<td class="status"></td>
							</tr>
							<tr>
								<td class="label">
									<label id="lusername" for="username">用户名</label>
								</td>
								<td class="field">
									<input id="username" name="username" type="text" value="" maxlength="50">
								</td>
								<td class="status"></td>
							</tr>
							<tr>
								<td class="label">
									<label id="lpassword" for="password">密码</label>
								</td>
								<td class="field">
									<input id="password" name="password" type="password" maxlength="50" value="">
								</td>
								<td class="status"></td>
							</tr>
							<tr>
								<td class="label">
									<label id="lpassword_confirm" for="password_confirm">确认密码</label>
								</td>
								<td class="field">
									<input id="password_confirm" name="password_confirm" type="password" maxlength="50" value="">
								</td>
								<td class="status"></td>
							</tr>
							<tr>
								<td class="label">
									<label id="lemail" for="email">电子邮件</label>
								</td>
								<td class="field">
									<input id="email" name="email" type="text" value="" maxlength="150">
								</td>
								<td class="status"></td>
							</tr>
							<tr>
								<td class="label">
									<label>看起来正确的</label>
								</td>
								<td class="field" colspan="2" style="vertical-align: top; padding-top: 2px;">
									<table>
										<tbody>
											<tr>
												<td style="padding-right: 5px;">
													<input id="dateformat_eu" name="dateformat" type="radio" value="0">
													<label id="ldateformat_eu" for="dateformat_eu">14/02/07</label>
												</td>
												<td style="padding-left: 5px;">
													<input id="dateformat_am" name="dateformat" type="radio" value="1">
													<label id="ldateformat_am" for="dateformat_am">02/14/07</label>
												</td>
												<td>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="label">&nbsp;</td>
								<td class="field" colspan="2">
									<div id="termswrap">
										<input id="terms" type="checkbox" name="terms">
										<label id="lterms" for="terms">我已阅读并接受使用条款。</label>
									</div>
									<!-- /termswrap -->
								</td>
							</tr>
							<tr>
								<td class="label">
									<label id="lsignupsubmit" for="signupsubmit">注册</label>
								</td>
								<td class="field" colspan="2">
									<input id="signupsubmit" name="signup" type="submit" value="提交">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>