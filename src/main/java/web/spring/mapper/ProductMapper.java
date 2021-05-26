package web.spring.mapper;

import java.util.List;

import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;

public interface ProductMapper {
	public List<ProductVO> getProductList();
	
	public List<PBoardVO> getPBoardList();
	
	public List<ProductVO> getTypeList(String product_category);
	
	public List<PBoardVO> getTypeBoardList(String product_category);
	
	public PBoardVO getProduct(String no);
	
	public ProductVO getProductInfo(String product_id);
}
