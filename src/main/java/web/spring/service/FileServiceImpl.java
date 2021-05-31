package web.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.mapper.FileMapper;
import web.spring.vo.FileVO;

@Service
public class FileServiceImpl implements FileService{

	@Autowired
	private FileMapper fileMapper;

	@Override
	public FileVO getFile(String file_pictureId, String file_uuid) {
		return fileMapper.getFile(file_pictureId, file_uuid);
	}

	@Override
	public List<FileVO> getListFile(String file_pictureId) {
		return fileMapper.getListFile(file_pictureId);
	}

	@Override
	public int fileDelete(String file_pictureId, String file_uuid) {
		return fileMapper.fileDelete(file_pictureId, file_uuid);
	}

	
}
