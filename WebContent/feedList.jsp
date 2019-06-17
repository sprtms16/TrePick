<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">

		<c:forEach var="feed" items="${feedList}">
			<tr>
				<td>${feed.feed_idx }</td>
				<td>${feed.title}</td>
				<td>${feed.regdate}</td>
				<td>${feed.contents}</td>

			</tr>

			<tr>
				<h3>댓글창</h3>
				<form action="insertActionReply" method="post">
					<input type="hidden" name="feed_idx" value="${feed.feed_idx}" />
					내용 : <br>
					<textarea rows="3" cols="20" name="contents"></textarea>
					<br> <input type="submit" value="댓글등록">
				</form>



				<table border="1">

					<c:forEach var="reply" items="${feed.replys}">
						<tr>
							<td>${reply.contents}</td>

						</tr>
					</c:forEach>

				</table>
				<button onclick="updateForm?feed_idx=${feed.feed_idx }">수정</button>
				<button onclick="deleteAction?feed_idx=${feed.feed_idx}">삭제</button>
			</tr>
		</c:forEach>
	</table>
</body>
</html>