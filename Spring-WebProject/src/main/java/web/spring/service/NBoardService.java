package web.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.spring.vo.Criteria;
import web.spring.vo.NBoardVO;

@Service
public interface NBoardService {

	public NBoardVO get(int nboard_no);
	
	public int insertNboard(NBoardVO vo);
	
	public List <NBoardVO> getList(Criteria cri);
	
	public int update(NBoardVO vo);
	
	public int delete(int nboard_no);
	
	public int getTotal(Criteria cri);
	
	public int nboardLock(NBoardVO vo);
}
