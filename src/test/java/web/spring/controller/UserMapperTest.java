package web.spring.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import web.spring.mapper.PaymentMapper;
import web.spring.vo.OrderVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTest {
	
	@Autowired
	PaymentMapper mapper;
	
	@Test
	public void getTest() {
		System.out.println(mapper.get("user01"));
	}
	
	@Test
	public void getProductTest() {
		System.out.println(mapper.getProduct("product01"));
	}
	
	@Test
	public void insertOrderTest() {
		OrderVo vo = new OrderVo();
		
		vo.setOrder_address("test");
		vo.setOrder_name("test");
		vo.setUser_id("user01");
		vo.setOrder_totalprice("40000");
		vo.setOrder_totalcount("3");
		
		System.out.println(mapper.insertOrder(vo));
	}
}