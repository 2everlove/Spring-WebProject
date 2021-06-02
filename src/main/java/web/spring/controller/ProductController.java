package web.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.service.FileService;
import web.spring.service.ProductService;
import web.spring.service.UserService;
import web.spring.vo.FileVO;
import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;

@Controller
@Log4j
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private FileService fileService;
	
	//category(tablet, computer etc)
	@GetMapping("/type/{type}")
	public String getType(@PathVariable("type") String product_category, Model model) {
		System.out.println("type.....");
		productService.getTypeList(product_category);
		List<ProductVO> pList = productService.getTypeList(product_category);
		List<PBoardVO> pBList = productService.getTypeBoardList(product_category);
		List<FileVO> fileList = fileService.getTypeListFile(product_category);
		System.out.println("pList...."+pList);
		System.out.println("pBList...."+pBList);
		System.out.println("fileList...."+fileList);
		model.addAttribute("pList", pList);
		model.addAttribute("pBList", pBList);
		model.addAttribute("fileList", fileList);
		model.addAttribute("search", product_category);
		return "/product/typeList";
	}
	
	//product detail page
	@GetMapping("/pDetail/{no}")
	public String getDetail(@PathVariable("no") String no, Model model) {
		System.out.println("pDetail.....");
		PBoardVO pBoard = productService.getProduct(no);
		if(pBoard !=null) {
			ProductVO productVO = productService.getProductInfo(pBoard.getProduct_id());
			List<FileVO> fileThumList = fileService.getPDetailThum(pBoard.getPboard_unit_no());
			List<FileVO> fileDescList = fileService.getPDetailDesc(pBoard.getPboard_unit_no());
			if(productVO != null) {
				model.addAttribute("pBoard", pBoard);
				model.addAttribute("productVO", productVO);
				model.addAttribute("sellerVO", userService.getUser(pBoard.getUser_id()));
				model.addAttribute("fileThumList", fileThumList);
				model.addAttribute("fileDescList", fileDescList);
				return "/product/pDetail";
			} else {
				return "/error";
			}
		} else {
			return "/error";
		}
	}
	
	//�긽�뭹 �벑濡� 泥섎━ 援ы쁽
	@PostMapping("/product/insertProductBoard")
	public String insertPBoard(PBoardVO pBoardVO) {
		System.out.println(pBoardVO);
		productService.inserPBoard(pBoardVO);
		return "redirect:../myPage/myPage";
	}
	
	//�긽�뭹 �벑濡� �럹�씠吏�
	@GetMapping("/product/productRegister")
	public void getRegister() {
		System.out.println("productRegister........");
	}
	
}
