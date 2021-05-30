package web.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;
import web.spring.service.InquiryBoardService;
import web.spring.vo.InquiryBoardVO;



@Controller
@Log4j
public class InquiryController {
	
	@Autowired
	InquiryBoardService service;
	
	
	
	
	/**
	 * @author 
	 * 문의사항 리스트 불러오기
	 *
	 */
	@GetMapping("/inquiry") 
	public void getInquiryBoardList(Model model) {
		
		model.addAttribute("inquiryList", service.getInquiryBoardList());
		log.info("inquiry.....");
	}
	
	
	/**
	 * @author
	 * 문의사항 등록 매핑
	 */
	
	@GetMapping("/inquiry_register")
	public void inquiryRegister() {
		log.info("inquiry_register.....");
	}
	
	/**
	 * @author
	 * 문의사항 등록 프로세스 매핑
	 */
	@PostMapping("/inquiryRegister")
	public String inquiryRegisterInsert(InquiryBoardVO vo) {
		log.info(vo);
		service.insertInquiry(vo);
		return "redirect:/inquiry";
	}
	
	@GetMapping("/inquiry_detail")
	public void detailInquiry(InquiryBoardVO vo, Model model) {
		//상세정보 조회
		vo = service.detailInquiry(vo.getIboard_no());
		log.info("=========" + vo.getIboard_no());
		//모델에 담아서 화면에 전달
		model.addAttribute("vo", vo);
		log.info("==============" + vo);
		
	}
	
	
	
	

}
