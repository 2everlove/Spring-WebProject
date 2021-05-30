package web.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.spring.vo.InquiryBoardVO;

@Service
public interface InquiryBoardService {
	
	public List<InquiryBoardVO> getInquiryBoardList(); // 문의사항 리스트 불러오기
	
	public int insertInquiry(InquiryBoardVO vo); // 문의사항 등록 
	
	public InquiryBoardVO detailInquiry(int iboard_no); //문의사항 상세보기
	
	

}
