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
			throws Exception { // /loginPost ȣ�� �� �����ϴ� ���ͼ��� -> ���� ���� ���� ����
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute(LOGIN);
		
		if(vo!=null){
			logger.info("�����ִ� ���� ������ ������ �����մϴ�.");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception { // /loginPost ȣ�� �� �����ϴ� ���ͼ���
																			// ��Ʈ�ѷ����� �� ��ü�� ������ ���� ������ �α��� ���� �� ���ǿ� ���� 
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		UserVO userVO = (UserVO)modelMap.get("userVO"); // �𵨿��� ��ü ����
		
		if (userVO != null){
			logger.info("�α��� ����!");
			session.setAttribute(LOGIN, userVO); // �α��� �����ϸ� ��ü�� ���ǿ� ����

			 if(request.getParameter("useCookie") != null){
				   //üũ�ڽ��� üũ�Ǿ��ٸ�
				 logger.info("�α��λ��� ����");
				 Cookie loginCookie = new Cookie("loginCookie", session.getId());
				   loginCookie.setPath("/");
				   loginCookie.setMaxAge(60*60*24*7);//7�ϰ� ��ȿ
				   response.addCookie(loginCookie);
			   }
			
			//response.sendRedirect("/"); // ���� ȭ������
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
