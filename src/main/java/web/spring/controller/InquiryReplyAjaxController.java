package web.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.service.InquiryReplyService;
import web.spring.vo.InquiryReplyVO;

@RestController
@Log4j
public class InquiryReplyAjaxController {
	
	@Setter(onMethod_= @Autowired)
	private InquiryReplyService replyService;
	
	/**
	 * @author 답변 삽입
	 */
	@PostMapping("/inquiry/insertReply")
	public Map<String, Object> insertInquiryReply(@RequestBody InquiryReplyVO vo){
		
		int res = replyService.insertReply(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(res>0)
			map.put("result", "success");
		else
			map.put("result", "fail");
		
		return map;
	}
	
	@GetMapping("/inquiry/inquiry_reply/{iboard_no}")
	public Map<String, Object> getInquiryReply(@PathVariable("iboard_no") int iboard_no, Model model){
		
		
		//리스트 조회
		List<InquiryReplyVO> list = replyService.getInquiryReply(iboard_no);
		
		int replyCount = replyService.inquiryReplyCount(iboard_no);
		
		model.addAttribute("inquiryReply", list);
		model.addAttribute("replyCount", replyCount);
		
		log.info(replyService.getInquiryReply(iboard_no));
		log.info(replyCount);
		
		//결과를 맵에 담아 리턴
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("replyCount", replyCount);
		
		return map;
		
	}
	
	
	
	
	
	
	
}
