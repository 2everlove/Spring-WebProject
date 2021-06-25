package web.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import web.spring.service.UserService;


public class PagingInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	UserService userService;
	
	/**
	 * This implementation always returns {@code true}.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		System.out.println("puri============"+request.getRequestURI());
		System.out.println("pquery=========="+request.getQueryString());
		String uri = request.getRequestURI(); 	// 기존 요청의 URI정보
		String query = request.getQueryString();// 기존 요청의 파라메터
		
		if(query != null) {
			uri += "?" + query; 
		}
		
		session.setAttribute("tmpUri", uri);
		
		return true;
	}

	/**
	 * This implementation is empty.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	}
}
