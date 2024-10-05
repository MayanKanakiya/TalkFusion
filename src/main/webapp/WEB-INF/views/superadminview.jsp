<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SuperAdmin View User Information</title>
</head>
<body>
<%
    // Check if superadmin is logged in
    String superadmin = (String) session.getAttribute("superadmin");
    if (superadmin == null) {
        // Redirect to login or home page if not logged in
        response.sendRedirect(request.getContextPath() + "/");
        return; // Stop further processing
    }
%>
<h1>SuperAdmin View User Information</h1>
</body>
</html>