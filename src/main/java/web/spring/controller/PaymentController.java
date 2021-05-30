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
	
	@PostMapping("/productOrder")
	public String paymentAction(Model model, OrderVO ovo) {
		int res = paymentService.insertOrder(ovo);
		model.addAttribute("ovo", ovo);
		return "/order/paymentAction";
	}
	
	@GetMapping("/cart")
	public String cart() {
		return "/order/cart";
	}
	
	@GetMapping("/myPage")
	public String myPage() {
		return "/order/myPage";
	}
}