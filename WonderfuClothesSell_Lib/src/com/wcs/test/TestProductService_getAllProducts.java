package com.wcs.test;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.wcs.entity.Product;
import com.wcs.exception.WCSException;
import com.wcs.service.ProductService;

public class TestProductService_getAllProducts {

	public static void main(String[] args) {
		ProductService service = new ProductService();
		try{
			Product list = service.getIdProduct("3");
			System.out.println(list);
		}catch(WCSException e) {
			Logger.getLogger("").log(
					Level.SEVERE, e.getMessage(), e);
		}
	}
}
