package web.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.spring.service.FileService;
import web.spring.service.ProductService;
import web.spring.service.UserService;

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
	public String getMain() {
		log.info("main...........");
		return "/main/main";
	}
	
	@GetMapping("/myPage/myPage")
	public void getMyPage() {
		log.info("mypage.....");
	}
	
}
