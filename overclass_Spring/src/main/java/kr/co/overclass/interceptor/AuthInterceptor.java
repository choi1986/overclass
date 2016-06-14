package kr.co.overclass.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.co.overclass.domain.UserVO;
import kr.co.overclass.service.UserService;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private UserService service;

	//로그인하지 않은 사용자를 로그인 페이지로 이동
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	    HttpSession session = request.getSession(); 	
		//세션로그인 여부 판별
	    
	    if(session.getAttribute("login")==null){
	    	logger.info("현재 사용자는 로그인하지 않았습니다!!");
	    	saveDest(request);
	    	
	    	Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
	    	if(loginCookie != null){//기록된 쿠키를 찾았다면
	    		UserVO uservo = service.checkLoginBefore(loginCookie.getValue());
		    	logger.info("USERVO : "+uservo);
	    	    if(uservo != null){
	    	    	//기록된 쿠키와 DB의 저장된 쿠키가 일치하는 행을 찾았다면
	    	      session.setAttribute("login", uservo);
	    	      return true;
	    	    }	    	
	    	}	    	
	    	
	    	response.sendRedirect("/member/loginForm2");
	    	//로그인하지 않았을때 로그인페이지로 이동
	    	
	    	return false;//컨트롤러를 거치지 않음!!
	    }
	    return true;
	}//preHandle
	
	//이동할 페이지를 임시로 저장
	private void saveDest(HttpServletRequest req){
		String uri = req.getRequestURI();  //hello.jsp
		String query = req.getQueryString();  //name=길동
		
		if(query==null || query.equals("null")){
			query="";
		}else{
			query = "?"+query; // ?name=길동
		}
		
		if(req.getMethod().equals("GET")){
		   logger.info("목적지페이지: "+ (uri+query));	
		   req.getSession().setAttribute("dest", uri+query);
		                           // hello.jsp?name=길동
		}
	}//saveDest

}
