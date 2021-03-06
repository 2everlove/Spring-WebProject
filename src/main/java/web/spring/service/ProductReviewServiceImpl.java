package web.spring.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.mapper.ProductReviewMapper;
import web.spring.vo.ProductReviewVO;


@Service
public class ProductReviewServiceImpl implements ProductReviewService{

	@Autowired
	ProductReviewMapper mapper;

	@Override
	public List<ProductReviewVO> getProductReviewList(int pboard_unit_no) {
		return mapper.getProductReviewList(pboard_unit_no);
	}

	@Override
	public int insertProductReviewList(ProductReviewVO vo) {
		return mapper.insertProductReviewList(vo);
	}

	@Override
	public int deleteProductReviewList(int review_num) {
		return mapper.deleteProductReviewList(review_num);
	}

	@Override
	public int countProductReply(int pboard_unit_no) {
		return mapper.countProductReply(pboard_unit_no);
	}


	



}
