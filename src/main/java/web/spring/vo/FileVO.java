package web.spring.vo;

import java.util.Date;

public class FileVO {
	private String file_pictureId; //洹몃┝踰덊샇
	private String file_uuid; //uuid
	private String file_name; //�씠由�
	private String file_uploadPath; //uploadPath
	private String file_savePath; //db�뿉�꽌 �깮�꽦 (uuid_name)
	private String file_s_savePath; //db�뿉�꽌 �깮�꽦(s_uuid_name)
	private String file_type; // �뙆�씪 �쑀�삎 (jpg, png �벑)
	private String file_usingType; // �씠�슜�븯�뒗 �쑀�삎(0-user, 1-怨듭�, 2-臾몄쓽, 3-�긽�뭹)
	private Date file_regdate;
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
