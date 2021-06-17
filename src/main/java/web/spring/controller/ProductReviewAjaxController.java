package web.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;
import web.spring.service.ProductReviewService;
import web.spring.vo.ProductReviewVO;

@Controller
@Log4j
public class ProductReviewAjaxController {
	
	@Autowired
	private ProductReviewService service;
	
	@GetMapping("/product/reviewproduct")
	public void getProductReviewList(Model model){
		
		List<ProductReviewVO> productReviewList = service.getProductReviewList();
		
		if (productReviewList != null) {
			model.addAttribute("productReviewList", productReviewList);
		}
		
		log.info(productReviewList);
		
		
	}

	
	
}
