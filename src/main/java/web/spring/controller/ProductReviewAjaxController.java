package web.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;
import web.spring.service.ProductReviewService;
import web.spring.vo.ProductReviewVO;

@RestController
@Log4j
public class ProductReviewAjaxController {

	@Autowired
	private ProductReviewService service;

	@GetMapping("/product/reviewproduct/{pboard_unit_no}")
	public Map<String, Object> getProductReviewList(@PathVariable("pboard_unit_no") String pboard_unit_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		log.info("pboard_unit_no" + pboard_unit_no);
		List<ProductReviewVO> productReviewList = service.getProductReviewList(Integer.parseInt(pboard_unit_no));
		int replycount = service.countProductReply(Integer.parseInt(pboard_unit_no));

		if (productReviewList != null) {
			map.put("list", productReviewList);
			map.put("replycount", replycount);
		}
		
		

		log.info(productReviewList);
		return map;
	}

	@PostMapping("/product/reviewproduct/insertProductReview")
	public Map<String, Object> insertProductReview(@RequestBody ProductReviewVO vo) {
		int res = service.insertProductReviewList(vo);

		Map<String, Object> map = new HashMap<String, Object>();

		if (res > 0)
			map.put("result", "success");
		else
			map.put("result", "fail");

		return map;
	}

	@GetMapping("/product/reviewproduct/delete/{review_num}")
	public Map<String, String> deleteProductReview(@PathVariable("review_num") int review_num) {

		int res = service.deleteProductReviewList(review_num);

		Map<String, String> map = new HashMap<String, String>();

		if (res > 0)
			map.put("result", "success");

		else
			map.put("result", "fail");

		return map;
	}

}
