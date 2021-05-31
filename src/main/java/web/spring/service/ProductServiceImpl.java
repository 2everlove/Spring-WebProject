package web.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.mapper.ProductMapper;
import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
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

	@Override
	public ProductVO getProductInfo(String product_id) {
		return productMapper.getProductInfo(product_id);
	}

	@Override
	public List<String> searchProductCategory(String code_type, String code_value) {
		return productMapper.searchProductCategory(code_type, code_value);
	}

	@Override
	public int insertCodeInfo(String code_type, String code_value) {
		return productMapper.insertCodeInfo(code_type, code_value);
	}
	
}
