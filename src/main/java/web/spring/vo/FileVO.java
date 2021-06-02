package web.spring.vo;

import java.util.Date;
import java.util.UUID;

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

	public String getFile_pictureId() {
		return file_pictureId;
	}

	public void setFile_pictureId(String file_pictureId) {
		this.file_pictureId = file_pictureId;
	}

	public String getFile_uuid() {
		return file_uuid;
	}

	public void setFile_uuid(String file_uuid) {
		this.file_uuid = file_uuid;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_uploadPath() {
		return file_uploadPath;
	}

	public void setFile_uploadPath(String file_uploadPath) {
		this.file_uploadPath = file_uploadPath;
	}

	public String getFile_savePath() {
		return file_savePath;
	}

	public void setFile_savePath(String file_savePath) {
		this.file_savePath = file_savePath;
	}

	public String getFile_s_savePath() {
		return file_s_savePath;
	}

	public void setFile_s_savePath(String file_s_savePath) {
		this.file_s_savePath = file_s_savePath;
	}

	public String getFile_type() {
		return file_type;
	}

	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}

	public String getFile_usingType() {
		return file_usingType;
	}

	public void setFile_usingType(String file_usingType) {
		this.file_usingType = file_usingType;
	}

	public Date getFile_regdate() {
		return file_regdate;
	}

	public void setFile_regdate(Date file_regdate) {
		this.file_regdate = file_regdate;
	}
	
	
}
