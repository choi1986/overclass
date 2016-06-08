package kr.co.overclass.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception { // /loginPost 호출 전 실행하는 인터셉터 -> 이전 세션 정보 삭제
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN)!=null){
			logger.info("남아있는 이전 세션의 정보를 삭제합니다.");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception { // /loginPost 호출 후 실행하는 인터셉터
																			// 컨트롤러에서 모델 객체에 저장한 유저 정보를 로그인 성공 후 세션에 저장 
		
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("userVO"); // 모델에서 객체 얻어옴
		
		if (userVO != null){
			logger.info("로그인 성공!");
			session.setAttribute(LOGIN, userVO); // 로그인 성공하면 객체를 세션에 저장
			//response.sendRedirect("/"); // 메인 화면으로
			Object dest = session.getAttribute("dest");
			
			response.sendRedirect(dest != null ? (String)dest : "/");
		}
	}
}
