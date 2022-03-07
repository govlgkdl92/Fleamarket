<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-  scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>신고 관리</title>
    
    <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">

    
	<link href="/market/admin/css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="/market/admin/js/complain.js"></script>
</head>
<body>
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="/market/admin/adminIndex">아나바다</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    	<a href="#" style="color:#FFFFFF;">관리자 아이디</a>"&nbsp; &nbsp; "<a href="#" style="color:#FFFFFF;">로그인시간</a>
                </div>
            </form>
            
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">옵션1</a>
                        <a class="dropdown-item" href="#">옵션2</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="login.html">Logout</a>
                    </div>
                </li>
            </ul>
        </nav>
        
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="/market/admin/adminIndex">HOME</a>
                            
                            <div class="sb-sidenav-menu-heading">Interface</div>
	                           <ul>
		                            <a class="nav-link" href="/market/admin/memberList">전체 회원 관리</a>
		                            <a class="nav-link" href="/market/admin/withdrawList">탈퇴 사유 분석</a>
		                            <a class="nav-link" href="/market/admin/storeList">전체 상점 관리</a>
		                            <a class="nav-link" href="/market/admin/productList">전체 상품 관리</a>
		                            <a class="nav-link" href="/market/admin/complainList">신고 내역 관리</a>
		                            <a class="nav-link" href="/market/admin/memberQna">1:1 문의 관리</a>
	                    		</ul>                            
	                    		
	                    	<div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                       	 관리자 아이디
                    </div>
                </nav>
            </div>
            
            
<%-- ======================================================= --%>
<%-- ======================================================= --%>
<div id="layoutSidenav_content">
   <main>
       <div class="container-fluid">
           <h3 class="mt-4">신고 내역 관리</h3>
           <hr>                  		
<!-- <div class="container-fluid"> -->
  <div class="row">
    <div class="col-xl-7">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid">
	  
	    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
	    <strong>출력 게시글 수</strong>&emsp;
		  <input type="hidden" id="viewNumHidden" name="viewNumHidden" value="20">
		  
			<select class="form-select form-select-sm" id="selectPrint" aria-label=".form-select-sm example" >
			  <option value="20" selected>20개</option>
			  <option value="50">50개</option>
			  <option value="100">100개</option>
			</select>
			
		  &emsp;&emsp;&emsp;
		  
	      <form class="d-flex" id="memberSearchForm">
	      	<input type="hidden" id="searchPg" name="searchPg" value="1">
	      	<select class="form-select form-select-sm" id="searchType" aria-label=".form-select-sm example">
			  <option selected>선택</option>
			  <option value="mem_id">신고당한 회원</option>
			  <option value="reporter_id">신고자</option>
			</select>&nbsp; &nbsp;
	        <input class="form-control me-2" type="search" name="keyword" id="keyword" placeholder="Search" aria-label="Search">&nbsp;&nbsp;
	        <button class="btn btn-outline-success" type="button" id="memberSearchBtn">Search</button>
	      </form>  
	      
	    </div>
	  </div>
	</nav>
	
<div class="table-responsive-xxl">
	<table id="compTable" class="table table-bordered table-striped table table-sm">
        <thead class="table-dark">
            <tr>
                <th style="text-align:center;">번호</th><!-- complain_seq -->
                <th style="text-align:center;"><!-- category -->
                	<input type="hidden" id="viewNumHidden" name="viewNumHidden" value="20">
					<select class="form-select form-select-sm" id="selectPrint" aria-label=".form-select-sm example" >
						<option selected>구분</option>
						<option value="product_seq">상점 신고</option>
						<option value="product_seq">상품 신고</option>
						<option value="review_seq">후기 신고</option>
						<option value="board_seq">게시글 신고</option>
						<option value="comment_seq">댓글 신고</option>
						<option value="talk_seq">번개톡 신고</option>
					</select>
			</th>
				<th style="text-align:center;">항목 번호</th><!-- eachPart_seq -->
				<th style="text-align:center;">내용</th><!-- complain_content -->
                <th style="text-align:center;">신고당한 사람</th><!-- mem_id -->
                <th style="text-align:center;">신고자</th><!--reporter_id -->
                <th style="text-align:center;">신고 날짜</th><!-- complain_logtime -->
                <th style="text-align:center;">처리</th><!-- complain_status -->
            </tr>
        </thead>
        <tbody id="complainTbody">
        	<tr>
        	
        	</tr>
        </tbody>
	   	<tfoot class="table-secondary">
            <tr>
              	<th style="text-align:center;">번호</th>
                <th style="text-align:center;">구분</th>
                <th style="text-align:center;">항목 번호</th><!-- eachPart_seq -->
				<th style="text-align:center;">내용</th><!-- complain_content -->
                <th style="text-align:center;">신고당한 사람</th><!-- mem_id -->
                <th style="text-align:center;">신고자</th><!--reporter_id -->
                <th style="text-align:center;">신고 날짜</th><!-- complain_logtime -->
                <th style="text-align:center;">처리</th><!-- complain_status -->
            </tr>
        </tfoot>
	</table>
</div>

<!-- 페이징 -->
<input type="hidden" id="pg" name="pg" value="${pg }">
<input type="hidden" id="viewNum" name="viewNum" value="${viewNum }">
<!-- 페이징 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<div id="boardPagingDiv" class="paging" align="center"></div>
		</ul>
	</nav>
</div><!-- 좌측 끝 -->
<!-- ========================================= -->
<div class="col-xl-5"><!-- 우측 -->
<div class="card mb-4">
  <h5 class="card-header">신고 내용 확인</h5>
	 <div class="card-body">
       	<table class="table table-bordered border-primary table-sm">
		  <tbody>
		    <tr>
		      <th style="text-align:center;" width="20%">작성자 ID</th><th width="30%"><span class="col" id="reported_id"></span></th> 
		      <th style="text-align:center;" width="20%">작성일</th><th width="30%"><span class="col" id="reported_logtime"></span></th>
		    </tr>
		    <tr>
		      <th style="text-align:center;" id="mother" width="20%"></th><th width="30%"><span class="col" id="mother_seq"></span></th> 
		      <th style="text-align:center;" id="daughter" width="20%"></th><th width="30%"><span class="col" id="daughter_seq"></span></th>
		    </tr>
		    <tr>
		      <th style="text-align:center;">내용</th><th colspan="3"><span id="reported_content"></span></th>
		    </tr>
		   <tr>
		   </tr>
		  </tbody>
		</table>
		<input type="hidden" id="thisIs">
		<button type="button" class="btn btn-secondary btn-sm" id="goComplainPage">페이지로 이동</button>
		<button type="button" class="btn btn-secondary btn-sm" id="blindComplainBtn">신고글 블라인드 처리</button>
		<button type="button" class="btn btn-secondary btn-sm" id="stopMemberBtn">회원 영구 정지</button>

		   
	 </div>    
</div>
  </div>
</div><!-- 우측 끝 -->
</div><!-- end.row-->
</div>
</div>               
</div>
</main>
            
<%-- ======================================================= --%>
<%-- ======================================================= --%>
               
               
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2020</div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div><!--layoutSidenav_content  -->
</div>

</body>
