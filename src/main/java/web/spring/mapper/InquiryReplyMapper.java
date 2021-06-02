package web.spring.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.spring.vo.InquiryReplyVO;

public interface InquiryReplyMapper {
	
	public int insertReply(InquiryReplyVO vo); //문의사항 답변 삽입
	
	public List<InquiryReplyVO> getInquiryReply(@Param("iboard_no") int iboard_no); //해당 게시물의 답변 불러오기
	
	
}
