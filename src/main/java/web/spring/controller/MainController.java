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
	
	@GetMapping("/myPage")
	public String getMyPage() {
		log.info("mypage.....");
		return "/myPage/myPage";
	}
	
	@GetMapping("/search")
	public String getSearch(Model model, String product_search) {
		String tmp = product_search; //대문자 검색 내용 넘겨주기
		product_search = product_search.toLowerCase().trim(); //소문자로 변환& 앞뒤 공백 제거
		if(!product_search.equals("")) {
			List<ProductVO> pList = productService.getSearchProductList(product_search);
			List<PBoardVO> pBList = productService.getSearchBoardList(product_search);
			List<FileVO> fileList = fileService.getSearchListFile(product_search);
			model.addAttribute("pList", pList);
			model.addAttribute("pBList", pBList);
			model.addAttribute("fileList", fileList);
			model.addAttribute("search", tmp);
		} else {
			model.addAttribute("error", "");
			model.addAttribute("search", tmp);
		}
		return "/product/typeList";
	}
	
	@GetMapping("/cond/{pboard_unit_condition}")
	public String getType(@PathVariable("pboard_unit_condition") String pboard_unit_condition, Model model) {
		log.info("type.....");
		productService.getTypeList(pboard_unit_condition);
		List<ProductVO> pList = productService.getCondList(pboard_unit_condition);
		List<PBoardVO> pBList = productService.getCondBoardList(pboard_unit_condition);
		List<FileVO> fileList = fileService.getCondListFile(pboard_unit_condition);
		log.info("pList...."+pList);
		log.info("pBList...."+pBList);
		log.info("fileList...."+fileList);
		model.addAttribute("pList", pList);
		model.addAttribute("pBList", pBList);
		model.addAttribute("fileList", fileList);
		if(pboard_unit_condition.equals("0")) {
			model.addAttribute("search", "New");
		} else if (pboard_unit_condition.equals("1")) {
			model.addAttribute("search", "Sale");
		} else if (pboard_unit_condition.equals("2")) {
			model.addAttribute("search", "event");
		}
		return "/product/typeList";
	}
	
}
