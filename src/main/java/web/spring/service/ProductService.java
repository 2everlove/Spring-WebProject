package web.spring.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import web.spring.vo.CodeVO;
import web.spring.vo.Criteria;
import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;
import web.spring.vo.UserVO;

@Service
public interface ProductService {
	public List<ProductVO> getProductList(Criteria cri);
	
	public List<ProductVO> getProductAllList();
	
	public List<PBoardVO> getAllPBoardList(Criteria cri);
	
	public List<PBoardVO> getUserPBoardList(String user_id, Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public int getProductTotal(Criteria cri);
	
	public int getPboardUserTotal(String user_id, Criteria cri);
	
	//admin
	public int updatepBoard(PBoardVO pBoardVO);
	
	public int updateProduct(ProductVO productVO);
	
	public String getProductSeq();
	//
	
	public List<PBoardVO> getPBoardList();
	
	public List<ProductVO> getTypeList(String product_category);
	
	public List<PBoardVO> getTypeBoardList(String product_category);
	
	public List<ProductVO> getCondList(String pboard_unit_condition); //cond 검색 해당목록 1~5출력
	
	public List<PBoardVO> getCondBoardList(String pboard_unit_condition); //cond 검색 해당 상세페이지 1~5출력
	
	public PBoardVO getProduct(String no);
	
	public ProductVO getProductInfo(String product_id);
	
	public List<ProductVO> searchProductCategory(String code_type, String code_value);
	
	public int insertCodeInfo(String code_type, String code_value);
	
	public List<ProductVO> searchManuCate(String product_manufacturer, String product_category);
	
	public int inserPBoard(PBoardVO pBoardVO);
	
	public int productInfoInsert(ProductVO productVO);

	public List<ProductVO> searchProductManuCate(String product_name);
	
	public ProductVO searchManufCategoty(String product_id);
	
	//검색
	public List<ProductVO> getSearchProductList(Map<String, Object> search_Map);
	
	public List<PBoardVO> getSearchBoardList(Map<String, Object> search_Map);
	
	//메인 ---
	public List<PBoardVO> getMainPBoardList();
	
	public List<ProductVO> getMainProductList();

	public CodeVO getCode(String code_type, String code_value);
	
	public int insertCode(String code_type, String code_value);

	public List<PBoardVO> getHistoryProduct(Map<String, Object> history_Map);
}
