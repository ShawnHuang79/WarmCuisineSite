package com.wcs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.wcs.exception.WCSException;

class BookingDAO {

	private static final String SELECT_SEAT_COLUMN ="SELECT "
			+ " seat_row_name, seat_byte "
			+ " FROM wcs.booking "
			+ " WHERE seat_row_name IN ";
	
			
	Map<String, Byte> selectSeatColumn(Set<String> keySet)  throws WCSException{
		//依照陣列值的數量設定?並設定pstmt對應數量。
		//因傳進來的值經過檢查，必有一筆以上，預設(?並在離開for後加上)
		String keySetToMark = "(?";
		for(int i=0; i<keySet.size()-1; i++) {
			keySetToMark += ",?";
		}
		keySetToMark += ")";
		
		final String SELECT_SEAT_COLUMN_BY_KEYSET = SELECT_SEAT_COLUMN + keySetToMark;
		//System.out.println("SQL程式:" + SELECT_SEAT_COLUMN_BY_KEYSET);
		
		Map<String, Byte> seatMapFromDB = new HashMap<>();
		String[] keySetArray = keySet.toArray(new String[keySet.size()]);
		try(
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_SEAT_COLUMN_BY_KEYSET);
		){
			//pstmt.setArray(1, connection.createArrayOf("keySetArray", keySetArray));
			for(int i=0; i<keySetArray.length; i++) {
				pstmt.setString(i+1, keySetArray[i]);
			}
			try(
				ResultSet rs = pstmt.executeQuery();	
			){
				while(rs.next()) {
					seatMapFromDB.put(rs.getString("seat_row_name"), rs.getByte("seat_byte"));
				}
			}
			
			
		}catch(SQLException e) {
			throw new WCSException("讀取座位狀態失敗", e);
		}
		
		return seatMapFromDB;
	}

}
