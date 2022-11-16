package com.wcs.service;

import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

import com.wcs.entity.Customer;
import com.wcs.exception.WCSException;

public class BookingService {
	private BookingDAO dao = new BookingDAO();

	public Map<String, Byte> read(Set<String> keySet) throws WCSException{
		if(keySet==null) {
			throw new IllegalArgumentException("訂位時需選擇至少1個位置");
		}
		Map<String, Byte> seatMapFromDB = dao.selectSeatColumn(keySet);
		return seatMapFromDB;
	}


}
