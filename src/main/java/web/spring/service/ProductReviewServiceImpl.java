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
	public List<ProductReviewVO> getProductReviewList() {
		return mapper.getProductReviewList();
	}




}
