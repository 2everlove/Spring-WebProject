package web.spring.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PBoardVO {
	private String num; //순번
	private String avg; //평점(join)
	private String pboard_unit_no; // 상품 게시판 번호
	private String pboard_unit_price; //상품 가격
	private String pboard_unit_condition; //상품 상태(new, event ...etc)
	private String pboard_unit_stocks; //재고
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pboard_unit_regdate; //작성일
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pboard_unit_updateDate; //수정일
	
	private String pboard_unit_enabled; //활성화(활성화, 비활성화)
	private String each_rank; //(싼 가격 별 정렬)
	private String product_id; //상품 게시물의 마스터 상품
	private String user_id; // 작성자
	private String file_pictureId; //상품 게시물의 상세 이미지
	private String masterImg; //마스터 상품 이미지
}
