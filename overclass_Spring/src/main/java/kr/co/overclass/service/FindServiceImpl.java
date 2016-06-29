package kr.co.overclass.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.DocumentDTO;
import kr.co.overclass.dto.GoodDTO;
import kr.co.overclass.dto.ReplyCountDTO;
import kr.co.overclass.persistence.FindDAO;
import kr.co.overclass.persistence.GoodDAO;
import kr.co.overclass.persistence.ReplyDAO;

@Service
public class FindServiceImpl implements FindService {

	@Inject
	private FindDAO dao;
	
	@Inject
	private GoodDAO good_dao;
	
	@Inject
	private ReplyDAO reply_dao;

	@Override
	public List<DocumentDTO> tagFind(String tag, String user_id) throws Exception {
		List<DocumentDTO> list = dao.tagFind(tag);
		
		// 좋아요 가져오기 위한 map생성
				Map<String, Object> map = new HashMap<>();
				map.put("good_user", user_id);
				
				// 출력한 게시글 넘버 String 생성
				int dnonum[] = new int[list.size()];
				for(int i = 0; i<list.size() ; i++){
					// dnonum에 출력할 dno들 입력
					dnonum[i] = list.get(i).getDno();
				}
				map.put("dnonum", dnonum);
				
				if(dnonum.length == 0) {
					return list;
				}
				
				// DB에서 굿 카운트 받아옴
				List<GoodDTO> goodcount = good_dao.count(map);
				// DB에서 댓글 카운트 받아옴
				List<ReplyCountDTO> replycount = reply_dao.count(map);
				// DB에서 굿을 했는지 리스트를 받아옴
				List<GoodDTO> goodlist = good_dao.search(map);
				/*map.remove("good_user");
				map.put("good_user", user_id);*/
				
				for(int i = 0; i<list.size() ; i++) {
					list.get(i).setGood(0);
					list.get(i).setGoodcnt(0);
					for(int j = 0; j<goodlist.size();j++) {
						// 받아온 리스트의 글번호와, 조회된 리스트의 글번호가 일치하는지를 검사 (일치 = 굿을 했다는뜻)
						if(list.get(i).getDno() == goodlist.get(j).getDno()) {
							list.get(i).setGood(1);
						}
					}
					for(int j = 0; j<goodcount.size();j++){
						// 굿이 몇개되었는지 카운트해서 일치하는 dno에 입력
						if(list.get(i).getDno() == goodcount.get(j).getDno()) {
							list.get(i).setGoodcnt(goodcount.get(j).getGood());
							
						}
					}
					//list.get(i).setReplycnt(0);
					for(int k = 0; k<replycount.size();k++){
						if(list.get(i).getDno() == replycount.get(k).getDno()) {
							list.get(i).setReplycnt(replycount.get(k).getCount());
						}
					}
				}
		
		return list;
	}

	@Override
	public int tagcnt(String tag) throws Exception {
		return dao.tagcnt(tag);
	}

	@Override
	public List<UserVO> friendFind(Map<String, Object> map) throws Exception {
		return dao.friendFind(map);
	}

	@Override
	public int friendcnt(String friend) throws Exception {
		return dao.friendcnt(friend);
	}
}
