package src.main.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.mapper.ProductMapper;
import web.spring.vo.ProductVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTests {
	@Setter(onMethod_= @Autowired)
	private ProductMapper productMapper;
	
	@Test
	public void getProductListTest() {
		log.info(productMapper.getProductList());
	}

	@Test
	public void getPBoardListTest() {
		log.info(productMapper.getPBoardList());
	}
	
	@Test
	public void getTypeListTest() {
		log.info(productMapper.getTypeList("tablet"));
	}
	@Test
	public void getTypeBoardListTest() {
		log.info(productMapper.getTypeBoardList("tablet"));
	}
	@Test
	public void getproductTest() {
		log.info(productMapper.getProduct("10"));
	}
	
	@Test
	public void insertProductTest() {
		ProductVO productVO = new ProductVO();
		productVO.setFile_pictureId("25");
		productVO.setProduct_category("3");
		productVO.setProduct_color("color");
		productVO.setProduct_manufacturer("product_manufacturer");
		productVO.setProduct_name("product_name");
		log.info(productMapper.productInfoInsert(productVO ));
	}
	
	@Test
	public void searchProductTest() {
		log.info(productMapper.searchProductCategory("category","ta"));
	}
	@Test
	public void insertCodeTest() {
		log.info(productMapper.insertCodeInfo("category", "computer"));
	}
}