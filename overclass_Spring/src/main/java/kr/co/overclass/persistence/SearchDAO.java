package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.UserVO;

public interface SearchDAO {
	//���̵�/�̸��˻�
	public List<UserVO> search(String info)throws Exception;
	//�±װ˻�
	public List<DocumentVO> searchTag(String doc_tag)throws Exception;
}
