package web.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import web.spring.mapper.ProductMapper;
import web.spring.vo.CodeVO;
import web.spring.vo.Criteria;
import web.spring.vo.PBoardVO;
import web.spring.vo.ProductVO;
import web.spring.vo.UserVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Setter(onMethod_= @Autowired)
	private ProductMapper productMapper;
	
	@Override
	public List<ProductVO> getProductList(Criteria cri) {
		return productMapper.getProductList(cri);
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
	public List<ProductVO> searchProductCategory(String code_type, String code_value) {
		return productMapper.searchProductCategory(code_type, code_value);
	}

	@Override
	public int insertCodeInfo(String code_type, String code_value) {
		return productMapper.insertCodeInfo(code_type, code_value);
	}

	@Override
	public List<ProductVO> searchManuCate(String product_manufacturer, String product_category) {
		return productMapper.searchManuCate(product_manufacturer, product_category);
	}

	@Override
	public int inserPBoard(PBoardVO pBoardVO) {
		return productMapper.inserPBoard(pBoardVO);
	}

	@Override
	public List<ProductVO> searchProductManuCate(String product_name) {
		return productMapper.searchProductManuCate(product_name);
	}

	@Override
	public ProductVO searchManufCategoty(String product_id) {
		return productMapper.searchManufCategoty(product_id);
	}

	@Override
	public List<ProductVO> getCondList(String pboard_unit_condition) {
		return productMapper.getCondList(pboard_unit_condition);
	}

	@Override
	public List<PBoardVO> getCondBoardList(String pboard_unit_condition) {
		return productMapper.getCondBoardList(pboard_unit_condition);
	}
	
	//검색

	@Override
	public List<ProductVO> getSearchProductList(Map<String, Object> search_Map) {
		return productMapper.getSearchProductList(search_Map);
	}

	@Override
	public List<PBoardVO> getSearchBoardList(Map<String, Object> search_Map) {
		return productMapper.getSearchBoardList(search_Map);
	}
	
	//메인
	@Override
	public List<PBoardVO> getMainPBoardList() {
		return productMapper.getMainPBoardList();
	}

	@Override
	public List<ProductVO> getMainProductList() {
		return productMapper.getMainProductList();
	}

	@Override
	public List<PBoardVO> getAllPBoardList(Criteria cri) {
		return productMapper.getAllPBoardList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return productMapper.getTotal(cri);
	}

	@Override
	public int updatepBoard(PBoardVO pBoardVO) {
		return productMapper.updatepBoard(pBoardVO);
	}

	@Override
	public int getProductTotal(Criteria cri) {
		return productMapper.getProductTotal(cri);
	}

	@Override
	public List<ProductVO> getProductAllList() {
		return productMapper.getProductAllList();
	}

	@Override
	public int updateProduct(ProductVO productVO) {
		return productMapper.updateProduct(productVO);
	}

	@Override
	public List<PBoardVO> getUserPBoardList(String user_id, Criteria cri) {
		return productMapper.getUserPBoardList(user_id, cri.getPageNo(), cri.getAmount(), cri.getOrderby());
	}

	@Override
	public int getPboardUserTotal(String user_id, Criteria cri) {
		return productMapper.getPboardUserTotal(user_id, cri.getPageNo(), cri.getAmount());
	}

	@Override
	public CodeVO getCode(String code_type, String code_value) {
		return productMapper.getCode(code_type, code_value);
	}

	@Override
	public int insertCode(String code_type, String code_value) {
		return productMapper.insertCode(code_type, code_value);
	}

	@Override
	public String getProductSeq() {
		return productMapper.getProductSeq();
	}

	@Override
	public int productInfoInsert(ProductVO productVO) {
		return productMapper.productInfoInsert(productVO);
	}

	@Override
	public List<PBoardVO> getHistoryProduct(Map<String, Object> history_Map) {
		return productMapper.getHistoryProduct(history_Map);
	}

	@Override
	public List<ProductVO> getMainRecommendList(Map<String, Object> search_Map) {
		return productMapper.getMainRecommendList(search_Map);
	}

	@Override
	public List<PBoardVO> getRecommendBoardList() {
		return productMapper.getRecommendBoardList();
	}


	
}
