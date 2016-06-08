package kr.co.overclass.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	//�α������� ���� ����ڸ� �α��� �������� �̵�
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	    HttpSession session = request.getSession(); 	
		//���Ƿα��� ���� �Ǻ�
	    
	    if(session.getAttribute("login")==null){
	    	logger.info("���� ����ڴ� �α������� �ʾҽ��ϴ�!!");
	    	response.sendRedirect("/member/loginForm2");
	    	//�α������� �ʾ����� �α����������� �̵�
	    	
	    	return false;//��Ʈ�ѷ��� ��ġ�� ����!!
	    }
	    return true;
	}//preHandle
	
	//�̵��� �������� �ӽ÷� ����
	private void saveDest(HttpServletRequest req){
		String uri = req.getRequestURI();  //hello.jsp
		String query = req.getQueryString();  //name=�浿
		
		if(query==null || query.equals("null")){
			query="";
		}else{
			query = "?"+query; // ?name=�浿
		}
		
		if(req.getMethod().equals("GET")){
		   logger.info("������������: "+ (uri+query));	
		   req.getSession().setAttribute("dest", uri+query);
		                           // hello.jsp?name=�浿
		}
	}//saveDest

}
