package web.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;

public interface ProductMapper {
	public List<ProductVO> getProductList(); // �긽�뭹 �쟾泥� 議고쉶
	
	public List<PBoardVO> getPBoardList(); // �긽�꽭�럹�씠吏� �쟾泥� 議고쉶
	
	public List<ProductVO> getTypeList(String product_category); //type 寃��깋 �빐�떦紐⑸줉 1~5異쒕젰
	
	public List<PBoardVO> getTypeBoardList(String product_category); //type 寃��깋 �빐�떦 �긽�꽭�럹�씠吏� 1~5異쒕젰
	
	public PBoardVO getProduct(String no);//product_no濡� �긽�꽭�럹�씠吏� 議고쉶
	
	public ProductVO getProductInfo(String product_id); //�긽�꽭�럹�씠吏� �궡�뿉 �엳�뒗 product_id濡� �긽�뭹 議고쉶
	
	public int productInfoInsert(ProductVO productVO); //�긽�뭹 異붽�
	
	public int productInfoDelete(ProductVO productVO); //�긽�뭹 �궘�젣
	
	public List<String> searchProductCategory(@Param("code_type")String code_type, @Param("code_value") String code_value);
	
	public int insertCodeInfo(@Param("code_type")String code_type, @Param("code_value") String code_value);
	
	
}
