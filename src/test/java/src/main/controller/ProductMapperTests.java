package src.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.mapper.ProductMapper;
import web.spring.vo.PBoardVO;
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
	
	//main---
	
	@Test
	public void getMainPBoardList() {
		log.info(productMapper.getMainPBoardList());
	}
	@Test
	public void getMainProductList() {
		log.info(productMapper.getMainProductList());
	}

	@Test
	public void getSearchCategory() {
		String str = "samsung ipad";
		String[] strList = str.split(" ");
		
		ArrayList<String> arr = new ArrayList<String>();
		for(String item : strList) {
			System.out.println(item);
			arr.add(item);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_Map", arr);
		List<ProductVO> list = productMapper.getSearchProductList(map);
		log.info(list);
	}
	@Test
	public void getSearchBo() {
		String str = "samsung ipad";
		String[] strList = str.split(" ");
		
		ArrayList<String> arr = new ArrayList<String>();
		for(String item : strList) {
			System.out.println(item);
			arr.add(item);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_Map", arr);
		List<PBoardVO> list = productMapper.getSearchBoardList(map);
		log.info(list);
	}
	
}