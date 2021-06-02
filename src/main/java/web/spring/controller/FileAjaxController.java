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
	
	@Autowired
	private FileService fileService;
	
	private static final String ROOT_DIR = "C:\\upload\\temp\\";
	
	@GetMapping("/fileUploadAjax/{file_pictureId}")
	public List<FileVO> getList(@PathVariable("file_pictureId") Long file_pictureId){
		System.out.println("getList........");
		List<FileVO> list = fileService.getListFile(String.valueOf(file_pictureId));
		System.out.println(list);
	return list;	
	}
	
	@GetMapping("/fileDisplay")
	public ResponseEntity<byte[]> fileDisplay(@Param("file_name") String file_name){
		System.out.println("fileDisplay...."+file_name);
		HttpHeaders headers = new HttpHeaders();
		File file = new File(ROOT_DIR+file_name);
		System.out.println(file);
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
		System.out.println("fileUpload...Ajax Post..."+file_pictureId);
		
		Map<String, String> map = new HashMap<String, String>();
		int res=0;
		
		if(null == file_pictureId || 0 == file_pictureId) {
			file_pictureId = Long.parseLong(fileService.getFileSeq());
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			
			//以묐났 諛⑹�瑜� �쐞�빐 UUID瑜� �깮�꽦�븯�뿬 �뙆�씪紐� �븵�뿉 遺숈뿬以��떎.(�씪�젴 踰덊샇 ���떊 �쑀異뷀븯湲� �옒�뱺 �떇蹂꾩옄瑜� �궗�슜)
			//universally unique identifier (UUID)
			
			
			String uploadPath = getFolder();
			
			//String uploadFileName = "_"+multipartFile.getOriginalFilename();
			
			System.out.println("File Name: "+multipartFile.getOriginalFilename());
			System.out.println("File Size: "+multipartFile.getSize());
			System.out.println("File Size: "+multipartFile.getContentType());
			System.out.println("===================================");
		
			
			//�뙆�씪�쓣 �꽌踰꾩뿉 ���옣
			try {
				FileVO fileVO = new FileVO(String.valueOf(file_pictureId), uploadPath, multipartFile.getOriginalFilename());
				
				//File saveFile = new File(ATTACHES_DIR+uploadPath, uploadFileName);
				File saveFile = new File(ROOT_DIR+fileVO.getFile_savePath());
				multipartFile.transferTo(saveFile);
				
				//�솗�옣�옄瑜� �씠�슜�븯�뿬 MimeType�쓣 寃곗젙
				//留덉엫���엯�쓣 �솗�씤�븯吏� 紐삵븯硫� null 諛�
				String contentType = Files.probeContentType(saveFile.toPath());
				fileVO.setFile_usingType(file_usingType);
				
				//�씠誘몄� �뙆�씪�씤 寃쎌슦 �뜽�꽕�씪 �깮�꽦
				//contentType�씠 image濡� �떆�옉�븯硫� �뜽�꽕�씪 �깮�꽦
				if(null != contentType && contentType.startsWith("image")) {
					//�뜽�꽕�씪 �깮�꽦�븷 寃쎈줈 吏��젙 (ex: 2021\5\2\s_fileName)
					//String thmbanil = ROOT_DIR+uploadPath+"s_"+uploadFileName;
					//�썝蹂� �뙆�씪�쓽 size瑜� 吏��젙�빐�꽌 寃쎈줈�뿉 ���옣
					Thumbnails.of(saveFile).size(1280, 720).toFile(ROOT_DIR+fileVO.getFile_s_savePath());
					
					//�씠誘몄�硫� VO�쓽 fileType�쓣 Y濡� ���옣
					fileVO.setFile_type("Y");
					System.out.println(fileVO.getFile_type());
					
				} else {
					fileVO.setFile_type("N");
				}
				//VO�뿉 ���옣�맂 �뙆�씪�젙蹂대�� DB�뿉 ���옣
				if(fileService.fileInsert(fileVO)>0) {
					res++;
				};
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}			
		}
		//attachNo�뿉 �빐�떦�븯�뒗 �뙆�씪由ъ뒪��瑜� 議고쉶�븯�뿬 �솕硫댁뿉 異쒕젰
		//List<AttachFileVO> list =  service.getList(attachNo);
		map.put("file_pictureId", file_pictureId+"");
		map.put("count", res+"");
		//log.info(list);
		return map;
	}//
	
	private String getFolder() {
		String uploadPath="";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//�궇吏� �삎�떇�쓣 吏��젙 (yyyy-MM-dd)
		String str = sdf.format(new Date());//�삤�뒛 �궇吏쒕�� �삎�떇�뿉 留욊쾶 媛��졇�샂
		
		//separator�뒗 UNIX systems '/', Windows systems '\\'濡� �굹�닠以��떎.
		//ex) 2021\05\03\
		uploadPath = str.replace("-", File.separator)+File.separator; //寃쎈줈留� 諛쏆옄! ROOT_DIR類닿퀬
		System.out.println("uploadPath : "+uploadPath);
		
		File saveFile = new File(ROOT_DIR+uploadPath);
		
		//寃쎈줈媛� 議댁옱�븯吏� �븡�쑝硫� 寃쎈줈 �깮�꽦
		if(!saveFile.exists()) {
			//�뿬�윭媛쒖쓽 �뙆�씪�쓣 留뚮뱾�븧 mkdirs
			saveFile.mkdirs();
		}
		return uploadPath;
	}

	
}
