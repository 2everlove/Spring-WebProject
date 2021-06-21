package web.spring.service;

import java.util.List;


import web.spring.vo.ProductReviewVO;

public interface ProductReviewService {

	// 해당 제품에 대한 리뷰 불러오기
	public List<ProductReviewVO> getProductReviewList(int pboard_unit_no);
	
	public int insertProductReviewList(ProductReviewVO vo); //답변 넣기
	
	public int deleteProductReviewList(int review_num);	//리뷰 삭제


}
