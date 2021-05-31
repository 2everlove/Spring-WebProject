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

@RestController
@Log4j
public class ProductAjaxController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/checkProduct/{code_type}/{code_value}")
	public Map<String, Object> AjaxCheckProductInfo(@PathVariable("code_type")String code_type, @PathVariable("code_value")String code_value) {
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
