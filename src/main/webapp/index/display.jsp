<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 광고 -->
<div class="adPlace">
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<ol class="carousel-indicators">
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
				class="active"></li>
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/market/image/index/ad.jpg" id="ad1" class="d-block w-100"
					alt="ad1" style="cursor: pointer;">
			</div>
			<div class="carousel-item">
				<img src="/market/image/index/ad2.jpg" id="ad2"
					class="d-block w-100" alt="ad2" style="cursor: pointer;">
			</div>
			<div class="carousel-item">
				<img src="/market/image/index/ad3.jpg" id="ad3"
					class="d-block w-100" alt="ad3" style="cursor: pointer;">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-bs-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-bs-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
		</a>
	</div>
</div>

<div id="displayHeader">
	<p class="displayName">전체 상품 목록</p>
</div>

<div id="display-list" class="row">
	<c:forEach items="${list}" var="list">
		<div class="item col-3"
			onclick="location.href='/market/product/productDetail"
			style="cursor: pointer;">
			<div class="item">
				<div id="itemSolid">
					<img src="${list.img1}" class="rounded float-start" alt="갤럭시 S21"
						style="margin-bottom: 30px;">
					<h5>${list.subject}</h5>
					<div class="price-time">
						<p class="displayPrice">${list.price}</p>
						<h5 class="displayTime">${list.logtime}</h5>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<!-- for문 부분 -->


<div id="moreShow">
	<a id="pe-auto" class="pe-auto" onclick="addPage()" style="height: 100%; cursor: pointer;">더 보기<br>▼
	</a>
</div>


<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/market/js/index/display.js"></script>

