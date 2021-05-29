package web.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.spring.vo.FileVO;

@Service
public interface FileService {
	public FileVO getFile(String file_pictureId, String file_uuid);
	
	public List<FileVO> getListFile(String file_pictureId);
	
	public FileVO getFileALL(String file_pictureId);
	
	public int fileDelete(String file_pictureId, String file_uuid);
	
	public String getFileSeq();
	
	public int fileInsert(FileVO fileVO);
	
	public List<FileVO> getTypeListFile(String product_category);
	
	public List<FileVO> getPDetailThum(String pboard_unit_no);//pBoard no로 product의 이미지
	
	public List<FileVO> getPDetailDesc(String pboard_unit_no);//pBoard no로 board의 상세이미지
	
	//메인
	public List<FileVO> getMainListFile();
}
