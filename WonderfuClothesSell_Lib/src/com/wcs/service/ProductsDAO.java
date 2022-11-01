package com.wcs.service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.wcs.entity.Outlet;
import com.wcs.entity.Product;
import com.wcs.exception.WCSException;

class ProductsDAO {
	private static final String SELECT_All_products = "SELECT id, vendor, name, unit_price, stock,\r\n"
			+ "	photo_url, description, launch_date, category, discount\r\n"
			+ "	FROM wcs.products";
	private static final String SELECT_Newest_products = "SELECT id, vendor, name, unit_price, stock,\r\n"
			+ "	photo_url, description, launch_date, category, discount\r\n"
			+ "	FROM wcs.products\r\n"
			+ "    WHERE launch_date <= curdate()\r\n"
			+ "    ORDER BY launch_date DESC LIMIT 3";
	
	private static final String SELECT_Keyword_products = "SELECT id, vendor, name, unit_price, stock,\r\n"
			+ "	photo_url, description, launch_date, category, discount\r\n"
			+ "	FROM wcs.products\r\n"
			+ "    WHERE name LIKE '%雞%'";
	private static final String SELECT_Category_products = "SELECT id, vendor, name, unit_price, stock,\r\n"
			+ "	photo_url, description, launch_date, category, discount\r\n"
			+ "	FROM wcs.products\r\n"
			+ "    WHERE category ='飲料'";
	private static final String SELECT_Price_Inteval_products = "SELECT id, vendor, name, unit_price, stock,\r\n"
			+ "	photo_url, description, launch_date, category, discount\r\n"
			+ "	FROM wcs.products\r\n"
			+ "    WHERE unit_price BETWEEN 50 AND 100";
	List<Product> selectAllProducts() throws WCSException{
		List<Product> list = new ArrayList<>();
		
		
		try (
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_All_products);
				){
			//3.1這裡沒有?值
			try(
					ResultSet rs = pstmt.executeQuery();
					){
				//處理rs
				while(rs.next()) {
					Product p;
					int discount = rs.getInt("discount");
					if(discount>0) {
						p = new Outlet();
						((Outlet)p).setDiscount(discount);				
					}else {
						p = new Product();//如果沒有discount的就是一般商品
					}
					p.setId(rs.getInt("id"));//TODO 其他的資料都要搬下來，注意vendor是新的，依照需要加入
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setDescription(rs.getString("description"));
					p.setLaunchDate(rs.getString("launch_date"));
					
					list.add(p);
					
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


	List<Product> selectNewestProducts() throws WCSException{
		List<Product> list = new ArrayList<>();
		
		
		try (
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_Newest_products);
				){
			//3.1這裡沒有?值
			try(
					ResultSet rs = pstmt.executeQuery();
					){
				//處理rs
				while(rs.next()) {
					Product p;
					int discount = rs.getInt("discount");
					if(discount>0) {
						p = new Outlet();
						((Outlet)p).setDiscount(discount);				
					}else {
						p = new Product();//如果沒有discount的就是一般商品
					}
					p.setId(rs.getInt("id"));//TODO 其他的資料都要搬下來，注意vendor是新的，依照需要加入
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setDescription(rs.getString("description"));
					p.setLaunchDate(rs.getString("launch_date"));
					
					list.add(p);
					
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


	List<Product> selectKeywordProducts() throws WCSException{
		List<Product> list = new ArrayList<>();
		
		
		try (
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_Keyword_products);
				){
			//3.1這裡沒有?值
			try(
					ResultSet rs = pstmt.executeQuery();
					){
				//處理rs
				while(rs.next()) {
					Product p;
					int discount = rs.getInt("discount");
					if(discount>0) {
						p = new Outlet();
						((Outlet)p).setDiscount(discount);				
					}else {
						p = new Product();//如果沒有discount的就是一般商品
					}
					p.setId(rs.getInt("id"));//TODO 其他的資料都要搬下來，注意vendor是新的，依照需要加入
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setDescription(rs.getString("description"));
					p.setLaunchDate(rs.getString("launch_date"));
					
					list.add(p);
					
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


	List<Product> selectCategoryProducts() throws WCSException{
		List<Product> list = new ArrayList<>();
		
		
		try (
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_Category_products);
				){
			//3.1這裡沒有?值
			try(
					ResultSet rs = pstmt.executeQuery();
					){
				//處理rs
				while(rs.next()) {
					Product p;
					int discount = rs.getInt("discount");
					if(discount>0) {
						p = new Outlet();
						((Outlet)p).setDiscount(discount);				
					}else {
						p = new Product();//如果沒有discount的就是一般商品
					}
					p.setId(rs.getInt("id"));//TODO 其他的資料都要搬下來，注意vendor是新的，依照需要加入
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setDescription(rs.getString("description"));
					p.setLaunchDate(rs.getString("launch_date"));
					
					list.add(p);
					
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


	List<Product> selectPriceIntevalProducts() throws WCSException{
		List<Product> list = new ArrayList<>();
		
		
		try (
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_Price_Inteval_products);
				){
			//3.1這裡沒有?值
			try(
					ResultSet rs = pstmt.executeQuery();
					){
				//處理rs
				while(rs.next()) {
					Product p;
					int discount = rs.getInt("discount");
					if(discount>0) {
						p = new Outlet();
						((Outlet)p).setDiscount(discount);				
					}else {
						p = new Product();//如果沒有discount的就是一般商品
					}
					p.setId(rs.getInt("id"));//TODO 其他的資料都要搬下來，注意vendor是新的，依照需要加入
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setDescription(rs.getString("description"));
					p.setLaunchDate(rs.getString("launch_date"));
					
					list.add(p);
					
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
