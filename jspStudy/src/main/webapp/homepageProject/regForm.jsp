<%@page contentType="text/html; charset=UTF-8"%>
<!-- <html>
<head>
<title>Register Form</title>
<link href="css/regform.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/regform.js"></script>
</head>
<body > -->
	<main>
		<form method="post" action="regProc.jsp" name="regForm">
			<table border="1">
				<tr>
					<td  class="login_table" colspan="2" align="center">회원 가입 정보 입력</td>
				</tr>
				<tr>
					<td align="right">아이디 :</td>
					<td>
						<input id="input-id" type="text" name="id" required /><span></span>&nbsp; 
						<input type="button" value="중복확인" onClick="idCheck(this.form.id.value)" />
					</td>
				</tr>
				<tr>
					<td align="right">패스워드 :</td>
					<td><input id="input-pw1" type="password" name="pass" required /><span></span></td>
				</tr>
				<tr>
					<td align="right">패스워드 확인:</td>
					<td><input id="input-pw2" type="password" name="repass" required /><span></span></td>
				</tr>
				<tr>
					<td align="right">이름 :</td>
					<td><input id="input-name" type="text" name="name" required /><span></span></td>
				</tr>
				<tr>
					<td align="right">전화번호 :</td>
					<td><input id="input-tel"  type="tel" name="tel" required /><span></span></td>
				</tr>
				<tr>
					<td align="right">이메일 :</td>
					<td><input  id="input-email"  type="text" name="email" required /><span></span></td>
				</tr>
				<tr>
					<td align="right">우편번호 :</td>
					<td>
						<input  id="zipcode"  type="text" name="zipcode" required /> 
						<input type="button" value="찾기" onClick="zipCheck()" />
					</td>
				</tr>
				<tr>
					<td align="right">주소1 :</td>
					<td><input  id="addr1" type="text" name="address1" size="50" required /></td>
				</tr>
				<tr>
					<td align="right">주소2 :</td>
					<td><input id="addr2" type="text" name="address2" size="30" required /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="회원가입"/>&nbsp;&nbsp; 
						<input type="reset" value="다시입력" />
						<input type="button" onclick="location.href = 'isRegformFalse.jsp'" value="뒤로가기"> 
					</td>
				</tr>
			</table>
		</form>
	</main>
<!-- </body>
</html> -->