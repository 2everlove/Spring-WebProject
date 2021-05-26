package web.spring.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import web.spring.mapper.PaymentMapper;

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
}