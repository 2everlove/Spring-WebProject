package web.spring.service;


import java.util.List;

import web.spring.vo.InquiryReplyVO;

public interface InquiryReplyService {
	
	public int insertReply(InquiryReplyVO vo); //문의사항 답변 삽입
	
	public List<InquiryReplyVO> getInquiryReply(int iboard_no); //해당 게시물의 답변 불러오기
	
	public int inquiryReplyCount(int board_no); //답변 유무 확인용
}
