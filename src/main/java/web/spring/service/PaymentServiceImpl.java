package web.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.mapper.PaymentMapper;
import web.spring.vo.ProductVo;
import web.spring.vo.UserVo;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentMapper mapper;
	
	@Override
	public UserVo get(String user_id) {
		return mapper.get(user_id);
	}

	@Override
	public ProductVo getProduct(String product_id) {
		return mapper.getProduct(product_id);
	}

}
