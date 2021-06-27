package web.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.spring.vo.CartVO;
import web.spring.vo.Criteria;
import web.spring.vo.OrderVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.UserVO;

@Service
public interface PaymentService {

	public UserVO get(String User_id);
	
	public PBoardVO getProduct(String pboard_unit_no);
	
	public int updateStocks(PBoardVO pvo);
	
	public int insertOrder(OrderVO ovo);
	
	public List<OrderVO> getOrderList(String user_id, Criteria cri);
	
	public int getOrderListTotal(String user_id, Criteria cri);
	
	public List<OrderVO> getOrderAllList(Criteria cri);
	
	public int getOrderAllListTotal(Criteria cri);
	
	public OrderVO getOrderStatus(String order_id);
	
	public int insertCart(CartVO cvo);
	
	public List<CartVO> getCartList(String user_id, Criteria cri);
	
	public int getCartListTotal(String user_id, Criteria cri);
	
	public int deleteCart(String cart_id);
	
	public int updateOrderList(OrderVO ovo);
}