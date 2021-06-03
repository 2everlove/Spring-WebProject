package web.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import web.spring.vo.FileVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.PageNavi;
import web.spring.vo.ProductVO;
import web.spring.vo.UserVO;

@Controller
@Log4j
public class AdminController {
	@Setter(onMethod_= @Autowired)
	private ProductService productService;
	
	@Setter(onMethod_= @Autowired)
	private UserService userService;
	
	@Setter(onMethod_= @Autowired)
	private FileService fileService;
	
	//상품관리
	@GetMapping("/admin/productControl")
	public String getProductList(Criteria cri, Model model) {
		List<ProductVO> productList = productService.getProductList(cri);
		
		List<ProductVO> productarr = productService.getProductAllList();
		ArrayList<String> product_list = new ArrayList<String>();
		Map<String, Object> product_Map = new HashMap<String, Object>();
		(productarr).forEach(a->product_list.add(a.getFile_pictureId()));
		/*
		 * for(String a : product_list) { System.out.println(a); }
		 */
		product_Map.put("product_Map", product_list);
		List<FileVO> fileList = fileService.getListFileAdmin(product_Map);
		model.addAttribute("fileList", fileList);
		log.info(fileList);
		model.addAttribute("productList", productList);
		model.addAttribute("pageNavi",new PageNavi(cri,productService.getProductTotal(cri)));
		return "/admin/productManage";
	}
	
	//상품 관리글 관리
	@GetMapping("/admin/pBoardControl")
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
	
	//상품 관리글 관리
	@GetMapping("/product/pBoardUpdate")
	public String getUserPBoardList(Criteria cri, Model model) {
		List<UserVO> userList = userService.getUserList();
		List<ProductVO> productList = productService.getProductAllList();
		List<PBoardVO> PBoardList = productService.getAllPBoardList(cri);
		model.addAttribute("PBoardList", PBoardList);
		model.addAttribute("productList", productList);
		model.addAttribute("userList", userList);
		model.addAttribute("pageNavi",new PageNavi(cri,productService.getTotal(cri)));
		return "/admin/pBoardUpdate";
	}
}
