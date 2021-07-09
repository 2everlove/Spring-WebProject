package web.spring.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	private String num; //순번
	private String product_id; //제품 아이디
	private String product_manufacturer; //제조사
	private String product_name; //제품명
	private String product_description; //상세설명
	private String product_category; //카테고리 (태블릿, 노트북)
	private String product_color; //색상
	private Date product_regdate; // 작성일
	private String file_pictureId; //제품 이미지 파일
}
