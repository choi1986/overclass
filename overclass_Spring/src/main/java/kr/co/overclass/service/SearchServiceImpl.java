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
		return search.searchTag(vo);//�±� �˻�
	}

	@Override
	public List<UserVO> select(SearchVO vo) throws Exception {
		return search.search(vo);//���̵� �˻�
	}

	@Override
	public Map<String, Object> pageMaker(String info, Criteria cri) throws Exception {
		/*int total = search.count(info);//ǥ���Ϸ��� ������ ��
		System.out.println(total);
		//44���� ����� ������ page=5
		//40���� ����� ������ page=4
		//total/10==0�̸� �������� total/pageNum
		//total/10!=0�̸� �������� total/pageNum+1
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
		//�������� 1�ϰ�� start�� 1 end�� 10
		//�������� 2�ϰ�� start�� 11 end�� 20
		map.put("end", cri.getPage()*10);
		map.put("start", cri.getPage()*10-9);*/
		return search.pageMaker(info, cri);
	}

	@Override
	public int countNum(String value) throws Exception {
		return search.count(value);
	}

}



