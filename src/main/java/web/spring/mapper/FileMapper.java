package web.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.spring.vo.FileVO;

public interface FileMapper {

	public FileVO getFile(@Param("file_pictureId")String file_pictureId,@Param("file_uuid") String file_uuid);
	
	public List<FileVO> getListFile(String file_pictureId);
	
	public FileVO getFileALL(String file_pictureId);
	
	public int fileDelete(@Param("file_pictureId")String file_pictureId,@Param("file_uuid") String file_uuid);
	
	public int fileInsert(FileVO fileVO);
	
	public String getFileSeq();
	
	
}
