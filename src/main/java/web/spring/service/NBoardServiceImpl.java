package web.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.mapper.NBoardMapper;
import web.spring.vo.Criteria;
import web.spring.vo.NBoardVO;

@Service
public class NBoardServiceImpl implements NBoardService {

	@Autowired
	NBoardMapper mapper;
	
	@Override
	public NBoardVO get(int nboard_no) {
		return mapper.get(nboard_no);
	}

	@Override
	public int insertNboard(NBoardVO vo) {
		return mapper.insertNboard(vo);
	}

	@Override
	public List<NBoardVO> getList(Criteria cri) {
		return mapper.getList(cri);
	}

	@Override
	public int update(NBoardVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int delete(int nboard_no) {
		return mapper.delete(nboard_no);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	@Override
	public int nboardLock(NBoardVO vo) {
		return mapper.nboardLock(vo);
	}

}
