package web.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;

public interface ProductMapper {
	public List<ProductVO> getProductList(); // 상품 전체 조회
	
	public List<PBoardVO> getPBoardList(); // 상세페이지 전체 조회
	
	public List<ProductVO> getTypeList(String product_category); //type 검색 해당목록 1~5출력
	
	public List<PBoardVO> getTypeBoardList(String product_category); //type 검색 해당 상세페이지 1~5출력
	
	public PBoardVO getProduct(String no);//product_no로 상세페이지 조회
	
	public ProductVO getProductInfo(String product_id); //상세페이지 내에 있는 product_id로 상품 조회
	
	public int productInfoInsert(ProductVO productVO); //상품 추가
	
	public int productInfoDelete(ProductVO productVO); //상품 삭제
	
	public List<String> searchProductCategory(@Param("code_type")String code_type, @Param("code_value") String code_value);
	
	public int insertCodeInfo(@Param("code_type")String code_type, @Param("code_value") String code_value);
	
	public List<ProductVO> searchManuCate(@Param("product_manufacturer")String product_manufacturer, @Param("product_category") String product_category);
	
	public int inserPBoard(PBoardVO pBoardVO);
	
	public List<ProductVO> searchProductManuCate(@Param("product_name")String product_name);
	
	public ProductVO searchManufCategoty(@Param("product_id") String product_id);
	
	//main 페이지------------
	public List<PBoardVO> getMainPBoardList();
	
	public List<ProductVO> getMainProductList();
}
