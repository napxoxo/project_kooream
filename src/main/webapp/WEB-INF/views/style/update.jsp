<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style/update.css'/>">
	<div id="title">
		<h1>STYLE 수정</h1>
	</div>
	<div class="form-wrapper">
		<form action="/style/update" method="post">
		<sec:authentication property="principal.member" var="pri"/>
			<input type="hidden" name="m_no" value="${pri.m_no }">
			<ul id="register-list" class="first">
				<li id="selectProduct">
					<div class="btn-container">
						<a href="#" class="next-btn">다음</a>
					</div>
					<div class="clearfix"></div>
					<div class="product-tag-selector-container"></div>
				</li>
				<li id="inputContent">
					<div class="btn-container">
						<a href="#" class="prev-btn">뒤로</a>
						<a href="#" id="submit" class="next-btn not-yet">완료</a>
					</div>
					<textarea name="style_content" placeholder="#아이템과 #스타일을 자랑해보세요..."></textarea>
					<span contenteditable="true"></span>
					<div class="recommend-tags"></div>
				</li>
			</ul>
			<div class="clearfix"></div>
		</form>
	</div>
	<script type="module" src="<c:url value='/resources/js/style/update.js'/>"></script>
<jsp:include page="../include/footer.jsp"/>