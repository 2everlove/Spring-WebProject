package web.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.service.InquiryReplyService;
import web.spring.service.ProductService;
import web.spring.vo.InquiryReplyVO;
import web.spring.vo.ProductVO;

@RestController
@Log4j
public class InquiryReplyAjaxController {
	
	@Setter(onMethod_= @Autowired)
	private InquiryReplyService replyService;
	
	/**
	 * @author 답변 삽입
	 */
	@PostMapping("/inquiry/insertReply")
	public Map<String, Object> getInquiryReply(@RequestBody InquiryReplyVO vo){
		
		int res = replyService.insertReply(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(res>0)
			map.put("result", "success");
		else
			map.put("result", "fail");
		
		return map;
	}
	
	/*
	 * @GetMapping("/inquiry/inquiry_reply") public List<InquiryReplyVO>
	 * get(@PathVariable ("iboard_no") int iboard_no) { List<InquiryReplyVO> vo =
	 * replyService.getInquiryReply(iboard_no);
	 * 
	 * return vo; }
	 */
	
	
	
	
	
}
