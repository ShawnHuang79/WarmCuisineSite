package com.wcs.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wcs.exception.WCSException;
import com.wcs.service.BookingService;

/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet.do")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errorList = new ArrayList<>();
		String[] seatList = request.getParameterValues("seat");
		//TODO 需要檢查資料間有沒有重複?如何檢查?
		if(seatList==null || seatList.length==0) {
			errorList.add("請選擇至少1個座位");
		}
		//TODO 多個位置有重複的A、B，應該只請求一次-用map，A是key，123是value。
		if(errorList.isEmpty()) {
			BookingService service = new BookingService();
			
			//將訂位分成每8個一組，以組別為key，選到的1-8號碼做value陣列，形成map{A=[1, 2, 3, 5], B=[1, 2]}
			Map<String, ArrayList<Character>> seatMap = new HashMap<>();
			for(int i=0; i<seatList.length; i++) {
				if(!seatMap.containsKey(seatList[i])) {
					seatMap.put(seatList[i], new ArrayList<Character>());
				}
				seatMap.get(seatList[i]).add(seatList[i].charAt(1));
			}
			try {
				Map<String, Byte> seatMapFromDB = service.read(seatMap.keySet());
				System.out.println(seatMapFromDB);
			} catch (WCSException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}

}
