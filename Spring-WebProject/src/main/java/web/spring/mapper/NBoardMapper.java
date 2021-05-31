package web.spring.mapper;


import java.util.List;

import web.spring.vo.Criteria;
import web.spring.vo.NBoardVo;

public interface NBoardMapper {

	public NBoardVo get(int nboard_no);
	
	public int insertNboard(NBoardVo vo);
	
	public List <NBoardVo> getList(Criteria cri);
	
	public int update(NBoardVo vo);
	
	public int delete(int nboard_no);
	
	public int getTotal(Criteria cri);
	
	public int nboardLock(NBoardVo vo);
}