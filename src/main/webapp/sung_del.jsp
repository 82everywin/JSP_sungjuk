<%@ page import="vo.sungVO" %>
<%@ page import="dao.sungDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");

	int no = Integer.parseInt(request.getParameter("no"));
	
	int res = sungDAO.getInstance().delete(no);
	
	if(res >= 1){
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