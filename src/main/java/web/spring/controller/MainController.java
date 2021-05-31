package web.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;
import web.spring.service.FileService;
import web.spring.service.ProductService;
import web.spring.service.UserService;

@Controller
@Log4j
public class MainController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private FileService fileService;
	
	@GetMapping("/main")
	public String getMain() {
		System.out.println("main...........");
		return "/main/main";
	}
	
	@GetMapping("/myPage/myPage")
	public void getMyPage() {
		System.out.println("mypage.....");
	}
	
}
