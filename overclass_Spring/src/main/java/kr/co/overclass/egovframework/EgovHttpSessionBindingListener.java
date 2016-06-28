package kr.co.overclass.egovframework; //egovframework.com.utl.slm;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

/**
 * @Class Name : EgovHttpSessionBindingListener.java
 * @Description : �ߺ� �α��� ������ ���� ������� �α��� ���̵�� ������ �����ϴ� ���� Ŭ����
 * @Modification Information
 *
 *    ������         ������         ��������
 *    -------        -------     -------------------
 *    2014.09.30	ǥ�������ӿ�ũ		���ʻ���
* @author YJ Kwon
 * @since 2014.09.30
 * @version 3.5
 */
public class EgovHttpSessionBindingListener implements HttpSessionBindingListener {

	/**
	 * ������� �α��� ���ǿ� EgovHttpSessionBindingListener�� ���ε��� �� �ڵ� ȣ��Ǵ� �޼ҵ��,
	 * ����� ������ �̹� �����ϴ����� �˻��Ͽ� �ϳ��� ���ø����̼� ������ �ϳ��� ���Ǹ� �����ǵ��� �Ѵ�
	 * */
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		if (EgovMultiLoginPreventor.findByLoginId(event.getName())) {
			EgovMultiLoginPreventor.invalidateByLoginId(event.getName());
		}
		EgovMultiLoginPreventor.loginUsers.put(event.getName(), event.getSession());
	}

	/**
	 * 
	 * �α׾ƿ� Ȥ�� ����Ÿ�Ӿƿ� ������ ���� ����� �������κ��� 
	 * EgovHttpSessionBindingListener�� ���ŵ� �� �ڵ� ȣ��Ǵ� �޼ҵ��,
	 * ������� �α��� ���̵� �ش��ϴ� ������ ConcurrentHashMap���� ��� �����Ѵ�
	 * */
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		EgovMultiLoginPreventor.loginUsers.remove(event.getName(), event.getSession());
	}
}

