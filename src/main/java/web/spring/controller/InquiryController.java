package web.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;
import web.spring.service.InquiryBoardService;



@Controller
@Log4j
public class InquiryController {
	
	@Autowired
	InquiryBoardService service;
	
	
	
	
	/**
	 * @author JMP Korea
	 * 문의사항 리스트 불러오기
	 *
	 */
	@GetMapping("/inquiry") 
	public void getInquiryBoardList(Model model) {
		
		model.addAttribute("inquiryList", service.getInquiryBoardList());
		log.info("inquiry.....");
	}
	
	
	/**
	 * @author JMP Korea
	 * 문의사항 등록 매핑
	 */
	
	@GetMapping("/inquiry_register")
	public void inquiryRegister() {
		
	}
	
	

}
