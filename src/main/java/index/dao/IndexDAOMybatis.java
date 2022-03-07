package index.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import product.bean.CategoryDTO;
import product.bean.ProductDTO;

@Repository
@Transactional
public class IndexDAOMybatis implements IndexDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override	
	public List<ProductDTO> getProductList(Map param) {
		return sqlSession.selectList("indexSQL.getProductList", param);

	}

	@Override
	public int wishProduct(String id) {
		return sqlSession.selectOne("indexSQL.wishProduct", id);
	}

	@Override
	public List<ProductDTO> searchProductList(Map map) {
		return sqlSession.selectList("indexSQL.searchProductList", map);
	}

	@Override
	public int searchProductCount(Map map) {
		return sqlSession.selectOne("indexSQL.searchProductCount", map);
	}

	@Override
	public List<ProductDTO> recentlyList(List<String> list) {
		return  sqlSession.selectList("indexSQL.recentlyList", list);
	}

	@Override
	public List<ProductDTO> cateProductList(Map<String, Object> map) {
		return sqlSession.selectList("indexSQL.cateProductList", map);
	}

	@Override
	public int cateProductCount(Map<String, Object> map) {
		return sqlSession.selectOne("indexSQL.cateProductCount", map);
	}

	@Override
	public List<CategoryDTO> categoryList() {
		return sqlSession.selectList("indexSQL.categoryList");
	}

	@Override
	public String cateParentName(String cate_code) {
		return sqlSession.selectOne("indexSQL.cateParentName", Integer.parseInt(cate_code));
	}

	@Override
	public String cateCodeName(String cate_code) {
		return sqlSession.selectOne("indexSQL.cateCodeName", Integer.parseInt(cate_code));
	}
	
	
	
	
	
	
}
