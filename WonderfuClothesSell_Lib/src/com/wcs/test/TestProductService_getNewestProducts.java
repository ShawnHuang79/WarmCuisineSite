package com.wcs.test;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.wcs.entity.Product;
import com.wcs.exception.WCSException;
import com.wcs.service.ProductService;

public class TestProductService_getNewestProducts {

	public static void main(String[] args) {
		ProductService service = new ProductService();
		try{
			List<Product> list = service.getNewestProducts();
			for(int i=0;i<list.size();i++) {
				Product p = list.get(i);
				if(p!=null) {
					System.out.println("id:"+p.getId());
					System.out.println("name:"+p.getName());
					System.out.println("unitPrice:"+p.getUnitPrice());
					System.out.println("stock:"+p.getStock());
					System.out.println("url:"+p.getPhotoUrl());
					System.out.println("launchdate:"+p.getLaunchDate());
					//System.out.println("折扣:"+p instanceOf());
					
				}
			}
			//System.out.println(list);
		}catch(WCSException e) {
			Logger.getLogger("").log(
					Level.SEVERE, e.getMessage(), e);
		}
	}

}
