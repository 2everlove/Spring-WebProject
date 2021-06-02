package web.spring.vo;

import lombok.Data;

// 페이지 처리
@Data
public class PageNavi {

	// 페이지 네비게이션의 시작 번호
	int startPage;
	// 페이지 네비게이션의 끝번호
	int endPage;
	// 이전 페이지 여부
	boolean prev;
	// 다음 페이지 여부
	boolean next;
	
	// 페이지 정보
	Criteria cri;
	// 게시물의 총 건수
	int total;
	
	public PageNavi(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		// 페이지 네비게이션의 끝 번호
		endPage = (int)(Math.ceil(cri.getPageNo() / 10.0)) *10;
		// 페이지 네비게이션의 시작 번호
		startPage = endPage - 9;
		// 실제 마지막 페이지 번호
		int realEndPage = (int)Math.ceil((total*1.0)/cri.getAmount());
		
		// 네비게이션의 마지막 페이지 번호 보다 실제 페이지 번호가 클경우 마지막 페이지 번호를 수정
		endPage = endPage > realEndPage ? realEndPage : endPage;  
		
		prev = startPage>1;
		
		// 실제 마지막 페이지가 현재 내비게이션의 끝 페이지 번호 보다 크면
		next = realEndPage > endPage;
		
			
	}
	
	
	
}
