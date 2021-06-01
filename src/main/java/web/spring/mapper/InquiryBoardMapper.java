package web.spring.mapper;

import java.util.List;

import web.spring.vo.InquiryBoardVO;

public interface InquiryBoardMapper {
	
	public List<InquiryBoardVO> getInquiryBoardList(); // 문의사항 리스트 불러오기
	
	public int insertInquiry(InquiryBoardVO vo); // 문의사항 등록 
	
	public InquiryBoardVO detailInquiry(String iboard_no); //문의사항 상세보기
	
	public int deleteInquiry(int iboard_no); //문의사항 삭제
	
	
}
