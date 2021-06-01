package web.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import web.spring.service.PaymentService;
import web.spring.service.ProductService;
import web.spring.vo.OrderVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;
import web.spring.vo.UserVO;

@Controller
public class PaymentController {
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	ProductService productService;
	
	@PostMapping("/payment")
	public String payment(Model model, PBoardVO pBoard) {
		UserVO uvo = paymentService.get("user01");
		pBoard = paymentService.getProduct(pBoard.getPboard_unit_no());
		model.addAttribute("uvo", uvo);
		model.addAttribute("pBoard", pBoard);
		return "/order/payment";
	}
	
	@GetMapping("/payment")
	public String getPayment(Model model, UserVO userVO, PBoardVO pBoardVO) {
		PBoardVO pBoard = pBoardVO;
		ProductVO productVO = productService.getProductInfo(pBoardVO.getProduct_id());
		model.addAttribute("uvo", userVO);
		model.addAttribute("pBoard", pBoard);
		model.addAttribute("productVO", productVO);
		return "/order/payment";
	}
	
	@PostMapping("/productOrder")
	public String paymentAction(Model model, OrderVO ovo) {
		int res = paymentService.insertOrder(ovo);
		model.addAttribute("ovo", ovo);
		return "/order/paymentAction";
	}
	
	@GetMapping("/cart")
	public String cart(Model model) {
		OrderVO ovo = paymentService.getCart("user01");
		model.addAttribute("ovo", ovo);
		return "/order/cart";
	}
}