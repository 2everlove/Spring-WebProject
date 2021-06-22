package web.spring.mapper;


import java.util.List;

import web.spring.vo.Criteria;
import web.spring.vo.NBoardVO;

public interface NBoardMapper {

	public NBoardVO get(int nboard_no);
	
	public int insertNboard(NBoardVO vo);
	
	public List <NBoardVO> getList(Criteria cri);
	
	public int update(NBoardVO vo);
	
	public int delete(int nboard_no);
	
	public int getTotal(Criteria cri);
	
	public int nboardLock(NBoardVO vo);

	public List <NBoardVO> getOpendList(Criteria cri);

	public int getOpendTotal(Criteria cri);
}