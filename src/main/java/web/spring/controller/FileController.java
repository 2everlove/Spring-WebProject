package web.spring.controller;

import java.io.File;
import java.nio.file.Files;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.service.FileService;

@RestController
@Log4j
public class FileController {
	
	@Setter(onMethod_= @Autowired)
	private FileService fileService;
	
	private static final String ROOT_DIR = "C:\\upload\\temp\\";
	
	@GetMapping("/fileDisplay")
	public ResponseEntity<byte[]> fileDisplay(@Param("file_name") String file_name){
		log.info("fileDisplay...."+file_name);
		HttpHeaders headers = new HttpHeaders();
		File file = new File(ROOT_DIR+file_name);
		log.info(file);
		if(file.exists()) {
			try {
				headers.add("Content-Type", Files.probeContentType(file.toPath()));
				return new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
			} catch (Exception e) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	
}
