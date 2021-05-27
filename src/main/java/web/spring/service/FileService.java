package web.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.spring.vo.FileVO;

@Service
public interface FileService {
	public FileVO getFile(String file_pictureId, String file_uuid);
	
	public List<FileVO> getListFile(String file_pictureId);
	
	public int fileDelete(String file_pictureId, String file_uuid);
}
