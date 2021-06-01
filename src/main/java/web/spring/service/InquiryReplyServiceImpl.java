package web.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.mapper.InquiryReplyMapper;
import web.spring.vo.InquiryReplyVO;

@Service
public class InquiryReplyServiceImpl implements InquiryReplyService{

	@Autowired
	InquiryReplyMapper mapper;

	@Override
	public int insertReply(InquiryReplyVO vo) {
		return mapper.insertReply(vo);
	}


}
