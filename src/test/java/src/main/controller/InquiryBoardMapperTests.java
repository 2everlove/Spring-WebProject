package src.main.controller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.mapper.InquiryBoardMapper;
import web.spring.vo.InquiryBoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InquiryBoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private InquiryBoardMapper mapper;
	
	@Test
	public void getInquiryBoardList() {
		List<InquiryBoardVO> list = mapper.getInquiryBoardList();
		log.info(list);
		
	}

}
