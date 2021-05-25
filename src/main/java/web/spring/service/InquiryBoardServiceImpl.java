package web.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.mapper.InquiryBoardMapper;
import web.spring.vo.InquiryBoardVO;

@Service
public class InquiryBoardServiceImpl implements InquiryBoardService{

	@Autowired
	InquiryBoardMapper mapper;
	
	
	@Override
	public List<InquiryBoardVO> getInquiryBoardList() {
		return mapper.getInquiryBoardList();
	}
	

}
