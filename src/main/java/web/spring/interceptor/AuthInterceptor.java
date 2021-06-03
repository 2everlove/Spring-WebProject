package web.spring.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.AutomapConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.util.StringUtils;
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
package web.spring.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.AutomapConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import web.spring.service.UserService;
import web.spring.vo.UserVO;


public class AuthInterceptor extends HandlerInterceptorAdapter {
	  @Autowired
	  UserService userService;
	  
	  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	    HttpSession session = request.getSession();
	    UserVO user = (UserVO)session.getAttribute("user");
	    if (user == null) {
	      Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
	      if (loginCookie != null) {
	        user = this.userService.loginSessionkey(loginCookie.getValue());
	        session.setAttribute("user", user);
	      } 
	    } 
	    if (user != null) {
	      if (Integer.parseUnsignedInt(user.getUser_type()) <= 0)
	        return true; 
	      String tmpUri = request.getRequestURI();
	      String queryString = request.getQueryString();
	      if (!StringUtils.isEmpty(queryString))
	        tmpUri = String.valueOf(tmpUri) + "?" + queryString; 
	      session.setAttribute("tmpUrl", tmpUri);
	      response.sendRedirect("/login");
	      return false;
	    } 
	    response.sendRedirect("/login");
	    return false;
	  }
	  
	  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {}
	}
}
