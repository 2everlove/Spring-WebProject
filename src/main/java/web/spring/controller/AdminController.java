package web.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.service.FileService;
import web.spring.service.ProductService;
import web.spring.service.UserService;
import web.spring.vo.Criteria;
import web.spring.vo.PBoardVO;
import web.spring.vo.PageNavi;
import web.spring.vo.ProductVO;
import web.spring.vo.UserVO;

@Controller
@Log4j
@RequestMapping("/admin")
public class AdminController {
	@Setter(onMethod_= @Autowired)
	private ProductService productService;
	
	@Setter(onMethod_= @Autowired)
	private UserService userService;
	
	@Setter(onMethod_= @Autowired)
	private FileService fileService;
	
	//상품관리
	@GetMapping("/productControl")
	public String getProductList(Criteria cri, Model model) {
		List<ProductVO> productList = productService.getProductList(cri);
		model.addAttribute("productList", productList);
		model.addAttribute("pageNavi",new PageNavi(cri,productService.getProductTotal(cri)));
		return "/admin/productManage";
	}
	
	//상품 관리글 관리
	@GetMapping("/pBoardControl")
	public String getPBoardList(Criteria cri, Model model) {
		List<UserVO> userList = userService.getUserList();
		List<ProductVO> productList = productService.getProductAllList();
		List<PBoardVO> PBoardList = productService.getAllPBoardList(cri);
		model.addAttribute("PBoardList", PBoardList);
		model.addAttribute("productList", productList);
		model.addAttribute("userList", userList);
		model.addAttribute("pageNavi",new PageNavi(cri,productService.getTotal(cri)));
		return "/admin/pBoardManage";
	}
}
