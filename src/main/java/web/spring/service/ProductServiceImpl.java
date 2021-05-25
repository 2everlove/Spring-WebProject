package web.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import web.spring.mapper.ProductMapper;
import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Setter(onMethod_= @Autowired)
	private ProductMapper productMapper;
	
	@Override
	public List<ProductVO> getProductList() {
		return productMapper.getProductList();
	}

	@Override
	public List<PBoardVO> getPBoardList() {
		return productMapper.getPBoardList();
	}

	@Override
	public List<PBoardVO> getTypeBoardList(String product_category) {
		
		return productMapper.getTypeBoardList(product_category);
	}

	@Override
	public List<ProductVO> getTypeList(String product_category) {
		return productMapper.getTypeList(product_category);
	}

	@Override
	public PBoardVO getProduct(String no) {
		return productMapper.getProduct(no);
	}
	
}
