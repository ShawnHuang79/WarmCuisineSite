package com.wcs.service;

import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

import com.wcs.entity.Customer;
import com.wcs.exception.WCSException;

public class BookingService {
	private BookingDAO dao = new BookingDAO();

	public Map<String, Byte> readAll(String date, String time) throws WCSException{
		if(date==null || time==null) {
			throw new IllegalArgumentException("訂位時需選擇日期及時間");
		}
		switch(time) {
			case"12:00AM":time="seat_byte_12";break;
			case"5:00PM":time="seat_byte_17";break;
			case"7:00PM":time="seat_byte_19";break;
		}
		Map<String, Byte> seatMapFromDB = dao.selectSeatsAllColumn(date, time);
		
		return seatMapFromDB;
	}
	
	public Map<String, Byte> readByKeySet(Set<String> keySet, String date, String time) throws WCSException{
		if(keySet==null) {
			throw new IllegalArgumentException("訂位時需選擇至少1個位置");
		}
		switch(time) {
			case"12:00AM":time="seat_byte_12";break;
			case"5:00PM":time="seat_byte_17";break;
			case"7:00PM":time="seat_byte_19";break;
		}
		Map<String, Byte> seatMapFromDB = dao.selectSeatColumn(keySet, date, time);
		return seatMapFromDB;
	}


}
