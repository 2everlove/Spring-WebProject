package web.spring.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import web.spring.vo.NBoardVO;
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
	
	//main
	@GetMapping("/main")
	public void getMain(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		List<PBoardVO> pBoardList = productService.getMainPBoardList();
		List<ProductVO> productList = productService.getMainProductList();
		List<FileVO> fileList = fileService.getMainListFile();
		List<UserVO> userList = userService.getUserList();
		
		if(pBoardList != null)
			model.addAttribute("pBoardList", pBoardList);
		if(productList!=null)
			model.addAttribute("productList", productList);
		if(fileList!=null)
			model.addAttribute("fileList", fileList);
		if(userList!=null)
			model.addAttribute("userList", userList);
		if(user!=null) {
			if(user.getUser_interesting()!="") {
				Map<String, Object> interest_Map = new HashMap<String, Object>();
				String[] interestArr = user.getUser_interesting().split("\\,");
				ArrayList<String> interestList = new ArrayList<String>();
				for(String keyWord : interestArr) {
					interestList.add(keyWord);
				}
				interest_Map.put("interest_Map", interestList);
				List<ProductVO> recommendList = productService.getMainRecommendList(interest_Map);
				log.info("recommendList"+recommendList);
				model.addAttribute("recommendList",recommendList);
			}
		}
		log.info("main...........");
	}
	
	//mypage
	@GetMapping("/myPage")
	public String getMyPage() {
		log.info("mypage.....");
		return "/myPage/myPage";
	}
	
	@GetMapping("/popup")
	public String getPopup(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		NBoardVO vo = (NBoardVO)session.getAttribute("noticeFlag");
		model.addAttribute("vo", vo);
		return "/includes/popup";
	}
	
	/*
	 * @GetMapping("/search") public String getSearch(Model model, String
	 * product_search) { String tmp = product_search; //대문자 검색 내용 넘겨주기
	 * product_search = product_search.toLowerCase().trim(); //소문자로 변환& 앞뒤 공백 제거
	 * if(!product_search.equals("")) { List<ProductVO> pList =
	 * productService.getSearchProductList(product_search); List<PBoardVO> pBList =
	 * productService.getSearchBoardList(product_search); List<FileVO> fileList =
	 * fileService.getSearchListFile(product_search); model.addAttribute("pList",
	 * pList); model.addAttribute("pBList", pBList); model.addAttribute("fileList",
	 * fileList); model.addAttribute("search", tmp); } else {
	 * model.addAttribute("error", ""); model.addAttribute("search", tmp); } return
	 * "/product/typeList"; }
	 */
	
	//search
	@GetMapping("/search")
	public String getSearchNew(Model model, String product_search) {
		String tmp = product_search; //대문자 검색 내용 넘겨주기
		product_search = product_search.toLowerCase().trim(); //소문자로 변환& 앞뒤 공백 제거
		String[] search_array = product_search.split(" ");
		ArrayList<String> search_list = new ArrayList<String>();
		for(String keyWord : search_array) {
			search_list.add(keyWord);
		}
		Map<String, Object> search_Map = new HashMap<String, Object>();
		search_Map.put("search_Map", search_list);
		List<ProductVO> pList = productService.getSearchProductList(search_Map);
		List<PBoardVO> pBList = productService.getSearchBoardList(search_Map);
		List<FileVO> fileList = fileService.getSearchListFile(search_Map);
		List<UserVO> userList = userService.getUserList();
		model.addAttribute("pList", pList);
		model.addAttribute("pBList", pBList);
		model.addAttribute("fileList", fileList);
		model.addAttribute("search", tmp);
		model.addAttribute("userList", userList);
		return "/product/typeList";
	}
	
	//new,sale,event
	@GetMapping("/cond/{pboard_unit_condition}")
	public String getType(@PathVariable("pboard_unit_condition") String pboard_unit_condition, Model model, HttpServletRequest request) {
		log.info("type.....");
		if(pboard_unit_condition!=null) {
			if(Integer.parseInt(pboard_unit_condition)<3) {
				productService.getTypeList(pboard_unit_condition);
				List<ProductVO> pList = productService.getCondList(pboard_unit_condition);
				List<PBoardVO> pBList = productService.getPBoardList();
				List<FileVO> fileList = fileService.getCondListFile(pboard_unit_condition);
				List<UserVO> userList = userService.getUserList();
				log.info("pList...."+pList);
				log.info("pBList...."+pBList);
				log.info("fileList...."+fileList);
				model.addAttribute("userList", userList);
				model.addAttribute("pList", pList);
				model.addAttribute("pBList", pBList);
				model.addAttribute("fileList", fileList);
			} else {
				HttpSession session = request.getSession();
				UserVO user = (UserVO)session.getAttribute("user");
				List<PBoardVO> pBoardList = productService.getRecommendBoardList();
				List<FileVO> fileList = fileService.getMainListFile();
				List<UserVO> userList = userService.getUserList();
				
				if(pBoardList != null)
					model.addAttribute("pBList", pBoardList);
				if(fileList!=null)
					model.addAttribute("fileList", fileList);
				if(userList!=null)
					model.addAttribute("userList", userList);
				if(user!=null) {
					if(user.getUser_interesting()!="") {
						Map<String, Object> interest_Map = new HashMap<String, Object>();
						String[] interestArr = user.getUser_interesting().split("\\,");
						ArrayList<String> interestList = new ArrayList<String>();
						for(String keyWord : interestArr) {
							interestList.add(keyWord);
						}
						interest_Map.put("interest_Map", interestList);
						List<ProductVO> recommendList = productService.getMainRecommendList(interest_Map);
						log.info("recommendList"+recommendList);
						model.addAttribute("pList",recommendList);
					}
				}
			}
		} 
		if(pboard_unit_condition.equals("0")) {
			model.addAttribute("search", "New");
		} else if (pboard_unit_condition.equals("1")) {
			model.addAttribute("search", "Sale");
		} else if (pboard_unit_condition.equals("2")) {
			model.addAttribute("search", "Event");
		}
		return "/product/typeList";
	}
	
}
