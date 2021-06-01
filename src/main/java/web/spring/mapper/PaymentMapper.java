package web.spring.mapper;

import web.spring.vo.OrderVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.UserVO;

public interface PaymentMapper {
	
	public UserVO get(String User_id);
	
	public PBoardVO getProduct(String board_unit_no);
	
	public int insertOrder(OrderVO vo);
	
	public OrderVO getCart(String user_id);
}