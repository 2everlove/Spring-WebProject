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
	
	@Autowired
	private ProductService productService;
	
	//�젣議곗궗, 移댄뀒怨좊━濡� �긽�뭹 寃��깋
	@GetMapping("/checkProduct/{product_manufacturer}/{product_category}")
	public Map<String, Object> AjaxCheckProductInfo(@PathVariable("product_manufacturer")String product_manufacturer, @PathVariable("product_category")String product_category) {
		System.out.println(product_manufacturer+"\n"+product_category);
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
	
	//�긽�뭹 �씠由꾩쑝濡� product �젣議곗궗 諛� 移댄뀒怨좊━ 寃��깋
	@GetMapping("/checkProduct/{product_name}")
	public Map<String, Object> AjaxgetProductInfo(@PathVariable("product_name")String product_name) {
		System.out.println("AjaxgetProductInfo"+product_name);
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
	
	//�긽�뭹id 濡� �젣議곗궗, 移댄뀒怨좊━ �엯�젰
	@GetMapping("/searchProductId/{product_id}")
	public Map<String, Object> AjaxsearchManuCate(@PathVariable("product_id") String product_id) {
		System.out.println("AjaxCheckProductInfo"+product_id);
		Map<String, Object> map = new HashMap<String, Object>();
		ProductVO list = productService.searchManufCategoty(product_id);
		if(list != null) {
			map.put("result", list);
		} else {
			map.put("result", "error");
		}
		return map;
	}
	
	//code_table�뿉�꽌 category 諛� �젣議곗궗 �쓽 媛� �솗�씤
	@GetMapping("/checkInsertCodeValue/{code_type}/{code_value}")
	public Map<String, Object> AjaxInsetCodeInfo(@PathVariable("code_type")String code_type, @PathVariable("code_value")String code_value) {
		System.out.println(code_type+"\n"+code_value);
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
