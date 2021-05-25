package web.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.mapper.nboardMapper;
import web.spring.vo.Criteria;
import web.spring.vo.nboardVo;

@Service
public class nboardServiceImpl implements nboardService {

	@Autowired
	nboardMapper mapper;
	
	@Override
	public nboardVo get(int nboard_no) {
		return mapper.get(nboard_no);
	}

	@Override
	public int insertNboard(nboardVo vo) {
		return mapper.insertNboard(vo);
	}

	@Override
	public List<nboardVo> getList(Criteria cri) {
		return mapper.getList(cri);
	}

	@Override
	public int update(nboardVo vo) {
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
	public int nboardLock(nboardVo vo) {
		return mapper.nboardLock(vo);
	}

}
