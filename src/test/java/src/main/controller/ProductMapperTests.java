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
	@Autowired
	private ProductMapper productMapper;
	
	@Test
	public void getProductListTest() {
		System.out.println(productMapper.getProductList());
	}

	@Test
	public void getPBoardListTest() {
		System.out.println(productMapper.getPBoardList());
	}
	
	@Test
	public void getTypeListTest() {
		System.out.println(productMapper.getTypeList("tablet"));
	}
	@Test
	public void getTypeBoardListTest() {
		System.out.println(productMapper.getTypeBoardList("tablet"));
	}
	@Test
	public void getproductTest() {
		System.out.println(productMapper.getProduct("10"));
	}
	
	@Test
	public void insertProductTest() {
		ProductVO productVO = new ProductVO();
		productVO.setFile_pictureId("25");
		productVO.setProduct_category("3");
		productVO.setProduct_color("color");
		productVO.setProduct_manufacturer("product_manufacturer");
		productVO.setProduct_name("product_name");
		System.out.println(productMapper.productInfoInsert(productVO ));
	}
	
	@Test
	public void searchProductTest() {
		System.out.println(productMapper.searchProductCategory("category","ta"));
	}
	@Test
	public void insertCodeTest() {
		System.out.println(productMapper.insertCodeInfo("category", "computer"));
	}
	
	//main---
	
	@Test
	public void getMainPBoardList() {
		System.out.println(productMapper.getMainPBoardList());
	}
	@Test
	public void getMainProductList() {
		System.out.println(productMapper.getMainProductList());
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
		System.out.println(list);
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
		System.out.println(list);
	}
	
}