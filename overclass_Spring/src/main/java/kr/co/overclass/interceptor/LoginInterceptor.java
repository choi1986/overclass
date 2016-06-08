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
			throws Exception { // /loginPost ȣ�� �� �����ϴ� ���ͼ��� -> ���� ���� ���� ����
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN)!=null){
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
		Object userVO = modelMap.get("userVO"); // �𵨿��� ��ü ����
		
		if (userVO != null){
			logger.info("�α��� ����!");
			session.setAttribute(LOGIN, userVO); // �α��� �����ϸ� ��ü�� ���ǿ� ����
			//response.sendRedirect("/"); // ���� ȭ������
			Object dest = session.getAttribute("dest");
			
			response.sendRedirect(dest != null ? (String)dest : "/");
		}
	}
}
