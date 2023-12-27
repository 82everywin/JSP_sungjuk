<%@ page import ="vo.sungVO" %>
<%@ page import = "dao.sungDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	
	sungDAO dao = new sungDAO();
	List<sungVO> list = dao.selectList();
	
	int total; 
	float avg;
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{border:1px solid black;
		      border-collapse:collapse; 
		      text-align: center;}
		      
	td { width : 100px;}
	
</style>
<script type="text/javascript">
	function del(no){
		if(confirm("정말 삭제하시겠습니까?") == false){
			return;
		}
		
		location.href='sung_del.jsp?no=' +no;
	}

</script>
</head>
<body>
	<table border = "1">
		<caption> 			학생성적				</caption>
		<tr>
			<th>이름</th>
			<th>국어</th>
			<th>수학</th>
			<th>영어</th>
			<th>총점</th>
			<th>평균</th>
			<th>순위</th>
			<th>비고</th>
		</tr>
		<% 
			for(int i =0; i<list.size();i++){ 
				sungVO vo = list.get(i); %>
				
		<tr>
			<td> <%= vo.getName() %></td>
			<td> <%= vo.getKor() %></td>
			<td> <%= vo.getEng() %></td>
			<td> <%= vo.getMath() %></td>
			<td> <%= vo.getTotal() %></td>
			<td> <%= vo.getAvg() %></td>
			<td> <%= vo.getRank()%></td>
			<td ><input type="button" value = "삭제" onclick="del('<%= vo.getNo()%>')"></td>
		</tr>
			<%} %>
						
		<tr>
			<td colspan ="9" align ="center">	
				<input type="button" value="학생 정보 추가하기" onclick="location.href= 'sung_register.jsp' ">
			</td>
	</table>
</body>
</html>