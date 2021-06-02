package web.spring.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.mapper.InquiryReplyMapper;
import web.spring.vo.InquiryReplyVO;

@Service
public class InquiryReplyServiceImpl implements InquiryReplyService{

	@Autowired
	InquiryReplyMapper mapper;

	//답변 등록
	@Override
	public int insertReply(InquiryReplyVO vo) {
		return mapper.insertReply(vo);
	}
	
	//답변 불러오기
	@Override
	public List<InquiryReplyVO> getInquiryReply(int iboard_no) {
		return mapper.getInquiryReply(iboard_no);
	}


}
