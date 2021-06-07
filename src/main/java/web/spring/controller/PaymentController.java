package web.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.spring.service.PaymentService;
import web.spring.service.ProductService;
import web.spring.service.UserService;
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
	
	@Autowired
	UserService userService;
	
	@GetMapping("/payment")
	public String getPayment(Model model, UserVO userVO, CartVO cvo, PBoardVO pBoardVO, HttpServletRequest rq) {
		PBoardVO pBoard = pBoardVO;
		HttpSession session = rq.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		userVO = paymentService.get(user.getUser_id());
		ProductVO productVO = productService.getProductInfo(pBoardVO.getProduct_id());
		model.addAttribute("uvo", userVO);
		model.addAttribute("pBoard", pBoard);
		model.addAttribute("productVO", productVO);
		model.addAttribute("cvo", cvo);
		System.out.println(cvo.getCart_totalcount());
		return "/order/payment";
	}
	
	@PostMapping("/productOrder")
	public String paymentAction(Model model, OrderVO ovo, CartVO cvo) {
		int res = paymentService.insertOrder(ovo);
		model.addAttribute("ovo", ovo);
		return "redirect:/orderList";
	}
	
	@GetMapping("/cart")
	public String cart(Model model, UserVO userVO, CartVO cvo, PBoardVO pBoardVO) {
		PBoardVO pBoard = pBoardVO;
		userVO = userService.getUser(userVO.getUser_id());
		ProductVO productVO = productService.getProductInfo(pBoardVO.getProduct_id());
		model.addAttribute("uvo", userVO);
		model.addAttribute("pBoard", pBoard);
		model.addAttribute("productVO", productVO);
		return "/order/cart";
	}
	
	@PostMapping("/cartAction")
	public String cartAction(Model model, CartVO cvo) {
		int res = paymentService.insertCart(cvo);
		model.addAttribute("cvo", cvo);
		return "redirect:/cartList";
	}
	
	@GetMapping("/cartList")
	public String insertCart(Model model, HttpServletRequest rq) {
		HttpSession session = rq.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		System.out.println("=================user"+user);
		List<CartVO> list = paymentService.getCartList(user.getUser_id());
		model.addAttribute("list", list);
		return "/order/cartList";
	}
	
	@GetMapping("/deleteCart")
	public String deleteCart(Model model, CartVO cvo, HttpServletRequest rq) {
		HttpSession session = rq.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		int res = paymentService.deleteCart(cvo.getCart_id());
		model.addAttribute("cvo", cvo);
		return "redirect:/cartList";
	}
	
	@PostMapping("/delete")
	public String delete(HttpServletRequest rq) {
		
		String[] msg = rq.getParameterValues("valueArr");
		int size = msg.length;
		for(int i=0; i<size; i++) {
			int res = paymentService.deleteCart(msg[i]);
			System.out.println("===============res"+res);
			System.out.println("============msg[i]"+msg[i]);
		}
		System.out.println("=============msg"+msg);
		return "redirect:/cartList";
	}
	
	@GetMapping("/orderList")
	public String orderList(Model model, HttpServletRequest rq, OrderVO ovo) {
		HttpSession session = rq.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		List<OrderVO> list = paymentService.getOrderList(user.getUser_id());
		model.addAttribute("list", list);
		return "/order/orderList";
	}
	
	@GetMapping("/orderStatus")
	public String orderStatus(Model model, HttpServletRequest rq, OrderVO ovo) {
		HttpSession session = rq.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		session.setAttribute("ovo", paymentService.getOrderStatus(ovo.getOrder_id()));
		model.addAttribute("ovo", paymentService.getOrderStatus(ovo.getOrder_id()));
		System.out.println("==================="+ovo.getOrder_id());
		return "/order/orderStatus";
	}
	
	@GetMapping("/orderAllList")
	public String orderAllList(Model model, HttpServletRequest rq, OrderVO ovo) {
		HttpSession session = rq.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		List<OrderVO> list = paymentService.getOrderAllList(ovo);
		model.addAttribute("list", list);
		return "/order/orderAllList";
	}
	
	@GetMapping("/updateOrderList")
	public String updateOrderList(Model model, OrderVO ovo, @RequestParam("order_status") String order_status,
															@RequestParam("order_id") String order_id) {
		int res = paymentService.updateOrderList(ovo);
		System.out.println("======================주문상태:"+ovo.getOrder_status());
		model.addAttribute("ovo", ovo);
		return "redirect:/orderAllList";
	}
}