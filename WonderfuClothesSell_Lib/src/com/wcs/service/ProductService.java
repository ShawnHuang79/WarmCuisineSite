package com.wcs.service;

import java.util.List;

import com.wcs.entity.Product;
import com.wcs.entity.Size;
import com.wcs.exception.WCSException;

public class ProductService {
	private ProductsDAO dao = new ProductsDAO();
	public List<Product> getAllProducts() throws WCSException{
		return dao.selectAllProducts();
	}
	public List<Product> getNewestProducts()throws WCSException{
		return dao.selectNewestProducts();
	}
	public List<Product> getKeywordProducts(String keyword)throws WCSException{
		if(keyword==null || keyword.length()==0) {
			throw new IllegalArgumentException("產品查詢時需有1個以上的關鍵字");
		}
		return dao.selectKeywordProducts(keyword);
	}
	public List<Product> getCategoryProducts(String category)throws WCSException{
		if(category==null || category.length()==0) {
			throw new IllegalArgumentException("產品分類查詢必須有值");
		}
		return dao.selectCategoryProducts(category);
	}
	public List<Product> getPriceIntevalProducts(double minPrice, double maxPrice)throws WCSException{
		return dao.selectPriceIntevalProducts(minPrice, maxPrice);
	}
	public Product getIdProduct(String productId)throws WCSException{
		if(productId==null || productId.length()==0) {
			throw new IllegalArgumentException("產品id查詢時需有1個以上的關鍵字");
		}
		return dao.selectIdProduct(productId);
	}
	
	//產品+顏色+尺寸1對多對多用
	public List<Size> getSizeList(String productId, String colorName)throws WCSException{
		if(productId==null) throw new IllegalArgumentException("查詢size時必須有產品編號值");
		return dao.selectSizeList(productId,colorName);
	}
}
