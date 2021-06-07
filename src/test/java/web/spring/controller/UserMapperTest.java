package web.spring.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import web.spring.mapper.PaymentMapper;
import web.spring.service.PaymentService;
import web.spring.vo.OrderVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTest {
	
	@Autowired
	PaymentMapper mapper;
	
	@Autowired
	PaymentService service;
	
	@Test
	public void getOrderStatus() {
		System.out.println(mapper.getOrderStatus("10"));
	}
	
	@Test
	public void getPayment() {
		OrderVO vo = new OrderVO();
		vo.setOrder_address("占쏙옙占쏙옙占� 占쏙옙占싸깍옙");
		vo.setOrder_name("홍占썸동");
		vo.setUser_id("2");
		vo.setOrder_totalprice("40000");
		vo.setOrder_totalcount("1");
		System.out.println(mapper.insertOrder(vo));
	}
	
	@Test
	public void getTest() {
		System.out.println(mapper.get("user01"));
	}
	
	@Test
	public void getProductTest() {
		System.out.println(mapper.getProduct("product01"));
	}
	
	@Test
	public void updateOrderList() {
		OrderVO ovo = new OrderVO();
		ovo.setOrder_id("10");
		ovo.setOrder_status("2");
		mapper.updateOrderList(ovo);
	}
	
	@Test
	public void updateOrderList2() {
		OrderVO ovo = new OrderVO();
		ovo.setOrder_id("12");
		ovo.setOrder_status("2");
		service.updateOrderList(ovo);
	}
	
	/*
	 * @Test public void insertOrderTest() { OrderVO vo = new OrderVO();
	 * 
	 * vo.setOrder_address("test"); vo.setOrder_name("test");
	 * vo.setUser_id("user01"); vo.setOrder_totalprice("120000");
	 * vo.setOrder_totalcount("3");
	 * 
	 * System.out.println(mapper.insertOrder(vo)); }
	 */
}