package web.spring.mapper;

import java.util.List;

import web.spring.vo.CartVO;
import web.spring.vo.OrderVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.UserVO;

public interface PaymentMapper {
	
	public UserVO get(String User_id);
	
	public PBoardVO getProduct(String board_unit_no);
	
	public int insertOrder(OrderVO vo);
	
	public List<OrderVO> getOrderList(String user_id);
	
	public OrderVO getOrderStatus(String order_id);
	
	public int insertCart(CartVO cvo);
	
	public List<CartVO> getCartList(String user_id);
	
	public int deleteCart(String cart_id);
}