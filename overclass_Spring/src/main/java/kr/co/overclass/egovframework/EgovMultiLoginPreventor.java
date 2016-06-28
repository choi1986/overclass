package kr.co.overclass.egovframework; //egovframework.com.utl.slm;

import java.util.Enumeration;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

/**
 * @Class Name : EgovMultiLoginPreventor.java
 * @Description : �ߺ� �α��� ������ ���� ������� �α��� ���̵�� ���� ���̵� �����ϴ� ���� Ŭ����
 * @Modification Information
 *
 *    ������         ������         ��������
 *    -------        -------     -------------------
 *    2014.09.30	ǥ�������ӿ�ũ		���ʻ���
* @author YJ Kwon
 * @since 2014.09.30
 * @version 3.5
 */
public class EgovMultiLoginPreventor {
	
	public static ConcurrentHashMap<String, HttpSession> loginUsers = new ConcurrentHashMap<String, HttpSession>();

	/**
	 * ������� �α��� ���̵�� ������ ������ �ִ����� Ȯ���Ѵ�
	 * */
	public static boolean findByLoginId(String loginId) {
		return loginUsers.containsKey(loginId);
	}

	/**
	 * ������� �α��� ���̵�� �̹� �����ϴ� ������ ��ȿȭ�Ѵ�
	 * */
	public static void invalidateByLoginId(String loginId) {
		Enumeration<String> e = loginUsers.keys();
		while (e.hasMoreElements()) {
			String key = (String) e.nextElement();
			if (key.equals(loginId)) {
				loginUsers.get(key).invalidate();
			}
		}
	}
}

