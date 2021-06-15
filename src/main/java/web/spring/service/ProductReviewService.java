package web.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.spring.vo.ProductReviewVO;

public interface ProductReviewService {

	// 해당 제품에 대한 리뷰 불러오기
	public List<ProductReviewVO> getProductReviewList();

	// @Param("pboard_unit_no") int pboard_unit_no

}
