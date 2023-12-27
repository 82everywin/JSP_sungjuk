<%@ page import="vo.sungVO" %>
<%@ page import="dao.sungDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String name = request.getParameter("name");
	int kor= Integer.parseInt(request.getParameter("kor"));
	int eng= Integer.parseInt(request.getParameter("eng"));
	int math= Integer.parseInt(request.getParameter("math"));
	
	sungVO vo = new sungVO();
	vo.setName(name);
	vo.setKor(kor);
	vo.setEng(eng);
	vo.setMath(math);
	
	int res = sungDAO.getInstance().insert(vo);
	
	if(res == 1){
		//location.href=’student.jsp’; -> 자바스크립트코드이기 때문에 사용하지 못한다.
		response.sendRedirect("sungjuk.jsp");
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>