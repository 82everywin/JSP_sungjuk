<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send(f){
		var name= f.name.value.trim();	
		var kor= f.kor.value.trim();	
		var eng= f.eng.value.trim();	
		var math= f.math.value.trim();	

		var num = /^[0-9]{1,3}$/;
		if(!num.test(kor) || kor < 0 || kor >100) {
			alert("3자리 이하의 정수만 입력하세요");
			return;
		}
		var num = /^[0-9]{1,3}$/;
		if(!num.test(eng) || eng < 0 || eng >100) {
			alert("3자리 이하의 정수만 입력하세요");
			return;
		}
		var num = /^[0-9]{1,3}$/;
		if(!num.test(math) || math < 0 || math >100) {
			alert("3자리 이하의 정수만 입력하세요");
			return;
		}
		
		f.action="register.jsp";
		f.submit();
	
	}
</script>
</head>
<body>
	<form>
		<table border="1">
			<caption > 학생정보를 입력하세요</caption>
			<tr>
				<th>이름</th>
				<td> <input name="name"></td>
			</tr>
			<tr>
				<th>국어</th>
				<td><input name="kor"></td>
			</tr>
			<tr>
				<th> 영어</th>
				<td><input name="eng"></td>
			</tr>
			<tr>
				<th> 수학</th>
				<td><input name="math"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="등록" onclick="send(this.form)">
					<input type="button" value="취소" onclick="location.href='sungjuk.jsp'">
				</td>					
			</tr>
		</table>
	</form>
</body>
</html>