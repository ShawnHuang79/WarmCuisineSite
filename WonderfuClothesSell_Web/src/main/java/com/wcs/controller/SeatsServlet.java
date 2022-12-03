package com.wcs.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wcs.exception.WCSException;
import com.wcs.service.BookingService;

/**
 * Servlet implementation class Seats
 */
@WebServlet(name = "SeatsServlet", urlPatterns = { "/seats.do" })
public class SeatsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeatsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errorList = new ArrayList<>();
		String number = request.getParameter("number");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		
		//這裡沒有檢查各個資料的格式，只檢查null
		if(number!=null && date!=null && time!=null) {
			BookingService service = new BookingService();
			try {
				Map<String, Byte> seatMapFromDB = service.readAll(date, time);
				ArrayList<String> seatListFromDB= StatusCodeForAtoH(seatMapFromDB);
				//和下面的response.sendRedirect("bookingSeats.jsp");2選1
				
				request.setAttribute("seatListFromDB", seatListFromDB);
				RequestDispatcher dispatcher = request.getRequestDispatcher("bookingSeats.jsp");
	    		dispatcher.forward(request, response);
	    		//System.out.println(seatListFromDB);
	    		return;  
				
			}catch(WCSException e) {
				e.printStackTrace();
			}
		}
		//TODO 要改bookingSeats.jsp路徑到member裡面
		//response.sendRedirect("bookingSeats.jsp");
		
		
	}
	//把資料庫讀出來的結果轉成List準備往前端送，搭配給號器修改status為1或0
	protected ArrayList<String> StatusCodeForAtoH(Map<String, Byte> seatMapFromDB) {
		ArrayList<String> seatListFromDB = new ArrayList<>();
		char rowCode ='A';
		for(int i=0; i<seatMapFromDB.size(); i++, rowCode++) {
			String bitString = byteToString(seatMapFromDB.get(""+rowCode));//以seatMapFromDB的key取得其value並傳進byteToString得到代表bit的string
			for(int j=0; j<8; j++) {
				seatListFromDB.add(bitString.substring(j, j+1));

			}
		}
		//System.out.println(seatListFromDB);
		return seatListFromDB;
	}
	protected String byteToString(byte seatByte) {
		  if (seatByte < -128 || seatByte > 127 || seatByte % 1 != 0) {
		      throw new Error(seatByte + " does not fit in a byte");
		  }
		  String bitString = String.format("%8s", Integer.toBinaryString(seatByte & 0xFF)).replace(' ', '0');
		  return bitString;
	}

}
