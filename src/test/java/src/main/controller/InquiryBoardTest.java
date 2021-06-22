package src.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.mapper.FileMapper;
import web.spring.mapper.InquiryBoardMapper;
import web.spring.mapper.InquiryReplyMapper;
import web.spring.mapper.ProductReviewMapper;
import web.spring.service.InquiryBoardService;
import web.spring.service.InquiryReplyService;
import web.spring.service.ProductReviewService;
import web.spring.vo.Criteria;
import web.spring.vo.FileVO;
import web.spring.vo.InquiryBoardVO;
import web.spring.vo.InquiryReplyVO;
import web.spring.vo.ProductReviewVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InquiryBoardTest {
	@Setter(onMethod_= @Autowired)
	private InquiryReplyService service;
	private InquiryBoardService service1;
	private InquiryBoardMapper mapper;
	private ProductReviewMapper mapper1;
	private ProductReviewService service2;
	
	@Test
	public void getInquiryReply() {
		log.info(service.getInquiryReply(70));
	}
	
	@Test
	public void replyInsertTest() {
		InquiryReplyVO vo = new InquiryReplyVO();
		vo.setIboard_no(29);
		vo.setIreply_content("테스트내용");
//		vo.setIreply_no(1);
		
		int res = service.insertReply(vo);
		
		log.info("=============" + res);
	}
	
	
	@Test
	public void replyGetTest() {
		service.getInquiryReply(29);
	}
	@Test
	public void countreply() {
		service.inquiryReplyCount(29);
	}
	
	
	
	
}