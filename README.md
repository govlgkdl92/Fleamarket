
<main role="main" class="probootstrap-main js-probootstrap-main">

  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-xl-11 col-lg-12">
        <h1>아나바다 마켓</h1>
        <hr>
        <p>
        <img src="https://user-images.githubusercontent.com/73110638/108618038-23b8e600-745e-11eb-9957-a14652bb7749.png"
          width="800" height="auto">

 <br/>
        <div>중고 거래 웹 사이트 <h4>아나바다 마켓</h4></div>
 <br/>
 '아나바다'는 아껴 쓰고, 나눠 쓰고, 바꿔 쓰고, 다시 쓴다 의미에서 착안하여 사용자들이 간편하게 서로 중고거래를 할 수 있습니다.
회원인 사용자라면 누구나 채팅을 통해 판매와 구매를 할 수 있습니다.
또한 사용자들끼리 커뮤니티 게시판을 통한 자유로운 소통을 가능하도록 하였으며, 고객센터에서 일대일 문의를 가능하도록 하였습니다.
관리자는 보안이 설정된 다른 창에서 회원 및 게시글을 관리할 수 있습니다.
사이트 <a href="https://m.bunjang.co.kr/">번개장터</a>에서 UI와 전반적인 기능을, <a href="https://www.daangn.com/">당근마켓</a>에서 에코지수(당근마켓의 매너온도)와 거래 성사 과정(채팅)을 벤치마킹하였습니다.
        <br/>
 <br/>
        <p>[개발 환경]</p>
        <p>* O/S - Windows 10 64bit</p>
        <p>* WAS - Apache Tomcat/9.0</p>
        <p>* DBMS - Oracle</p>
        <p>* Pattern - Eclipse / SQL Developer</p>
        <p>* Maven, Github, Lombok, log4j</p>
<br/>
        <p>[사용 기술]</p>
        <p>* JAVA, Spring Security, Websockets</p>
        <p>* Java Script, HTML, CSS, JSP, jQuery, AJAX, JSON, XML</p>
        <p>* Spring Framework, MyBatis, Bootstrap</p>
        <p>* 카카오 로그인 API, 카카오 우편번호 API</p>
<br/>
        <p>[기간] - 2021년 1월 18일 ~ 2월 14일 (총 27일)</p>
        <p>[인원] - 5명</p>
        

<br/>
<p>기능</p>

<br/>
<p>[나의 주요 담당 기술] </p>
<p>> 메인화면 기술 및 UI : 전체 상품 목록 / 상품 목록 더보기 / 목록 정렬   </p>
<p>> Nav bar : 찜한 상품 / 상품 찜하기 / 최근본 상품 / </p>
<p>> Tool bar: 상품 검색 / 최근 검색어 / 상품 카테고리 / 광고 슬라이드 </p>
<p>> 검색 : @상점 검색 / 상품명 검색 / 카테고리 별 검색 / 태그 검색 </p>
<p>> 최근 검색어 : 최근 검색어 10개 저장 / 쿠키 구현</p>
<p>> 커뮤니티 : 게시판 목록 / 페이징 처리</p>

<br><br>
<p>* 일반 회원</p>

<p>|   기능   | 세부 기능 |</p>
<p>| 메인 | 전체 상품 목록 / 상품 리스트 더보기 / 찜한 상품 / 최근본 상품 / 상품 검색/ 최근 검색어 /  상품 카테고리 / 광고 슬라이드 |</p>
<p>| 회원 | 회원가입 / 로그인 / SNS 로그인 / 관리자 & 유저 권한 설정 / 회원 정보 수정 / 회원 탈퇴 / 아이디&비번 찾기 / 이메일 인증 |</p>
<p>| 상점 | 상점 정보 설정 / 에코지수, 상점평점 확인 / 상품 후기 / 찜 / 구매내역 / 내 상품 관리(상품 검색, 삭제, 상태변경) / 상점 신고 / 후기 신고 |</p>
<p>| 상품 | 상품 등록(이미지 미리보기, 대표이미지 설정, 카테고리화, 연관태그 그래픽화) / 상품 상세페이지(정보 확인, 찜 등록 및 해제, 연관 상품, 상품 신고) |</p>
<p>| 채팅 | 1:1 채팅(상대방과 자신 구분) / 채팅 내용 저장 및 불러오기 / 실시간 알림(음소거 가능) / 실시간 온라인 여부 / 이미지 첨부 / 이모티콘 첨부 / 주소 보내기 / 금지 태그, 금지 단어 설정 |</p>
<p>| 커뮤니티 | 게시글 / 댓글 / 답글 / 글 수정 / 글 삭제 / 검색 / 페이징 |</p>
<p>| 1:1문의 | 1:1 문의글 등록 / 문의글 및 답글 출력 |</p>
<br/>

