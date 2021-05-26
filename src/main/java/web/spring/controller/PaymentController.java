package web.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PaymentController {
	
	@GetMapping("/main")
	public String main() {
		return "/main/main";
	}
	
	@GetMapping("/payment")
	public String payment() {
		return "/order/payment";
	}
	
	@PostMapping("/paymentAction")
	public String paymentAction() {
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