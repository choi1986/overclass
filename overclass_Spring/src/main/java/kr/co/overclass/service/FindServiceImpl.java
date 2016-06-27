package kr.co.overclass.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.DocumentDTO;
import kr.co.overclass.persistence.FindDAO;
import kr.co.overclass.persistence.FriendDAO;

@Service
public class FindServiceImpl implements FindService {

	@Inject
	private FindDAO dao;

	@Override
	public List<DocumentDTO> tagFind(String tag) throws Exception {
		return dao.tagFind(tag);
	}

	@Override
	public int tagcnt(String tag) throws Exception {
		return dao.tagcnt(tag);
	}

	@Override
	public List<UserVO> friendFind(String friend) throws Exception {
		return dao.friendFind(friend);
	}

	@Override
	public int friendcnt(String friend) throws Exception {
		return dao.friendcnt(friend);
	}
}
