package web.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import web.spring.service.PaymentService;
import web.spring.service.ProductService;
import web.spring.vo.CartVO;
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
	
	@GetMapping("/payment")
	public String getPayment(Model model, UserVO userVO, PBoardVO pBoardVO) {
		PBoardVO pBoard = pBoardVO;
		userVO = paymentService.get(userVO.getUser_id());
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
	
	@GetMapping("/cartAction")
	public String cartAction(Model model, UserVO userVO, PBoardVO pBoardVO) {
		PBoardVO pBoard = pBoardVO;
		userVO = paymentService.get(userVO.getUser_id());
		ProductVO productVO = productService.getProductInfo(pBoardVO.getProduct_id());
		model.addAttribute("uvo", userVO);
		model.addAttribute("pBoard", pBoard);
		model.addAttribute("productVO", productVO);
		return "/order/cartAction";
	}
	
	@PostMapping("/insertCart")
	public String insertCart(Model model, CartVO cvo) {
		int res = paymentService.insertCart(cvo);
		model.addAttribute("cvo", cvo);
		return "/order/insertCart";
	}
}