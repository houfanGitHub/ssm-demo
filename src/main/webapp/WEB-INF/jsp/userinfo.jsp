<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		margin:0 auto;
		width:1000px;
		height:300px;
		background:#000;
	}
	td,th{
		background:#FFF;
	}
</style>
</head>
<body>
	<h2>Show User</h2>
	<hr>
	<table border="0" cellspacing="1">
		<tr>
<!-- 			<th>uid</th> -->
			<th>name</th>
			<th>username</th>
<!-- 			<th>password</th> -->
			<th>gender</th>
			<th>age</th>
			<th>createDate</th>
			<th>lastLoginDate</th>
			<th>locked</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${userList }" var="user">
		<tr>
<%-- 			<td>${user.uid}</td> --%>
			<td>${user.name}</td>
			<td><a href="javascript:void(0);" onclick="updateUser('${user.uid}');">${user.username}</a></td>
<%-- 			<td>${user.password}</td> --%>
			<td>${user.gender}</td>
			<td>${user.age}</td>
			<td><fmt:formatDate value="${user.createdate}" pattern="yyyy-MM-dd" /></td>
			<td><fmt:formatDate value="${user.lastlogindate}" pattern="yyyy-MM-dd" /></td>
			<td>${user.locked}</td>
			<td><a href="javascript:void(0);" onclick="deleteUser('${user.uid}','${user.username}');">删除</a></td>
		</tr>
		</c:forEach>
	</table>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript">
		function updateUser(uid){
			window.location.href="${pageContext.request.contextPath}/users/toUpdateUser/"+uid;
		}
		function deleteUser(uid,username){
			if(confirm("确定要删除 "+username+" ?")){
				$.post("${pageContext.request.contextPath}/users/deleteUser/"+uid,function(data){
					if(data = 'success'){
						window.location.href="${pageContext.request.contextPath}/users/userinfo";
					}else{
						alert(data);
					}
				});
			}
		}
	</script>
</body>
</html>