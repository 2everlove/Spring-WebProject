package web.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;

@Service
public interface ProductService {
	public List<ProductVO> getProductList();
	
	public List<PBoardVO> getPBoardList();
	
	public List<ProductVO> getTypeList(String product_category);
	
	public List<PBoardVO> getTypeBoardList(String product_category);
	
	public List<ProductVO> getCondList(String pboard_unit_condition); //cond 검색 해당목록 1~5출력
	
	public List<PBoardVO> getCondBoardList(String pboard_unit_condition); //cond 검색 해당 상세페이지 1~5출력
	
	public PBoardVO getProduct(String no);
	
	public ProductVO getProductInfo(String product_id);
	
	public List<String> searchProductCategory(String code_type, String code_value);
	
	public int insertCodeInfo(String code_type, String code_value);
	
	public List<ProductVO> searchManuCate(String product_manufacturer, String product_category);
	
	public int inserPBoard(PBoardVO pBoardVO);

	public List<ProductVO> searchProductManuCate(String product_name);
	
	public ProductVO searchManufCategoty(String product_id);
	
	//검색
	public List<ProductVO> getSearchProductList(String product_search);
	
	public List<PBoardVO> getSearchBoardList(String product_search);
	
	//메인 ---
	public List<PBoardVO> getMainPBoardList();
	
	public List<ProductVO> getMainProductList();
}
