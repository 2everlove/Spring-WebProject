package web.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/product")
@Log4j
public class ProductController {
	
	@GetMapping("/productList")
	public void getProductList() {
		log.info("productList...........");
	}
}
