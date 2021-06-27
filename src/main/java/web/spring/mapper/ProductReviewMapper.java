package web.spring.mapper;

import java.util.List;


import web.spring.vo.ProductReviewVO;

public interface ProductReviewMapper {
	
	
	//해당 제품에 대한 리뷰 불러오기
	public List<ProductReviewVO> getProductReviewList(int pboard_unit_no);	//리뷰 호출
	
	public int insertProductReviewList(ProductReviewVO vo); //답변 넣기
	
	public int deleteProductReviewList(int review_num);	//리뷰 삭제
	
	public int countProductReply(int pboard_unit_no);
	
	

	
	
}
