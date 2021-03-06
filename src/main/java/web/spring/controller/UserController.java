package web.spring.controller;


import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import lombok.extern.log4j.Log4j;
import web.spring.service.FileService;
import web.spring.service.MailService;
import web.spring.service.UserService;
import web.spring.vo.FileVO;
import web.spring.vo.UserVO;

@Controller
@Log4j
public class UserController {
	
	@Autowired
	public MailService mailService;
	@Autowired
	public FileService fileService;
	@Autowired
	public UserService userService;
	
	
	//회원등록 페이지
	@GetMapping("/member")
	public String member(UserVO user, Model model){
		log.info(user);
		model.addAttribute("user",user);
		return "/member/member";
	}
	
	//맴버 상세보기
	@GetMapping( "/getUser" )
	public String getUser(HttpServletRequest req,Model model) {
		HttpSession session= req.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		session.invalidate();
		if(user!=null) {
			user.setUser_birth(user.getUser_birth().toString().substring(0, 10));
			user.setUser_regdate(user.getUser_regdate().toString().substring(0, 10));
		}
		FileVO fileVO = fileService.getFileALL(user.getFile_pictureId());
		log.info(fileVO);
		model.addAttribute("fileVO",fileVO);
		return "/member/getUser";
	}
	
	@GetMapping( "/userUpdate" )
	public String userUpdate(@ModelAttribute("user") UserVO user, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionUser = (UserVO)session.getAttribute("user");
		if(sessionUser != null) {
			UserVO userVO = userService.getUser(sessionUser.getUser_id());
			model.addAttribute("user", userVO);
			System.out.println(user.getUser_regdate());
		} else {
			return "redirect:/login";
		}
		/*
		 * if(user!=null) { System.out.println(user.getUser_birth());
		 * user.setUser_birth(user.getUser_birth().toString().substring(0, 10));
		 * System.out.println(user); }
		 */
			
		
		return "/member/userUpdate";
	}

	@PostMapping("/userUpdate")
	public String updateMember(UserVO user, HttpServletRequest req, HttpServletResponse res, RedirectAttributes rttr) {
		boolean update = userService.updateUser(user);
		String resMsg="회원정보가 수정되었습니다.";
		if (update == true) { // userService에서 기존 비밀번호와 복호화된 db의 비밀번호가 일치하면 db값을 수정하고 true를 넘겨받음.
			// 세션과 쿠키를 다시 처리하는
			userService.login(user); // 다시 로그인
			Cookie loginCookie = WebUtils.getCookie(req, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setMaxAge(60*60*24*7);	//갱신할지 그대로 둘지 상담
				loginCookie.setPath("/");
			}
		} else {
			resMsg="회원수정 오류입니다.";
		}
		rttr.addFlashAttribute("resMsg",resMsg);
		return "redirect:/userUpdate" ;
	}

	@GetMapping("/login")
	public String login(Model model ,HttpServletRequest req) {
		HttpSession session = req.getSession();
		String msg = (String)session.getAttribute("msg");
		session.removeAttribute("msg");
		model.addAttribute("msg", msg);
		return "/member/login";
	}

	@PostMapping( "/registerMember")
	public String registerMember(UserVO user, RedirectAttributes rttr) {
		if(user.getFile_pictureId()=="") {
			//pictureId가 없을 경우 pictureId를 1로 처리
			user.setFile_pictureId("1");
		}
		userService.insertUser(user);
		rttr.addFlashAttribute("resMsg", user.getUser_id() + "님 환영합니다.");
		return "/member/login";
	}

	

	@GetMapping({ "/logout" })
	public String logout(HttpServletRequest req, HttpServletResponse res, RedirectAttributes rttr) {
		HttpSession session = req.getSession();
		Cookie loginCookie = WebUtils.getCookie(req, "loginCookie");
		if (loginCookie != null) {
			loginCookie.setMaxAge(0);
			loginCookie.setPath("/");
			res.addCookie(loginCookie);
		}
		session.invalidate();
		ProductController.linkedList = new LinkedList<String>();
		rttr.addFlashAttribute("resMsgHis", "removeHistory");
		return "redirect:/main";
	}

