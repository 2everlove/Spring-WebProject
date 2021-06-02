package web.spring.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import lombok.extern.log4j.Log4j;
import web.spring.service.UserService;
import web.spring.vo.UserVO;

@Controller
@Log4j
public class UserController {
	
	
	@Autowired
	public UserService userService;
	
	/*여기다 userupdate넣자
	 * @PostMapping("/")
	 */
	@GetMapping("/login")
	public String login(){
		return ("/member/login");
	}
	
	@GetMapping("/member")
	public String member(){
		return ("/member/member");
	}
	
	@PostMapping("/registerMember")
	public String registerMember(UserVO user,RedirectAttributes rttr) {
		log.info(userService.insertUser(user));
		rttr.addFlashAttribute("resMsg",user.getUser_id()+"님 환영합니다.");
		return "/member/login";
	}
	
	@GetMapping("/checkIdRepeat/{User_id}")
	@ResponseBody
	public String checkIdRepeat(@PathVariable("User_id") String User_id) {
		//아이디 중복 체크
		UserVO user = userService.checkIdReapet(User_id);
		if(user != null) {
			return user.getUser_id();
		} else {
			return "reduplication";
		}
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		session.invalidate();
		
		Cookie loginCookie = WebUtils.getCookie(req, "loginCookie");
		loginCookie.setMaxAge(0);
		loginCookie.setPath("/");
		
		res.addCookie(loginCookie);
		
		return "/member/login";
	}
	
	@PostMapping("/loginAction")
	public String loginAction(UserVO vo, Model model, HttpServletRequest req) {
		UserVO user = userService.login(vo);
		if (user == null) {
			model.addAttribute("msg","로그인 실패했습니다.ID/PW를 확인 하세요.");
			return "/login";
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			model.addAttribute("msg",user.getUser_id()+"님 환영합니다.");
			//model.addAttribute("user", user);
			return "/member/loginAction";
		}//else
		
	}//loginAction
}