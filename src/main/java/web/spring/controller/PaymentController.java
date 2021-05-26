package web.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import web.spring.service.PaymentService;
import web.spring.vo.ProductVo;
import web.spring.vo.UserVo;

@Controller
public class PaymentController {
	
	@Autowired
	PaymentService paymentService;
	
	@GetMapping("/main")
	public String main() {
		return "/main/main";
	}
	
	@GetMapping("/payment")
	public String payment(Model model) {
		UserVo vo = paymentService.get("user01");
		ProductVo pvo = paymentService.getProduct("product01");
		model.addAttribute("vo", vo);
		model.addAttribute("pvo", pvo);
		return "/order/payment";
	}
	
	@PostMapping("/paymentAction")
	public String paymentAction(Model model) {
		UserVo vo = paymentService.get("user01");
		ProductVo pvo = paymentService.getProduct("product01");
		model.addAttribute("vo", vo);
		model.addAttribute("pvo", pvo);
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