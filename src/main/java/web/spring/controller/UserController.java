package web.spring.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController {
	
	@GetMapping("/login")
	public String login() {
		return "/member/login";
	}
	
	@GetMapping("/loginAction")
	public String loginAction() {
		return "/member/loginAction";
	}
	
}