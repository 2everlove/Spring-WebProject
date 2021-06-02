package web.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
	
	@PostMapping("/pBoardUpdate")
	public Map<String, Object> updateBoardList(PBoardVO pBoardVO) {
		log.info(pBoardVO);
		int res = productService.updatepBoard(pBoardVO);
		PBoardVO board = productService.getProduct(pBoardVO.getPboard_unit_no());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", board);
		return map;
	}
}
