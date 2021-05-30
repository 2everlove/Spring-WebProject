package web.spring.mapper;

import web.spring.vo.OrderVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;
import web.spring.vo.UserVO;

public interface PaymentMapper {
	
	public UserVO get(String user_id);
	
	public PBoardVO getProduct(String product_id);
	
	public int insertOrder(OrderVO vo);
	
	public ProductVO getProductInfo(String product_id);
}