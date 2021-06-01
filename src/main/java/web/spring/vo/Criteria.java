package web.spring.vo;

import lombok.Data;

@Data
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
	
	
}
