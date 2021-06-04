package web.spring.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;
import web.spring.service.FileService;
import web.spring.vo.FileVO;

@RestController
@Log4j
public class FileAjaxController {
	
	@Setter(onMethod_= @Autowired)
	private FileService fileService;
	
	private static final String ROOT_DIR = "C:\\upload\\temp\\";
	
	@GetMapping("/fileUploadAjax/{file_pictureId}")
	public List<FileVO> getList(@PathVariable("file_pictureId") Long file_pictureId){
		log.info("getList........");
		List<FileVO> list = fileService.getListFile(String.valueOf(file_pictureId));
		log.info(list);
	return list;	
	}
	
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
	
	@PostMapping("/fileUploadAjax")
	public Map<String, String> fileUpload(MultipartFile[] uploadFile, Long file_pictureId, String file_usingType) {
		log.info("fileUpload...Ajax Post..."+file_pictureId);
		
		Map<String, String> map = new HashMap<String, String>();
		int res=0;
		
		if(null == file_pictureId || 0 == file_pictureId) {
			file_pictureId = Long.parseLong(fileService.getFileSeq());
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			
			//중복 방지를 위해 UUID를 생성하여 파일명 앞에 붙여준다.(일련 번호 대신 유추하기 힘든 식별자를 사용)
			//universally unique identifier (UUID)
			
			
			String uploadPath = getFolder();
			
			//String uploadFileName = "_"+multipartFile.getOriginalFilename();
			
			log.info("File Name: "+multipartFile.getOriginalFilename());
			log.info("File Size: "+multipartFile.getSize());
			log.info("File Size: "+multipartFile.getContentType());
			log.info("===================================");
		
			
			//파일을 서버에 저장
			try {
				FileVO fileVO = new FileVO(String.valueOf(file_pictureId), uploadPath, multipartFile.getOriginalFilename());
				
				//File saveFile = new File(ATTACHES_DIR+uploadPath, uploadFileName);
				File saveFile = new File(ROOT_DIR+fileVO.getFile_savePath());
				multipartFile.transferTo(saveFile);
				
				//확장자를 이용하여 MimeType을 결정
				//마임타입을 확인하지 못하면 null 반
				String contentType = Files.probeContentType(saveFile.toPath());
				fileVO.setFile_usingType(file_usingType);
				
				//이미지 파일인 경우 썸네일 생성
				//contentType이 image로 시작하면 썸네일 생성
				if(null != contentType && contentType.startsWith("image")) {
					//썸네일 생성할 경로 지정 (ex: 2021\5\2\s_fileName)
					//String thmbanil = ROOT_DIR+uploadPath+"s_"+uploadFileName;
					//원본 파일의 size를 지정해서 경로에 저장
					Thumbnails.of(saveFile).size(1280, 720).toFile(ROOT_DIR+fileVO.getFile_s_savePath());
					
					//이미지면 VO의 fileType을 Y로 저장
					fileVO.setFile_type("Y");
					log.info(fileVO.getFile_type());
					
				} else {
					fileVO.setFile_type("N");
				}
				//VO에 저장된 파일정보를 DB에 저장
				if(fileService.fileInsert(fileVO)>0) {
					res++;
				};
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}			
		}
		//attachNo에 해당하는 파일리스틀를 조회하여 화면에 출력
		//List<AttachFileVO> list =  service.getList(attachNo);
		map.put("file_pictureId", file_pictureId+"");
		map.put("count", res+"");
		//log.info(list);
		return map;
	}//
	
	private String getFolder() {
		String uploadPath="";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//날짜 형식을 지정 (yyyy-MM-dd)
		String str = sdf.format(new Date());//오늘 날짜를 형식에 맞게 가져옴
		
		//separator는 UNIX systems '/', Windows systems '\\'로 나눠준다.
		//ex) 2021\05\03\
		uploadPath = str.replace("-", File.separator)+File.separator; //경로만 받자! ROOT_DIR뺴고
		log.info("uploadPath : "+uploadPath);
		
		File saveFile = new File(ROOT_DIR+uploadPath);
		
		//경로가 존재하지 않으면 경로 생성
		if(!saveFile.exists()) {
			//여러개의 파일을 만들땐 mkdirs
			saveFile.mkdirs();
		}
		return uploadPath;
	}

	
}
