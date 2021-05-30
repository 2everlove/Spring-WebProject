package web.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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
public class MainController {
	
	@Setter(onMethod_= @Autowired)
	private ProductService productService;
	
	@Setter(onMethod_= @Autowired)
	private UserService userService;
	
	@Setter(onMethod_= @Autowired)
	private FileService fileService;
	
	@GetMapping("/main")
	public void getMain(Model model) {
		List<PBoardVO> pBoardList = productService.getMainPBoardList();
		List<ProductVO> productList = productService.getMainProductList();
		List<FileVO> fileList = fileService.getMainListFile();
		List<UserVO> userList = userService.getUserList();
		model.addAttribute("pBoardList", pBoardList);
		model.addAttribute("productList", productList);
		model.addAttribute("fileList", fileList);
		model.addAttribute("userList", userList);
		log.info("main...........");
	}
	
	@GetMapping("/myPage/myPage")
	public void getMyPage() {
		log.info("mypage.....");
	}
	
	@GetMapping("/search")
	public String getSearch(Model model, String product_search) {
		if(!product_search.equals("")) {
			List<ProductVO> pList = productService.getSearchProductList(product_search);
			List<PBoardVO> pBList = productService.getSearchBoardList(product_search);
			List<FileVO> fileList = fileService.getSearchListFile(product_search);
			model.addAttribute("pList", pList);
			model.addAttribute("pBList", pBList);
			model.addAttribute("fileList", fileList);
			model.addAttribute("searchValue", product_search);
		} else {
			model.addAttribute("error", "");
			model.addAttribute("search", product_search);
		}
		return "/product/SearchList";
	}
	
}
