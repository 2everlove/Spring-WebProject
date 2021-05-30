package web.spring.service;

import org.springframework.stereotype.Service;

import web.spring.vo.OrderVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;
import web.spring.vo.UserVO;

@Service
public interface PaymentService {

	public UserVO get(String user_id);
	
	public PBoardVO getProduct(String product_id);
	
	public int insertOrder(OrderVO ovo);
	
	public ProductVO getProductInfo(String product_id);
}