<p>* 관리자</p>

<p>| 기능 | 세부 기능 |</p>
<p>| 전체 회원 관리 | 회원 목록 출력 / 회원 상세 정보 확인 /  회원 계정 영구 정지 |</p>
<p>| 탈퇴 사유 분석 | 탈퇴 사유 분석 |</p>
<p>| 전체 상점 관리 | 상점 목록 출력 / 상점 상세 정보 확인 |</p>
<p>| 전체 상품 관리 | 상품 목록 출력 / 상품 상세 정보 확인 |</p>
<p>| 신고 내역 관리 | 상점, 상품, 리뷰, 게시글, 댓글 신고 내역 출력 / 신고 상세 내용 확인 / 신고 내용 블라인드 처리 & 계정 영구정지 / 신고 내역 처리 여부 체크 |</p>
<p>| 1:1 문의 관리 | 1:1 문의 내역 출력 / 문의 상세 내용 확인 / 문의글 답변 달기 |</p>
<p/>
<br/><br/><br/>

<p>## 사용 화면</p>
<p>> 전체 화면</p>
<p><img src="https://user-images.githubusercontent.com/74230238/165286141-04e40f9c-0ae5-4c8b-94f5-aa40d360c545.png" width="300" height="200">
</p>
<p>> 회원 가입 / 로그인</p>

<p><img src="https://user-images.githubusercontent.com/74230238/165283618-4796dc85-aee8-4767-9f35-8680856b4cea.png" width="200" height="250"> <img src="https://user-images.githubusercontent.com/74230238/165285851-19172adb-03e4-4eee-bc6c-924f6a4ee612.png" width="200" height="250"> <img src="https://user-images.githubusercontent.com/74230238/165286031-f5f7fd15-9658-4423-ad39-f266f7e729c7.png" width="300" height="200">
</p>

<p>> 상품 등록하기  /  상품 상세페이지  /  신고하기</p>

<p><img src="https://user-images.githubusercontent.com/74230238/165286497-b9801ee4-652b-40d7-a76e-92f3e04ed30f.png" width="300" height="200"> <img src="https://user-images.githubusercontent.com/73110638/108618990-8661b000-7465-11eb-9006-cd311f7d1940.png" width="200" height="250"></p>
<br/>

<p>> 검색
<p><img src="https://user-images.githubusercontent.com/74230238/165286784-b7bd05e3-d4ee-4bad-af71-6898ed4f3c83.png" width="300" height="200">
</p>

<p>> 내 상점(후기, 찜, 구매내역, 내 상품 관리)</p>

<p><img src="https://user-images.githubusercontent.com/73110638/108618795-51a12900-7464-11eb-99fd-e643351c731b.png" width="300" height="200"> <img src="https://user-images.githubusercontent.com/73110638/108618902-09ced180-7465-11eb-8325-ae61e972428f.png" width="300" height="200"> <img src="https://user-images.githubusercontent.com/73110638/108618891-fde30f80-7464-11eb-8462-6f18ce54f355.png" width="300" height="200"> <img src="https://user-images.githubusercontent.com/73110638/108618893-ffacd300-7464-11eb-818f-b4a70f58466a.png" width="300" height="200"> <img src="https://user-images.githubusercontent.com/73110638/108618661-371a8000-7463-11eb-86f9-9aff1f87562e.png" width="300" height="200"> <img src="https://user-images.githubusercontent.com/73110638/108618765-1141ab00-7464-11eb-81ea-69e570f75854.png" width="300" height="200">
</p><br/>

<p>> 채팅방</p>
<p><img src="https://user-images.githubusercontent.com/73110638/108618519-65e42680-7462-11eb-9d37-e4918fe520fc.png" width="400" height="250">
</p><br/>

<p>> 관리자 페이지</p>
<p><img src="https://user-images.githubusercontent.com/73110638/108619128-333c2d00-7466-11eb-9f88-3df82799b963.png" width="400" height="250">
</p>

  </div>
</div>

  </div>

</main>

