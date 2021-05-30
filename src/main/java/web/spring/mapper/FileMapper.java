package web.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.spring.vo.FileVO;

public interface FileMapper {

	public FileVO getFile(@Param("file_pictureId")String file_pictureId,@Param("file_uuid") String file_uuid);
	
	public List<FileVO> getListFile(String file_pictureId);
	
	public List<FileVO> getPDetailThum(String pboard_unit_no);//pBoard no로 product의 이미지
	
	public List<FileVO> getPDetailDesc(String pboard_unit_no);//pBoard no로 board의 상세이미지
	
	public List<FileVO> getTypeListFile(String product_category);
	
	public FileVO getFileALL(String file_pictureId);
	
	public int fileDelete(@Param("file_pictureId")String file_pictureId,@Param("file_uuid") String file_uuid);
	
	public int fileInsert(FileVO fileVO);
	
	public String getFileSeq();
	
	//검색
	public List<FileVO> getSearchListFile(String product_search);
	
	//메인
	public List<FileVO> getMainListFile();
	
	
}
