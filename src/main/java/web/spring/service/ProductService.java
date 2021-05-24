package web.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;

@Service
public interface ProductService {
	public List<ProductVO> getProductList();
	
	public List<PBoardVO> getPBoardList();
}
