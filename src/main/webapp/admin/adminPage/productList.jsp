<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>상품관리</title>
        <link href="/market/admin/css/productList.css" rel="stylesheet" />
        <link rel="icon" href="data:;base64,=">
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
	<h3 class="mt-4">전체 상품목록</h3>
	<hr>                  		

<div class="row">
    <div class="col-xl-5">
      
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				  <div class="container-fluid">
				  
				    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				      
					  &nbsp;&nbsp;
					  <input type="hidden" id="viewNumHidden" name="viewNumHidden" value="20">
						<select class="form-select form-select-sm" id="selectPrint" aria-label=".form-select-sm example" >
						  <option value="20" selected>20개</option>
						  <option value="50">50개</option>
						  <option value="100">100개</option>
						</select>
						
					  &nbsp;&nbsp;
					  
				      <form class="d-flex" id="productSearchForm">
				      	<input type="hidden" id="searchPg" name="searchPg" value="1">
				      	<select class="form-select form-select-sm" id="searchType" aria-label=".form-select-sm example">
						  <option selected>선택</option>
						  <option value="product_seq">상품번호</option>
						  <option value="product_subject">상품명</option>
						  <option value="mem_id">판매자ID</option>
						</select>
				        <input class="form-control input-sm" type="search" name="productKeyword" id="productKeyword" placeholder="Search" aria-label="Search">
				        <button class="btn btn-outline-success" type="button" id="productSearchBtn">Search</button>
				      </form>  
				      
				    </div>
				  </div>
			</nav>
			
			<div class="table-responsive-xxl">
				<table id="productTable" class="table table-bordered table-striped table table-sm">
			        <thead class="table-dark">
			            <tr>
			                <th width="20%">상품번호</th>
			                <th width="60%">상품명</th>
			                <th width="20%">판매자id</th>
			            </tr>
			        </thead>
			        <tbody id="tbody">
			        	<tr></tr>
			        	
			        </tbody>
				   	<tfoot class="table-secondary">
			            <tr>
			              	<th>상품번호</th>
			                <th>상품명</th>
			                <th>판매자id</th>
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
	</div> <%--col-xl-5 --%>
    
    <div class="col-xl-7">
		    <div class="card mb-4">
		        <div class="card-header">
		            <i class="fas fa-chart-area mr-1"></i>
		            	상품 상세정보
		           &nbsp;&nbsp;
			        <button type="button" class="btn btn-danger btn-sm">삭제</button>
			        <button type="button" class="btn btn-secondary btn-sm" id="moveProductPageBtn">페이지로 이동</button>
		        </div>
		        <div class="card-body">
		        	<table class="table table-bordered border-primary table-sm">
					  <tbody>
					    <tr>
					      <th width="20%">판매자ID</th><th width="30%"><span id="mem_idSpan"></span></th> 
					      <th width="20%">상점이름</th><th width="30%"><span id="storeNameSpan"></span></th>
					    </tr>
					    <tr>
					      <th>카테고리1</th><th><span id="category1Span"></span></th> 
					      <th>카테고리2</th><th><span id="category2Span"></span></th>
					    </tr>
					    <tr>
					      <th>가격</th><th><span id="priceSpan"></span>원</th> 
					      <th>수량</th><th><span id="amountSpan"></span></th>
					    </tr>
					    <tr>
					    	<th>내용</th><th colspan="3"><span id="product_contentSpan"></span></th>
					    </tr>
					    <tr>
					    	<th>사진</th><th colspan="3"><img id="product_imgSpan" src="" width="300px" height="300px" alt="상품사진"></th>
					    </tr>
					    
					  </tbody>
					</table>
		        </div>
		    </div>
		    
		    <div class="card mb-4">
		        
		        
		    </div>	<%-- card mb-4 --%>	
	</div>  <%-- col-xl-7 --%>     
</div> <%--row --%> 
		</div> <%--container-fluid --%>
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
    </div>
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    <script src="/market/admin/js/productList.js"></script>
    <script type="text/javascript">
		function boardPaging(pg){
			var productKeyword = document.getElementById("productKeyword").value;
			$('#pg').val(pg);
		
			 if(productKeyword ==''){
				location.href='/market/admin/productList?pg='+pg+'&viewNum='+$('#viewNum').val();
			 }else{
				$('#productSearchBtn').trigger('click','research');
			 }
		}
	</script>
</body>
