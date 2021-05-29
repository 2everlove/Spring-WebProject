package src.main.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.mapper.FileMapper;
import web.spring.vo.FileVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FileMapperTests {
	@Setter(onMethod_= @Autowired)
	private FileMapper fileMapper;
	
	@Test
	public void getSeqTest() {
		log.info(fileMapper.getFileSeq());
	}
	
	@Test 
	public void insertFeil() {
		FileVO fileVO = new FileVO(null, null, null);
		fileVO.setFile_name("file_name.jpg");
		fileVO.setFile_pictureId(fileMapper.getFileSeq());
		fileVO.setFile_type("file_type");
		fileVO.setFile_uploadPath("file_uploadPath");
		fileVO.setFile_usingType("3");
		fileVO.setFile_uuid("file_uuid");
		log.info(fileMapper.fileInsert(fileVO));
	}
	
	@Test
	public void deleteFile() {
		log.info(fileMapper.fileDelete("24", "file_uuid"));
	}
	
	@Test
	public void product_category() {
		log.info(fileMapper.getTypeListFile("tablet"));
	}
	@Test
	public void getMainListFile() {
		log.info(fileMapper.getMainListFile());
	}
	
}