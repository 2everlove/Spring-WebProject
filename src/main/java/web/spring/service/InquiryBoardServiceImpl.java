package web.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.mapper.InquiryBoardMapper;
import web.spring.vo.Criteria;
import web.spring.vo.InquiryBoardVO;

@Service
public class InquiryBoardServiceImpl implements InquiryBoardService{

	@Autowired
	InquiryBoardMapper mapper;
	
	//문의사항 리스트
	@Override
	public List<InquiryBoardVO> getInquiryBoardList() {
		return mapper.getInquiryBoardList();
	}

	//문의사항 등록
	@Override
	public int insertInquiry(InquiryBoardVO vo) {
		return mapper.insertInquiry(vo);
	}

	//문의사항 상세보기
	@Override
	public InquiryBoardVO detailInquiry(String iboard_no) {
		return mapper.detailInquiry(iboard_no);
	}

	//문의사항 삭제
	@Override
	public int deleteInquiry(int iboard_no) {
		return mapper.deleteInquiry(iboard_no);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	
	
	

}
