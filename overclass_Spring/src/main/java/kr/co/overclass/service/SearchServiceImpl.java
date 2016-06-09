package kr.co.overclass.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.SearchVO;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.persistence.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService {

	@Inject
	private SearchDAO search;

	@Override
	public List<DocumentVO> selectTag(SearchVO vo) throws Exception {
		return search.searchTag(vo);//태그 검색
	}

	@Override
	public List<UserVO> select(SearchVO vo) throws Exception {
		return search.search(vo);//아이디 검색
	}

	@Override
	public Map<String, Object> pageMaker(String info, Criteria cri) throws Exception {
		/*int total = search.count(info);//표시하려는 데이터 수
		System.out.println(total);
		//44개의 결과가 있으면 page=5
		//40개의 결과가 있으면 page=4
		//total/10==0이면 페이지는 total/pageNum
		//total/10!=0이면 페이지는 total/pageNum+1
		int page=0;
		if(total/cri.getPerPageNum()==0){
			page=total/cri.getPerPageNum();
		}else if(total/cri.getPerPageNum()!=0){
			page=total/cri.getPerPageNum()+1;
		}
		cri.setPage(page);
		cri.setPerPageNum(10);
		Map<String,Object> map = new HashMap<>();
		map.put("info", info);
		//페이지가 1일경우 start는 1 end는 10
		//페이지가 2일경우 start는 11 end는 20
		map.put("end", cri.getPage()*10);
		map.put("start", cri.getPage()*10-9);*/
		return search.pageMaker(info, cri);
	}

	@Override
	public int countNum(String value) throws Exception {
		return search.count(value);
	}

}