	@PostMapping("/loginAction")
	public String loginAction(UserVO vo, Model model, HttpServletRequest req) {
		UserVO user = userService.login(vo);
		HttpSession session = req.getSession();
		String tmpUri= (String)session.getAttribute("tmpUri");
		System.out.println("loginAction"+tmpUri);
		if (user == null) {
			session.setAttribute("msg", "-1");
		}else {
			if(user.getUser_enabled().equals("1")) {
				session.setAttribute("user", user);
				model.addAttribute("msg", "login");
				log.info("login");
				if(tmpUri!=null) {
					return "/main";
				}
				return "redirect:/main";
			} else if (user.getUser_enabled().equals("0")) {
				log.info("blocked");
				session.setAttribute("msg", "0");
			} else {
				log.info("withdrawal");
				session.setAttribute("msg", "2");
			}
		}
		return "/member/login";
	}
	
//	ajax
	@GetMapping({ "/checkIdRepeat/{User_id}" })
	@ResponseBody
	public String checkIdRepeat(@PathVariable("User_id") String User_id) {
		UserVO user = userService.checkIdReapet(User_id);
		if (user != null)
			return user.getUser_id();
		return "reduplication";
	}
	

	@PostMapping({ "/searchId" })
	@ResponseBody
	public Map<String, String> searchId(@RequestBody UserVO user) {
		String id = userService.searchId(user);
		Map<String, String> res = new HashMap<String, String>();
		if (StringUtils.isEmpty(id)) {
			res.put("msg", "이름/이메일이 일치하지 않습니다.");
		} else {
			res.put("msg", "아이디는" + id + "입니다.");
		}
		return res;
	}

	@PostMapping( "/searchPwd" )
	@ResponseBody
	public Map<String, String> searchPwd(@RequestBody UserVO vo) {
		UserVO user = userService.searchPwd(vo);
		Map<String, String> res = new HashMap<String, String>();
		if (user != null) {
			System.out.println(user.getUser_password());
			String pwd = UUID.randomUUID().toString().substring(0, 7);
			user.setUser_password(pwd);
			int updateRes = userService.updatePwd(user);
			if (updateRes > 0)
				if (mailService.sendPwd(pwd, user.getUser_email())==true) {
					res.put("msg", "임시 비밀번호를 메일로 전송했습니다.");
				} else {
					res.put("msg", "메일 전송에 실패했습니다. 관리자에게 문의해주세요.");
				}
		} else {
			res.put("msg", "비밀번호 확인 오류");
		}
		return res;
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @GetMapping(value="/googleLogin/{User_email:.+}", produces = {
	 * MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	 * public Map<String,Object> googleLogin(@PathVariable("User_email") String
	 * User_email){ System.out.println(User_email);
	 * 
	 * Map<String,Object> res = new HashMap<>(); UserVO user =
	 * service.searchUserByEmail(User_email); System.err.println(user); if(user ==
	 * null) { res.put("user", "fail"); } else { res.put("user", user); }
	 * System.out.println("map"+res.get("user")); return res; }
	 */

	@ResponseBody
	@GetMapping("/googleLogin")
	public Map<String,Object> googleLogin2(@RequestParam("email") String User_email, HttpServletRequest req,Model model){
		System.out.println(User_email);
		Map<String,Object> res = new HashMap<>();
		UserVO user = userService.searchUserByEmail(User_email);
		System.err.println(user);
		if(user == null) {
			res.put("user", "fail");
		} else {
			System.out.println("googleLogin:"+user);
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			model.addAttribute("msg", user.getUser_id() + "님 환영합니다.");
			res.put("user", user);
		}
		System.out.println("map"+res.get("user"));
		return res;
	}
}