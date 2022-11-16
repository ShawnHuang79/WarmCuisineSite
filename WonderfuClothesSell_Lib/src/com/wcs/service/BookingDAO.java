package com.wcs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.Set;

import com.wcs.exception.WCSException;

class BookingDAO {

	private static final String SELECT_SEAT_COLUMN_BY_KEYSET ="SELECT "
			+ " seat_row_name, seat_byte "
			+ " FROM wcs.booking "
			+ " WHERE seat_row_name = ANY (?)";
	
	Map<String, Byte> selectSeatColumn(Set<String> keySet)  throws WCSException{
		Map<String, Byte> seatMapFromDB = null;
		String[] keySetArray = keySet.toArray(new String[keySet.size()]);
		try(
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_SEAT_COLUMN_BY_KEYSET);
		){
			pstmt.setArray(1, connection.createArrayOf("keySetArray", keySetArray));
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
