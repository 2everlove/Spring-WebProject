package web.spring.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CodeVO { //안씀
	private String code_no;
	private String code_type;
	private String code_value;
	private Date code_regdate;
	private Date code_updateDate;
	private String code__UP_MENU_ID;
	private String code_menu_URL;
	private String code_menu_SORT;
	private String code_menu_VISIBLE;
}
