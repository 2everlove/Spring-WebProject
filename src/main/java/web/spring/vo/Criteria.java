package web.spring.vo;

public class Criteria {
	int pageNo;
	int amount;
	String type;
	String keyword;
	public Criteria() {
		this.pageNo=1;
		this.amount=10;
	}
	public Criteria(int pageNo,int amount) {
		this.pageNo=pageNo;
		this.amount=amount;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
