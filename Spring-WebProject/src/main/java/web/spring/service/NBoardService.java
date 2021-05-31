package web.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.spring.vo.Criteria;
import web.spring.vo.NBoardVo;

@Service
public interface NBoardService {

	public NBoardVo get(int nboard_no);
	
	public int insertNboard(NBoardVo vo);
	
	public List <NBoardVo> getList(Criteria cri);
	
	public int update(NBoardVo vo);
	
	public int delete(int nboard_no);
	
	public int getTotal(Criteria cri);
	
	public int nboardLock(NBoardVo vo);
}
