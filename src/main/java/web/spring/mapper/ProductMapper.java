package web.spring.mapper;

import java.util.List;

import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;

public interface ProductMapper {
	public List<ProductVO> getProductList();
	
	public List<PBoardVO> getPBoardList();
}