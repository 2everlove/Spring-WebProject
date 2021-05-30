package web.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.mapper.PaymentMapper;
import web.spring.vo.OrderVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;
import web.spring.vo.UserVO;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentMapper mapper;
	
	@Override
	public UserVO get(String user_id) {
		return mapper.get(user_id);
	}

	@Override
	public PBoardVO getProduct(String product_id) {
		return mapper.getProduct(product_id);
	}

	@Override
	public int insertOrder(OrderVO ovo) {
		return mapper.insertOrder(ovo);
	}

	@Override
	public ProductVO getProductInfo(String product_id) {
		return mapper.getProductInfo(product_id);
	}

}