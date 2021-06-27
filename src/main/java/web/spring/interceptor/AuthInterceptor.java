package web.spring.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import web.spring.service.UserService;
import web.spring.vo.UserVO;


public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	UserService userService;
	
	/**
	 * This implementation always returns {@code true}.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		
		// 만약 유저객체가 널이라면 = 로그인 하지 않은 사용자가 접근 했다면
		// 자동로그인 처리
		if(user == null) {
			// 자동로그인이 가능 한 사용자인지 판단
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				user = userService.loginSessionkey(loginCookie.getValue());
				if(user != null) {
					// 로그인 처리 : 세션에 유저 객체를 생성 합니다.
					session.setAttribute("user", user);				
				}
			}
			
		}
		
		// 로그인 OK
		if( user != null) {
			// ROLE_USER 권한 체크
			if(Integer.parseInt(user.getUser_type())==0) {
				return true;	
			} else if(Integer.parseInt(user.getUser_type())==1) {
				return true;
			} else if(Integer.parseInt(user.getUser_type())==2) {
				return true;
			}
			return false;
		}
		
		System.out.println("uri============"+request.getRequestURI());
		System.out.println("query=========="+request.getQueryString());
		String uri = request.getRequestURI(); 	// 기존 요청의 URI정보
		String query = request.getQueryString();// 기존 요청의 파라메터
		
		if(query != null) {
			uri += "?" + query; 
		}
		String res ="";
		if(uri != null) {
			System.out.println("auth"+uri);
			session.setAttribute("tmpUri", uri);
			res = (String)session.getAttribute("tmpUri");
		}
		System.out.println("contain?"+res);
		response.sendRedirect("/login");
		return false;
	}

	/**
	 * This implementation is empty.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	}
}
