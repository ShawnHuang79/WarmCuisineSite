package com.wcs.service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.wcs.entity.Color;
import com.wcs.entity.Outlet;
import com.wcs.entity.Product;
import com.wcs.entity.Size;
import com.wcs.exception.WCSException;

class ProductsDAO {
	private static final String SELECT_All_products = "SELECT id, name, unit_price, stock, "
			+ "	photo_url, description, launch_date, category, discount "
			+ "	FROM wcs.products_view";
	private static final String SELECT_Newest_products = SELECT_All_products
			+ "    WHERE launch_date <= curdate()\r\n"
			+ "    ORDER BY launch_date DESC LIMIT 3";
	private static final String SELECT_Keyword_products = SELECT_All_products
			+ "    WHERE name LIKE ?";
	private static final String SELECT_Category_products = SELECT_All_products
			+ "    WHERE category = ?";
	private static final String SELECT_Price_Inteval_products = SELECT_All_products
			+ "    WHERE unit_price BETWEEN ? AND ?";
	private static final String SELECT_Id_products = "SELECT id, name, unit_price, discount, photo_url, "
			+ "	description, launch_date, category, size, price "
			+ " FROM wcs.products_join_size_view"
			+ "    WHERE id= ?"
			+ "    ORDER BY price";
	
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
					list.add(productEntireData(rs));
				}
			}
		} catch (SQLException e) {
			throw new WCSException("[查詢產品]失敗",e);
		}
		return list;
	}
	List<Product> selectNewestProducts() throws WCSException{
		List<Product> list = new ArrayList<>();
		try (
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_Newest_products);
				){
			try(
					ResultSet rs = pstmt.executeQuery();
					){
				while(rs.next()) {
					list.add(productEntireData(rs));
				}
			}
		} catch (SQLException e) {
			throw new WCSException("[查詢最新產品]失敗",e);
		}
		return list;
	}
	List<Product> selectKeywordProducts(String keyword) throws WCSException{
		List<Product> list = new ArrayList<>();
		try (
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_Keyword_products);
				){
			//3.1這裡沒有?值
				pstmt.setString(1, '%'+keyword+'%');
			try(
					ResultSet rs = pstmt.executeQuery();
					){
				//處理rs
				while(rs.next()) {
					list.add(productEntireData(rs));
				}
			}
		} catch (SQLException e) {
			throw new WCSException("[依關鍵字查詢產品]失敗",e);
		}
		return list;
	}
	List<Product> selectCategoryProducts(String category) throws WCSException{
		List<Product> list = new ArrayList<>();
		try (
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_Category_products);
				){
			//3.1這裡沒有?值
				pstmt.setString(1, category);
			try(
					ResultSet rs = pstmt.executeQuery();
					){
				//處理rs
				while(rs.next()) {
					list.add(productEntireData(rs));
				}
			}
		} catch (SQLException e) {
			throw new WCSException("[依分類查詢產品]失敗",e);
		}
		return list;
	}
	List<Product> selectPriceIntevalProducts(double minPrice, double maxPrice) throws WCSException{
		List<Product> list = new ArrayList<>();
		try (
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_Price_Inteval_products);
				){
			//3.1這裡沒有?值
				pstmt.setDouble(1, minPrice);
				pstmt.setDouble(2, maxPrice);
			try(
					ResultSet rs = pstmt.executeQuery();
					){
				//處理rs
				while(rs.next()) {
					list.add(productEntireData(rs));
				}
			}
		} catch (SQLException e) {
			throw new WCSException("[依價格區間查詢產品]失敗",e);
		}
		return list;
	}

	Product selectIdProduct(String productId) throws WCSException {
		Product p = null;
		try (
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_Id_products);
				){
			//3.1
				pstmt.setString(1, productId);
				
			try(
					ResultSet rs = pstmt.executeQuery();
					){
				//處理rs
				while(rs.next()) {
					if(p==null) {
						int discount = rs.getInt("discount");
						if(discount>0) {
							p = new Outlet();
							((Outlet)p).setDiscount(discount);				
						}else {
							p = new Product();//如果沒有discount的就是一般商品
						}
						p.setId(rs.getInt("id"));
						p.setName(rs.getString("name"));
						p.setUnitPrice(rs.getDouble("unit_price"));
						//p.setStock(rs.getInt("stock"));
						p.setPhotoUrl(rs.getString("photo_url"));
						p.setDescription(rs.getString("description"));
						p.setLaunchDate(rs.getString("launch_date"));
						p.setCategory(rs.getString("category"));
						p = productEntireData(rs);
					}
						String sizeName = rs.getString("size");
						if(sizeName!=null) {
							Size size = new Size();
							size.setName(sizeName);
							size.setPrice(rs.getDouble("price"));
							p.addSize(size);
					
					}
				}
			}
		} catch (SQLException e) {
			throw new WCSException("[依ID查詢產品]失敗",e);
		}
		return p;
	}
	private Product productEntireData(ResultSet rs) throws SQLException {
		
		Product p;
		int discount = rs.getInt("discount");
		if(discount>0) {
			p = new Outlet();
			((Outlet)p).setDiscount(discount);				
		}else {
			p = new Product();//如果沒有discount的就是一般商品
		}
		p.setId(rs.getInt("id"));
		p.setName(rs.getString("name"));
		p.setUnitPrice(rs.getDouble("unit_price"));
		//p.setStock(rs.getInt("stock"));
		p.setPhotoUrl(rs.getString("photo_url"));
		p.setDescription(rs.getString("description"));
		p.setLaunchDate(rs.getString("launch_date"));
		p.setCategory(rs.getString("category"));
		
		//取出顏色資料
		/*String colorName = rs.getString("color_name");
		if(colorName!=null) {
			Color color = new Color();
			color.setColorName(colorName);
			color.setStock(rs.getInt("color_stock"));
			color.setPhotoUrl(rs.getString("color_photo"));
		}*/
		
		return p;
	}

}
