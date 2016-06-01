package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.UserVO;

public interface SearchDAO {
	//���̵�˻�
	public UserVO searchId(String user_id)throws Exception;
	//�̸��˻�
	public List<UserVO> searchName(String user_name)throws Exception;
	//�±װ˻�
	public List<DocumentVO> searchTag(String doc_tag)throws Exception;
}
