package web.spring.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.service.FileService;
import web.spring.service.PaymentService;
import web.spring.service.ProductService;
import web.spring.service.UserService;
import web.spring.vo.CodeVO;
import web.spring.vo.OrderVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;
import web.spring.vo.UserVO;

@RestController
@Log4j
@RequestMapping("/admin")
public class AdminAjaxController {
	@Setter(onMethod_= @Autowired)
	private ProductService productService;
	
	@Setter(onMethod_= @Autowired)
	private UserService userService;
	
	@Setter(onMethod_= @Autowired)
	private FileService fileService;
	
	@Autowired
	private PaymentService paymentService;
	
	//productBoard update
	@PostMapping("/pBoardUpdate")
	public Map<String, Object> updateBoardList(PBoardVO pBoardVO) {
		Map<String, Object> map = new HashMap<String, Object>();
		log.info(pBoardVO);
		int res = productService.updatepBoard(pBoardVO);
		PBoardVO board = productService.getProduct(pBoardVO.getPboard_unit_no());
		map.put("result", board);
		return map;
	}
	
	//master product update
	@PostMapping("/productUpdate")
	public Map<String, Object> updateProductList(ProductVO productVO) {
		log.info(productVO);
		Map<String, Object> map = new HashMap<String, Object>();
		if(productVO.getProduct_id() != null) {
			int res = productService.updateProduct(productVO);
			ProductVO product = productService.getProductInfo(productVO.getProduct_id());
			map.put("result", product);
		} else {
			int product =  productService.productInfoInsert(productVO);
			map.put("result", product);
		}
		CodeVO code1 = productService.getCode("manufacturer",productVO.getProduct_manufacturer().toLowerCase());
		CodeVO code2 = productService.getCode("category",productVO.getProduct_category().toLowerCase());
		if(code1 == null) {
			productService.insertCode("manufacturer",productVO.getProduct_manufacturer().toLowerCase());
		} 
		if(code2 == null) {
			productService.insertCode("category",productVO.getProduct_category().toLowerCase());
		}
		return map;
	}
	
	//user update
	@PostMapping("/userUpdate")
	public Map<String, Object> updateUserList(UserVO userVO){
		Map<String, Object> map = new HashMap<String, Object>();
		if(userVO != null) {
			System.out.println(userVO);
			userVO.setUser_address(userVO.getUser_address().trim());
			int res = userService.updateUserByAdmin(userVO);
			if(res>0)
				map.put("result","success");
		} else {
			map.put("result", "fail");
		}
		return map;
	}
	
	//order upadte
	@PostMapping("/updateOrderList")
	public Map<String, Object> updateOrderList(Model model, OrderVO ovo) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(ovo != null) {
			System.out.println(ovo);
			int res = paymentService.updateOrderList(ovo);
			if(res > 0)
				map.put("result","success");
		} else {
			map.put("result", "fail");
		}
		model.addAttribute("ovo", ovo);
		return map;
	}
	
	//changed pwd , send
	@PostMapping("/sendEmail")
	public Map<String, Object> userPwdSend(Model model, UserVO user){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "fail");
		if(user!=null) {
			UserVO dbUser = userService.checkPwd(user);
			if(dbUser!=null) {
				log.info("dbUser"+dbUser);
				map.put("result", dbUser);
			}
		}
		return map;
	}

}
