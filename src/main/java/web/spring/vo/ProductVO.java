package web.spring.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	
	private String product_id;
	private String product_manufacturer;
	private String product_name;
	private String product_category;
	private String product_color;
	private Date product_regdate;
	private String file_pictureId;
}
