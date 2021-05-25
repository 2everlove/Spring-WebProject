package web.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.spring.vo.Criteria;
import web.spring.vo.nboardVo;

@Service
public interface nboardService {

	public nboardVo get(int nboard_no);
	
	public int insertNboard(nboardVo vo);
	
	public List <nboardVo> getList(Criteria cri);
	
	public int update(nboardVo vo);
	
	public int delete(int nboard_no);
	
	public int getTotal(Criteria cri);
	
	public int nboardLock(nboardVo vo);
}
