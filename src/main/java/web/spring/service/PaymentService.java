package web.spring.service;

import org.springframework.stereotype.Service;

import web.spring.vo.ProductVo;
import web.spring.vo.UserVo;

@Service
public interface PaymentService {

	public UserVo get(String user_id);
	
	public ProductVo getProduct(String product_id);
	
}