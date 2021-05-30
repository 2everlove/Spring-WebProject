package web.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.service.FileService;
import web.spring.service.ProductService;
import web.spring.service.UserService;
import web.spring.vo.FileVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;

@Controller
@Log4j
public class ProductController {
	
	@Setter(onMethod_= @Autowired)
	private ProductService productService;
	
	@Setter(onMethod_= @Autowired)
	private UserService userService;
	
	@Setter(onMethod_= @Autowired)
	private FileService fileService;
	
	@GetMapping("/type/{type}")
	public String getType(@PathVariable("type") String product_category, Model model) {
		log.info("type.....");
		productService.getTypeList(product_category);
		List<ProductVO> pList = productService.getTypeList(product_category);
		List<PBoardVO> pBList = productService.getTypeBoardList(product_category);
		log.info("pBList...."+pBList);
		model.addAttribute("pList", pList);
		model.addAttribute("pBList", pBList);
		model.addAttribute("search", product_category);
		return "/product/typeList";
	}
	
	@GetMapping("/pDetail/{no}")
	public String pDetail(@PathVariable("no") String no, Model model) {
		PBoardVO pBoard = productService.getProduct(no);
		if(pBoard !=null) {
			ProductVO productVO = productService.getProductInfo(pBoard.getProduct_id());
			if(productVO != null) {
				model.addAttribute("pBoard", pBoard);
				model.addAttribute("productVO", productVO);
				return "/product/pDetail";
			} else {
				return "/error";
			}
		} else {
			return "/error";
		}
	}
	
	@GetMapping("/product/productRegister")
	public void getRegister() {
		log.info("productRegister........");
	}
	
}