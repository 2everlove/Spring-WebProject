package web.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.service.ProductService;
import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;

@Controller
@RequestMapping("/product")
@Log4j
public class ProductController {
	
	@Setter(onMethod_= @Autowired)
	private ProductService productService;
	
	@GetMapping("/productList")
	public void getProductList(Model model) {
		log.info("productList...........");
		List<ProductVO> pList = productService.getProductList();
		List<PBoardVO> pBList = productService.getPBoardList();
		log.info("pBList...."+pBList);
		model.addAttribute("pList", pList);
		model.addAttribute("pBList", pBList);
	}
}