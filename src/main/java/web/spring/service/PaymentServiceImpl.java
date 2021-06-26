package web.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.mapper.PaymentMapper;
import web.spring.vo.CartVO;
import web.spring.vo.Criteria;
import web.spring.vo.OrderVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.UserVO;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentMapper mapper;
	
	@Override
	public UserVO get(String User_id) {
		return mapper.get(User_id);
	}

	@Override
	public int insertOrder(OrderVO ovo) {
		return mapper.insertOrder(ovo);
	}

	@Override
	public int insertCart(CartVO cvo) {
		return mapper.insertCart(cvo);
	}

	@Override
	public List<CartVO> getCartList(String user_id, Criteria cri) {
		return mapper.getCartList(user_id, cri.getPageNo(), cri.getAmount());
	}

	@Override
	public int deleteCart(String cart_id) {
		return mapper.deleteCart(cart_id);
	}

	@Override
	public List<OrderVO> getOrderList(String user_id, Criteria cri) {
		return mapper.getOrderList(user_id, cri.getPageNo(), cri.getAmount());
	}

	@Override
	public OrderVO getOrderStatus(String order_id) {
		return mapper.getOrderStatus(order_id);
	}

	@Override
	public List<OrderVO> getOrderAllList(Criteria cri) {
		return mapper.getOrderAllList(cri);
	}

	@Override
	public int updateOrderList(OrderVO ovo) {
		return mapper.updateOrderList(ovo);
	}

	@Override
	public int updateStocks(PBoardVO pvo) {
		return mapper.updateStocks(pvo);
	}

	@Override
	public int getOrderListTotal(String user_id, Criteria cri) {
		return mapper.getOrderListTotal(user_id, cri.getPageNo(), cri.getAmount());
	}

	@Override
	public int getOrderAllListTotal(Criteria cri) {
		return mapper.getOrderAllListTotal(cri);
	}

	@Override
	public int getCartListTotal(String user_id, Criteria cri) {
		return mapper.getCartListTotal(user_id, cri.getPageNo(), cri.getAmount());
	}

	@Override
	public PBoardVO getProduct(String pboard_unit_no) {
		return mapper.getProduct(pboard_unit_no);
	}

	@Override
	public List<OrderVO> getOrderComList(String pboard_user_id, Criteria cri) {
		return mapper.getOrderComList(pboard_user_id, cri.getPageNo(), cri.getAmount());
	}

	@Override
	public int getOrderComListTotal(String pboard_user_id, Criteria cri) {
		return mapper.getOrderComListTotal(pboard_user_id, cri.getPageNo(), cri.getAmount());
	}

}