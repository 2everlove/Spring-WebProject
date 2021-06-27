package web.spring.controller;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import web.spring.vo.UserVO;

@Controller
@Log4j
public class ProductController {
	
	@Setter(onMethod_= @Autowired)
	private ProductService productService;
	
	@Setter(onMethod_= @Autowired)
	private UserService userService;
	
	@Setter(onMethod_= @Autowired)
	private FileService fileService;
	
	public static LinkedList<String> linkedList = new LinkedList<String>();
	
	//category(tablet, computer etc)
	@GetMapping("/type/{type}")
	public String getType(@PathVariable("type") String product_category, Model model) {
		log.info("type.....");
		productService.getTypeList(product_category);
		List<ProductVO> pList = productService.getTypeList(product_category);
		List<PBoardVO> pBList = productService.getTypeBoardList(product_category);
		List<FileVO> fileList = fileService.getTypeListFile(product_category);
		List<UserVO> userList = userService.getUserList();
		log.info("pList...."+pList);
		log.info("pBList...."+pBList);
		log.info("fileList...."+fileList);
		model.addAttribute("userList", userList);
		model.addAttribute("pList", pList);
		model.addAttribute("pBList", pBList);
		model.addAttribute("fileList", fileList);
		model.addAttribute("search", product_category);
		return "/product/typeList";
	}
	
	//product detail page
	@GetMapping("/pDetail/{no}")
	public String getDetail(@PathVariable("no") String no, Model model, HttpServletResponse res, HttpServletRequest req) {
		log.info("pDetail.....");
		PBoardVO pBoard = productService.getProduct(no);
		
		if(linkedList.size()<6) {
			linkedList.addFirst(no);
			linkedList = linkedList.stream().distinct().collect(Collectors.toCollection(LinkedList::new));
		} else {
			linkedList = linkedList.stream().distinct().collect(Collectors.toCollection(LinkedList::new));
			if(linkedList.size()==6) {
				linkedList.addFirst(no);
			}
			if(linkedList.size()>6) {
				linkedList = linkedList.stream().distinct().collect(Collectors.toCollection(LinkedList::new));
				if(linkedList.size()>6) {
					linkedList.removeLast();
				}
			}
		}
		
		String tmp ="";
		for(String tmp1 : linkedList) {
			tmp+=tmp1+".";
		}
		//System.out.println(tmp);
		HttpSession session = req.getSession();
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
				if(linkedList.size()>0) {
					session.setAttribute("history_product_no", tmp);
				}
				return "/product/pDetail";
			} else {
				return "/error";
			}
		} else {
			return "/error";
		}
	}
	
	//상품 등록 처리 구현
	@PostMapping("/product/insertProductBoard")
	public String insertPBoard(PBoardVO pBoardVO) {
		log.info(pBoardVO);
		productService.inserPBoard(pBoardVO);
		return "redirect:/myPage";
	}
	
	//상품 등록 페이지
	@GetMapping("/product/productRegister")
	public void getRegister() {
		log.info("productRegister........");
	}
	
}
