package web.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.spring.vo.CartVO;
import web.spring.vo.OrderVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.UserVO;

@Service
public interface PaymentService {

	public UserVO get(String User_id);
	
	public PBoardVO getProduct(String pboard_unit_no);
	
	public int insertOrder(OrderVO ovo);
	
	public List<OrderVO> getOrderList(String user_id);
	
	public OrderVO getOrderStatus(String order_id);
	
	public int insertCart(CartVO cvo);
	
	public List<CartVO> getCartList(String user_id);
	
	public int deleteCart(String cart_id);
}