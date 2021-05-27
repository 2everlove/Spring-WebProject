package web.spring.mapper;

import web.spring.vo.OrderVo;
import web.spring.vo.ProductVo;
import web.spring.vo.UserVo;

public interface PaymentMapper {
	
	public UserVo get(String user_id);
	
	public ProductVo getProduct(String product_id);
	
	public int insertOrder(OrderVo vo);
}