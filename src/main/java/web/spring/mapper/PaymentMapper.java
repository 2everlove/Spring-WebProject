package web.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.spring.vo.CartVO;
import web.spring.vo.Criteria;
import web.spring.vo.OrderVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.UserVO;

public interface PaymentMapper {
	
	public UserVO get(String User_id);
	
	public PBoardVO getProduct(String board_unit_no);
	
	public int updateStocks(PBoardVO pvo);
	
	public int insertOrder(OrderVO ovo);
	
	public List<OrderVO> getOrderList(@Param("user_id") String user_id, @Param("pageNo") int pageNo, @Param("amount") int amount);
	
	public int getOrderListTotal(@Param("user_id") String user_id, @Param("pageNo") int pageNo, @Param("amount") int amount);
	
	public List<OrderVO> getOrderAllList(Criteria cri);
	
	public int getOrderAllListTotal(Criteria cri);
	
	public OrderVO getOrderStatus(String order_id);
	
	public int insertCart(CartVO cvo);
	
	public List<CartVO> getCartList(@Param("user_id") String user_id, @Param("pageNo") int pageNo, @Param("amount") int amount);
	
	public int getCartListTotal(@Param("user_id") String user_id, @Param("pageNo") int pageNo, @Param("amount") int amount);
	
	public int deleteCart(String cart_id);
	
	public int updateOrderList(OrderVO ovo);
}