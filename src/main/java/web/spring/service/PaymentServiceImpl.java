package web.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.mapper.PaymentMapper;
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
	public PBoardVO getProduct(String pboard_unit_no) {
		return mapper.getProduct(pboard_unit_no);
	}

	@Override
	public int insertOrder(OrderVO ovo) {
		return mapper.insertOrder(ovo);
	}

	@Override
	public OrderVO getCart(String user_id) {
		return mapper.getCart(user_id);
	}

}