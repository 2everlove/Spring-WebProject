package web.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.service.ProductService;
import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;

@Controller
@Log4j
public class MainController {
	
	@Setter(onMethod_= @Autowired)
	private ProductService productService;
	
	@GetMapping("/main")
	public void getMain() {
		log.info("main...........");
	}
	
	@GetMapping("/type/{type}")
	public String getType(@PathVariable("type") String product_category, Model model) {
		log.info("type.....");
		productService.getTypeList(product_category);
		List<ProductVO> pList = productService.getTypeList(product_category);
		List<PBoardVO> pBList = productService.getTypeBoardList(product_category);
		log.info("pBList...."+pBList);
		model.addAttribute("pList", pList);
		model.addAttribute("pBList", pBList);
		return "/product/typeList";
	}
	
	@GetMapping("/pDetail/{no}")
	public String getDetail(@PathVariable("no") String no, Model model) {
		log.info("pDetail.....");
		PBoardVO pBoard = productService.getProduct(no);
		if(pBoard != null) {
			model.addAttribute("pBoard", pBoard);
			return "/product/pDetail";
		} else {
			return "/error";
		}
	}
	
}