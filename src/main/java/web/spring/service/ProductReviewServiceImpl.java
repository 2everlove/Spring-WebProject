package web.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.mapper.ProductReviewMapper;

@Service
public class ProductReviewServiceImpl implements ProductReviewService {

	@Autowired
	ProductReviewMapper mapper;

	@Override
	public int insertProductReview(ProductReviewMapper vo) {
		return mapper.insertProductReview(vo);
	}


}