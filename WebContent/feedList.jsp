<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../style/css/feedList.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.10/css/all.css">
<script type="text/javascript">
	$(function() {
		$('.fa-heart').click(function() {
			$(this).toggleClass("far");
			$(this).toggleClass("fas");
			return false;
		});
		$('.fa-thumbs-up').click(function() {
			$(this).toggleClass("far");
			$(this).toggleClass("fas");
			return false;
		});
		$('.fa-thumbs-down').click(function() {
			$(this).toggleClass("far");
			$(this).toggleClass("fas");
			return false;
		});
	})
</script>
</head>
<body>
	<div class="container-fluid"
		style="display: inline-block; text-align: center;">
		<c:forEach var="feed" items="${feedList}">
			<div class="col-md-6 mt-5 ">
				<div class="card text-center">
					<img class="card-img-top"
						src="https://picsum.photos/1900/1080?image=235"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">${feed.title }</h5>
						<hr>
						<p>${feed.contents }</p>
						<div class="container" role="main">
							<form action="insertActionReply" method="post">
								<div class="mb-3">
									<input type="hidden" name="feed_idx" value="${feed.feed_idx}" />
									<textarea class="form-control" rows="1" name="contents"
										id="contents" placeholder="내용을 입력해 주세요"></textarea>
								</div>
								<div>
									<button type="submit" class="btn btn-sm btn-primary"
										id="btnSave">작성</button>
									<a class="btn btn-sm btn-primary" data-toggle="collapse"
										href="#collapseExample" role="button" aria-expanded="false"
										aria-controls="collapseExample"> <i class="fas fa-map"></i>
										모두보기
									</a>
								</div>
							</form>
						</div>
						<p></p>
						<div class="collapse" id="collapseExample">
							<div class="card card-body">
								<c:forEach var="reply" items="${feed.replys}">

									<div>${reply.contents}
										<i class="fas fa-thumbs-up"></i>
										<button
											onclick="location.href = 'replyLikeAction?feed_idx=${reply.feed_idx}&reply_idx=${reply.reply_idx}'">좋아요</button>
										<i class="fas fa-thumbs-down"></i>
										<button
											onclick="location.href = 'replyDislikeAction?feed_idx=${reply.feed_idx}&reply_idx=${reply.reply_idx}'">싫어요</button>
									</div>



								</c:forEach>
								<!-- 	<iframe
									src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d11880.492291371422!2d12.4922309!3d41.8902102!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x28f1c82e908503c4!2sColosseo!5e0!3m2!1sit!2sit!4v1524815927977"
									width="100%" height="200" frameborder="0" style="border: 0"
									allowfullscreen></iframe> -->
							</div>
						</div>
					</div>
					<div class="card-footer text-muted">
						<div class="row">
							<div class="col">
								<a href=""><i class="fas fa-edit"></i></a>
							</div>
							<div class="col">
								<a href=""><i class="fas fa-trash-alt"></i></a>
							</div>
							<div class="col">
								<a href="#"><i class="fas fa-heart"> </i> <!-- hearAction?feed_idx=${feed.feed_idx} -->
									<!-- <i class="far fa-heart"></i> --></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>