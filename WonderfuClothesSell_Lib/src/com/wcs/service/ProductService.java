package com.wcs.service;

import java.util.List;

import com.wcs.entity.Product;
import com.wcs.exception.WCSException;

public class ProductService {
	private ProductsDAO dao = new ProductsDAO();
	public List<Product> getAllProducts() throws WCSException{
		return dao.selectAllProducts();
	}
	public List<Product> getNewestProducts()throws WCSException{
		return dao.selectNewestProducts();
	}
	public List<Product> getKeywordProducts()throws WCSException{
		return dao.selectKeywordProducts();
	}
	public List<Product> getCategoryProducts()throws WCSException{
		return dao.selectCategoryProducts();
	}
	public List<Product> getPriceIntevalProducts()throws WCSException{
		return dao.selectPriceIntevalProducts();
	}
	
	
}
