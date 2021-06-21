package web.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
import web.spring.service.InquiryBoardService;
import web.spring.service.InquiryReplyService;
import web.spring.vo.Criteria;
import web.spring.vo.InquiryBoardVO;
import web.spring.vo.InquiryReplyVO;
import web.spring.vo.PageNavi;

@Controller
@Log4j
public class InquiryController {

	@Autowired
	InquiryBoardService service;
	InquiryReplyService replyService;

	/**
	 * @author 문의사항 리스트 불러오기
	 *
	 */
	@GetMapping("/inquiry")
	public String getInquiryBoardList(Criteria cri, Model model) {
		List<InquiryBoardVO> inquiryList = service.getInquiryBoardList();
		

		if (inquiryList != null) {
			model.addAttribute("inquiryList", inquiryList);
			model.addAttribute("pageNavi", new PageNavi(cri, service.getTotal(cri)));
		}
		log.info("inquiry.....");
		return "/inquiry/inquiry";
	}

	/**
	 * @author 문의사항 등록 매핑
	 */

	@GetMapping("/inquiry_register")
	public String inquiryRegister() {
		log.info("inquiry_register.....");
		return "/inquiry/inquiry_register";
	}

	/**
	 * @author 문의사항 등록 프로세스 매핑
	 */
	@PostMapping("/inquiryRegister")
	public String inquiryRegisterInsert(InquiryBoardVO vo, RedirectAttributes rttr) {
		log.info(vo);
		service.insertInquiry(vo);
		String resMsg = "게시글이 등록되었습니다.";
		rttr.addFlashAttribute("resMsg", resMsg);
		return "redirect:/inquiry";
	}

	/**
	 * @author 문의사항 상세보기 매핑
	 */
	@GetMapping("/inquiry_detail")
	public String detailInquiry(String iboard_no, InquiryBoardVO vo, Model model) {

		vo = service.detailInquiry(iboard_no);
		
		model.addAttribute("inquiry_detail", vo);

		log.info("inquiry detail...." + iboard_no);
		return "/inquiry/inquiry_detail";
	}

	/**
	 * @author 문의사항 삭제
	 */
	@PostMapping("/inquiry_delete")
	public String deleteInquiry(InquiryBoardVO vo, RedirectAttributes rttr) {

//		int replyCount = replyService.inquiryReplyCount(vo.getIboard_no());
//		
//		log.info(replyCount);
		
//		if (replyCount > 0) {
//			replyService.deleteReply(vo.getIboard_no());
//		}
		
		int res = service.deleteInquiry(vo.getIboard_no());
		String resMsg = "";
		if (res > 0) {
			resMsg = "게시글이 삭제되었습니다.";
			rttr.addFlashAttribute("resMsg", resMsg);
			return "redirect:/inquiry";
		} else {
			resMsg = "오류가 발생했습니다.";
			rttr.addFlashAttribute("resMsg", resMsg);
			return "redirect:/inquiry";
		}

	}

}
