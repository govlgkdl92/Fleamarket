package admin.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class AdminBoardPaging {
	private int currentPage; //현재페이지
	//현재페이지라는 표시로 다른 페이지랑 색을 다르게 해야 한다.
	private int pageBlock; //[이전][1][2][3][다음]
	private int pageSize; //1페이지당 5개씩
	private int totalA; //총글수
	private StringBuffer pagingHTML;
	//StringBuffer는 편집이 가능하다.
	
	
	public void makePagingHTML(){
		pagingHTML = new StringBuffer();
		int totalP = (totalA + pageSize-1) / pageSize; //총페이지수

		int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
		//int는 소수점은 그냥 버린다.
		int endPage = startPage + pageBlock - 1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > pageBlock)
			pagingHTML.append("<a class='page-link' onclick='boardPaging("+(startPage-1)+")' aria-label='Previous'><span aria-hidden='true' >&laquo;이전</span></a>");
		
		for(int i=startPage; i<=endPage; i++) {
			if(i == currentPage)
				pagingHTML.append("<a class='page-link' id='currentPaging' onclick='boardPaging("+i+")'>"+i+"</a>");
			else
				pagingHTML.append("<a class='page-link' id='paging' onclick='boardPaging("+i+")'>"+i+"</a>");
		}//for
		
		if(endPage < totalP)
			pagingHTML.append("<a class='page-link' onclick='boardPaging("+(endPage+1)+")' aria-label='Next'><span aria-hidden='true' >&raquo;다음</span></a>");
	}



	
}
