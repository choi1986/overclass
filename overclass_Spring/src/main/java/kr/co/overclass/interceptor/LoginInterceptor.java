package kr.co.overclass.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.overclass.domain.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception { // /loginPost 호출 전 실행하는 인터셉터 -> 이전 세션 정보 삭제
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute(LOGIN);
		
		if(vo!=null){
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
		UserVO userVO = (UserVO)modelMap.get("userVO"); // 모델에서 객체 얻어옴
		
		if (userVO != null){
			logger.info("로그인 성공!");
			session.setAttribute(LOGIN, userVO); // 로그인 성공하면 객체를 세션에 저장

			 if(request.getParameter("useCookie") != null){
				   //체크박스가 체크되었다면
				 logger.info("로그인상태 유지");
				 Cookie loginCookie = new Cookie("loginCookie", session.getId());
				   loginCookie.setPath("/");
				   loginCookie.setMaxAge(60*60*24*7);//7일간 유효
				   response.addCookie(loginCookie);
			   }
			
			//response.sendRedirect("/"); // 메인 화면으로
			Object dest = session.getAttribute("dest");
			if (userVO.getUser_admin()==1) {
				if (dest==null) response.sendRedirect("/overclass/admin");
				else if (dest.equals("/overclass/main")) response.sendRedirect("/overclass/admin");
				else response.sendRedirect((String)dest);
			}
			else {
				if (dest==null) response.sendRedirect("/overclass/main");
				else if (dest.equals("/overclass/admin")) response.sendRedirect("/overclass/main");
				else response.sendRedirect((String)dest);
			}
		}
	}
}
