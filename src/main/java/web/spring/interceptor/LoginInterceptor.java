package web.spring.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import web.spring.service.UserService;
import web.spring.vo.UserVO;


public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		return true;
	}

	
//	loginAction 컨트롤러가 실행된 이후 자동로그인 기능이 체크되어있으면 쿠키를 저장
//	만약 cookie가 생성되지 않는다면 로직이 실행되는지 로그
//	인터셉터가 실행되지 않는다면 설정파일에 등록되어있는지 확인
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		//로그인이 성공했다면(세션의 로그인 유저객체가 있다면)
		//세션에 user객체 생성시점:/loginAction
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("user");
		System.out.println("interceptor===================user : "+user);
		System.out.println("useCookie======================"+request.getParameter("useCookie"));
		
		//로그인 성공했다면 자동로그인 쿠키 생성 getAttribute아님 파라메터값을 가지고옴
		if(user!=null&&request.getParameter("useCookie")!=null) {
			
			//Users테이블에 쿠키 정보 저장(자동로그인 체크를 했을 경우)
			//session.getId(),sessionkey=세션아이디 저장
			//jsesessionId = 자동로기인시 생성하는 쿠키
			//여기에 저장되는 value 값과 users테이블의 sessionkey에 저장되는 값 동일해야함
			
			user.setSessionkey(session.getId());
			userService.updateSessionkey(user);

			// 자동로그인을 위한 쿠키를 생성 합니다.
			Cookie loginCookie = new Cookie("loginCookie", session.getId());
			// 유효기간과 PATH를 지정 합니다.
			loginCookie.setMaxAge(60*60*24*7);	//7일
			loginCookie.setPath("/");
			
			response.addCookie(loginCookie);
			
			String tmpUri = (String)session.getAttribute("tmpUri");
			
			if(!StringUtils.isEmpty(tmpUri)) {
				response.sendRedirect(tmpUri);
			}
		}
	}
}

