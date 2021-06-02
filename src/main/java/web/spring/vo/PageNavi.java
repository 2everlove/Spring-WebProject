package web.spring.vo;

public class PageNavi {

	// �럹�씠吏� �꽕鍮꾧쾶�씠�뀡�쓽 �떆�옉 踰덊샇
	int startPage;
	// �럹�씠吏� �꽕鍮꾧쾶�씠�뀡�쓽 �걹踰덊샇
	int endPage;
	// �씠�쟾 �럹�씠吏� �뿬遺�
	boolean prev;
	// �떎�쓬 �럹�씠吏� �뿬遺�
	boolean next;
	
	// �럹�씠吏� �젙蹂�
	Criteria cri;
	// 寃뚯떆臾쇱쓽 珥� 嫄댁닔
	int total;
	
	public PageNavi(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		// �럹�씠吏� �꽕鍮꾧쾶�씠�뀡�쓽 �걹 踰덊샇
		endPage = (int)(Math.ceil(cri.getPageNo() / 10.0)) *10;
		// �럹�씠吏� �꽕鍮꾧쾶�씠�뀡�쓽 �떆�옉 踰덊샇
		startPage = endPage - 9;
		// �떎�젣 留덉�留� �럹�씠吏� 踰덊샇
		int realEndPage = (int)Math.ceil((total*1.0)/cri.getAmount());
		
		// �꽕鍮꾧쾶�씠�뀡�쓽 留덉�留� �럹�씠吏� 踰덊샇 蹂대떎 �떎�젣 �럹�씠吏� 踰덊샇媛� �겢寃쎌슦 留덉�留� �럹�씠吏� 踰덊샇瑜� �닔�젙
		endPage = endPage > realEndPage ? realEndPage : endPage;  
		
		prev = startPage>1;
		
		// �떎�젣 留덉�留� �럹�씠吏�媛� �쁽�옱 �궡鍮꾧쾶�씠�뀡�쓽 �걹 �럹�씠吏� 踰덊샇 蹂대떎 �겕硫�
		next = realEndPage > endPage;
		
			
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	
	
}
