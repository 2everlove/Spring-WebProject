package web.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.service.InquiryReplyService;
import web.spring.service.ProductReviewService;
import web.spring.service.ProductService;
import web.spring.vo.InquiryReplyVO;
import web.spring.vo.ProductReviewVO;
import web.spring.vo.ProductVO;

@RestController
@Log4j
public class ProductReviewAjaxController {
	
	@Setter(onMethod_= @Autowired)
	private ProductReviewService Service;
	
	@PostMapping("/product/product_review")
	public Map<String, Object> insertProductReview(@RequestBody ProductReviewVO vo){
		
		int res = Service.insertProductReview(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(res>0)
			map.put("result", "success");
		else
			map.put("result", "fail");
		
		return map;
	}

	
	
}
