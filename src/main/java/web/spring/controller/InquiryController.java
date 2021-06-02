package web.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
import web.spring.service.InquiryBoardService;
import web.spring.vo.InquiryBoardVO;

@Controller
@Log4j
public class InquiryController {

	@Autowired
	InquiryBoardService service;

	/**
	 * @author 臾몄쓽�궗�빆 由ъ뒪�듃 遺덈윭�삤湲�
	 *
	 */
	@GetMapping("/inquiry")
	public String getInquiryBoardList(Model model) {
		List<InquiryBoardVO> inquiryList = service.getInquiryBoardList();
		if(inquiryList!=null) {
			model.addAttribute("inquiryList", inquiryList);
		}
		System.out.println("inquiry.....");
		return "/inquiry/inquiry";
	}

	/**
	 * @author 臾몄쓽�궗�빆 �벑濡� 留ㅽ븨
	 */

	@GetMapping("/inquiry_register")
	public String inquiryRegister() {
		System.out.println("inquiry_register.....");
		return "/inquiry/inquiry_register";
	}

	/**
	 * @author 臾몄쓽�궗�빆 �벑濡� �봽濡쒖꽭�뒪 留ㅽ븨
	 */
	@PostMapping("/inquiryRegister")
	public String inquiryRegisterInsert(InquiryBoardVO vo, RedirectAttributes rttr) {
		System.out.println(vo);
		service.insertInquiry(vo);
		String resMsg = "寃뚯떆湲��씠 �벑濡앸릺�뿀�뒿�땲�떎.";
		rttr.addFlashAttribute("resMsg", resMsg);
		return "redirect:/inquiry/inquiry";
	}

	/**
	 * @author 臾몄쓽�궗�빆 �긽�꽭蹂닿린 留ㅽ븨
	 */
	@GetMapping("/inquiry_detail")
	public String detailInquiry(String iboard_no, InquiryBoardVO vo, Model model) {

		vo = service.detailInquiry(iboard_no);
		model.addAttribute("inquiry_detail", vo);
		System.out.println("inquiry detail...." + iboard_no);
		return "/inquiry/inquiry_detail";
	}

	/**
	 * @author 臾몄쓽�궗�빆 �궘�젣
	 */
	@PostMapping("/inquiry_delete")
	public String deleteInquiry(InquiryBoardVO vo, RedirectAttributes rttr) {
		int res = service.deleteInquiry(vo.getIboard_no());
		String resMsg = "";
		if (res > 0) {
			resMsg = "寃뚯떆湲��씠 �궘�젣�릺�뿀�뒿�땲�떎.";
			rttr.addFlashAttribute("resMsg", resMsg);
			return "redirect:/inquiry";
		} else {
			resMsg = "�삤瑜섍� 諛쒖깮�뻽�뒿�땲�떎.";
			rttr.addFlashAttribute("resMsg", resMsg);
			return "redirect:/inquiry/inquiry_detail";
		}

	}

}
