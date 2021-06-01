package web.spring.vo;

import java.util.Date;
import java.util.UUID;

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
	
	public FileVO(String file_pictureId, String file_uploadPath, String file_name) {
		UUID file_uuid = UUID.randomUUID();
		this.file_uuid = file_uuid.toString();
		this.file_type = "Y"; //기본은 N , image일때만 Y로 변하게 ajaxController에서 처리
		
		this.file_pictureId = file_pictureId;
		this.file_uploadPath = file_uploadPath;
		this.file_name = file_name;
		this.file_savePath = file_uploadPath+file_uuid+"_"+file_name;
		this.file_s_savePath = file_uploadPath+"s_"+file_uuid+"_"+file_name;
	}
}
