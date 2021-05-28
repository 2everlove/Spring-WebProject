package web.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;

@Service
public interface ProductService {
	public List<ProductVO> getProductList();
	
	public List<PBoardVO> getPBoardList();
	
	public List<ProductVO> getTypeList(String product_category);
	
	public List<PBoardVO> getTypeBoardList(String product_category);
	
	public PBoardVO getProduct(String no);
	
	public ProductVO getProductInfo(String product_id);
	
	public List<String> searchProductCategory(String code_type, String code_value);
	
	public int insertCodeInfo(String code_type, String code_value);
	
	public List<ProductVO> searchManuCate(String product_manufacturer, String product_category);
	
	public int inserPBoard(PBoardVO pBoardVO);

	public List<ProductVO> searchProductManuCate(String product_name);
	
	public ProductVO searchManufCategoty(String product_id);
}
