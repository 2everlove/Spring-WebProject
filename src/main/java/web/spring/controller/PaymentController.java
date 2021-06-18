package web.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.spring.service.PaymentService;
import web.spring.service.ProductService;
import web.spring.service.UserService;
import web.spring.vo.CartVO;
import web.spring.vo.Criteria;
import web.spring.vo.OrderVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.PageNavi;
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
		if(user != null) {
			userVO = paymentService.get(user.getUser_id());
			ProductVO productVO = productService.getProductInfo(pBoardVO.getProduct_id());
			model.addAttribute("uvo", userVO);
			model.addAttribute("pBoard", pBoard);
			model.addAttribute("productVO", productVO);
			model.addAttribute("cvo", cvo);
			System.out.println(cvo.getCart_totalcount());
			return "/order/payment";
		}
		return "/member/login";
	}
	
	@PostMapping("/productOrder")
	public String paymentAction(Model model, OrderVO ovo, CartVO cvo, PBoardVO pvo) {
		int res = paymentService.insertOrder(ovo);
		int res2 = paymentService.updateStocks(pvo);
		System.out.println("pvo===========" + pvo);
		System.out.println("res2===============" + res2);
		model.addAttribute("ovo", ovo);
		model.addAttribute("pvo", pvo);
		return "redirect:/orderList";
	}
	
	@GetMapping("/cart")
	public String cart(Model model, UserVO userVO, CartVO cvo, PBoardVO pBoardVO, HttpServletRequest rq) {
		PBoardVO pBoard = pBoardVO;
		HttpSession session = rq.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		if(user != null) {
			userVO = paymentService.get(user.getUser_id());
			ProductVO productVO = productService.getProductInfo(pBoardVO.getProduct_id());
			model.addAttribute("uvo", userVO);
			model.addAttribute("pBoard", pBoard);
			model.addAttribute("productVO", productVO);
			return "/order/cart";
		}
		return "/member/login";
	}
	
	@PostMapping("/cartAction")
	public String cartAction(Model model, CartVO cvo, PBoardVO pBoard) {
		int res = paymentService.insertCart(cvo);
		model.addAttribute("cvo", cvo);
		model.addAttribute("pBoard", pBoard);
		return "redirect:/cartList";
	}
	
	@GetMapping("/cartList")
	public String insertCart(Model model, HttpServletRequest rq, PBoardVO pBoard, Criteria cri) {
		HttpSession session = rq.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		System.out.println("=================user"+user);
		if(user != null) {
			List<CartVO> list = paymentService.getCartList(user.getUser_id(), cri);
			model.addAttribute("list", list);
			model.addAttribute("pBoard", pBoard);
			model.addAttribute("pageNavi",new PageNavi(cri, paymentService.getCartListTotal(user.getUser_id(), cri)));
			System.out.println("pBoard================" + pBoard);
			return "/order/cartList";
		}
		return "/member/login";
	}
	
	@GetMapping("/deleteCart")
	public String deleteCart(Model model, CartVO cvo, HttpServletRequest rq) {
		HttpSession session = rq.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		if(cvo.getCart_id() != null) {
			int res = paymentService.deleteCart(cvo.getCart_id());
			model.addAttribute("cvo", cvo);
			return "/orderList";
		}
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
	public String orderList(Model model, HttpServletRequest rq, OrderVO ovo, Criteria cri) {
		HttpSession session = rq.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		if(user != null) {
			List<OrderVO> list = paymentService.getOrderList(user.getUser_id(), cri);
			model.addAttribute("list", list);
			model.addAttribute("pageNavi",new PageNavi(cri, paymentService.getOrderListTotal(user.getUser_id(), cri)));
			return "/order/orderList";
		}
		return "/member/login";
	}
	
	@GetMapping("/orderStatus")
	public String orderStatus(Model model, HttpServletRequest rq, OrderVO ovo) {
		HttpSession session = rq.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		if(user != null) {
			session.setAttribute("ovo", paymentService.getOrderStatus(ovo.getOrder_id()));
			model.addAttribute("ovo", paymentService.getOrderStatus(ovo.getOrder_id()));
			System.out.println("==================="+ovo.getOrder_id());
			return "/order/orderStatus";
		}
		return "/member/login";
	}
	
	
	
}