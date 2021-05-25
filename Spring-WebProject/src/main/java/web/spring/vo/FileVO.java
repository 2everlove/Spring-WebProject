  
package web.spring.vo;

import java.util.Date;

import lombok.Data;

@Data
public class FileVO {
	private String file_pictureId; //그림번호
	private String file_uuid; //uuid
	private String file_name; //이름
	private String file_uploadPath; //uploadPath
	private String file_savePath; //db에서 생성 (uuid_name)
	private String file_s_savePath; //db에서 생성(s_uuid_name)
	private String file_type; // 파일 유형 (jpg, png 등)
	private String file_usingType; // 이용하는 유형(0-user, 1-공지, 2-문의, 3-상품)
	private Date file_regdate;
}