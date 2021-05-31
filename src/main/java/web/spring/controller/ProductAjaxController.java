package web.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.service.ProductService;
import web.spring.vo.ProductVO;

@RestController
@Log4j
public class ProductAjaxController {
	
	@Setter(onMethod_= @Autowired)
	private ProductService productService;
	
	//제조사, 카테고리로 상품 검색
	@GetMapping("/checkProduct/{product_manufacturer}/{product_category}")
	public Map<String, Object> AjaxCheckProductInfo(@PathVariable("product_manufacturer")String product_manufacturer, @PathVariable("product_category")String product_category) {
		log.info(product_manufacturer+"\n"+product_category);
		Map<String, Object> map = new HashMap<String, Object>();
		List<ProductVO> list = productService.searchManuCate(product_manufacturer, product_category);
		if(list != null) {
			if(list.size()>0) {
				map.put("result", list);
			} else {
				map.put("result", "error");
			}
		} else {
			map.put("result", "error");
		}
		return map;
	}
	
	//상품 이름으로 product 제조사 및 카테고리 검색
	@GetMapping("/checkProduct/{product_name}")
	public Map<String, Object> AjaxgetProductInfo(@PathVariable("product_name")String product_name) {
		log.info("AjaxgetProductInfo"+product_name);
		Map<String, Object> map = new HashMap<String, Object>();
		List<ProductVO> list = productService.searchProductManuCate(product_name);
		if(list != null) {
			if(list.size()>0) {
				map.put("result", list);
			} else {
				map.put("result", "error");
			}
		} else {
			map.put("result", "error");
		}
		return map;
	}
	
	//상품id 로 제조사, 카테고리 입력
	@GetMapping("/searchProductId/{product_id}")
	public Map<String, Object> AjaxsearchManuCate(@PathVariable("product_id") String product_id) {
		log.info("AjaxCheckProductInfo"+product_id);
		Map<String, Object> map = new HashMap<String, Object>();
		ProductVO list = productService.searchManufCategoty(product_id);
		if(list != null) {
			map.put("result", list);
		} else {
			map.put("result", "error");
		}
		return map;
	}
	
	//code_table에서 category 및 제조사 의 값 확인
	@GetMapping("/checkInsertCodeValue/{code_type}/{code_value}")
	public Map<String, Object> AjaxInsetCodeInfo(@PathVariable("code_type")String code_type, @PathVariable("code_value")String code_value) {
		log.info(code_type+"\n"+code_value);
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = productService.searchProductCategory(code_type, code_value);
		if(list != null) {
			if(list.size()>0) {
				map.put("result", list);
			} else {
				map.put("result", "error");
			}
		} else {
			map.put("result", "error");
		}
		return map;
	}
	
}
