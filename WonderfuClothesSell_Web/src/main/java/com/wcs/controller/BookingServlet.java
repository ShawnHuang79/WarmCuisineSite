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
import javax.servlet.http.HttpSession;

import com.wcs.entity.Customer;
import com.wcs.exception.WCSException;
import com.wcs.service.BookingService;
import com.wcs.service.MailService;

/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/booking.do")
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
		HttpServletRequest httpRequest = ((HttpServletRequest)request);
		HttpSession session = httpRequest.getSession();
		List<String> errorList = new ArrayList<>();
		String[] seatList = request.getParameterValues("seat");
		//TODO 需要檢查資料間有沒有重複?如何檢查?
		if(seatList==null || seatList.length==0) {
			errorList.add("請選擇至少1個座位");
		}
		//多個位置有重複的A、B，應該只請求一次-用map，A是key，123是value。
		if(errorList.isEmpty()) {
			BookingService service = new BookingService();
			//傳過來的String沒處理，key值變成A1、A2、B1了，之前是用charAt(0)
			//將訂位分成每8個一組，以組別為key，選到的1-8號碼做value陣列，形成map{A=[1, 2, 3, 5], B=[1, 2]}
			Map<String, ArrayList<String>> seatMap = new HashMap<>();
			for(int i=0; i<seatList.length; i++) {
				if(!seatMap.containsKey(seatList[i].substring(0, 1))) {
					seatMap.put(seatList[i].substring(0, 1), new ArrayList<String>());
				}
				seatMap.get(seatList[i].substring(0, 1)).add(seatList[i].substring(1, 2));
			}
			System.out.println("前端傳來的map:" +seatMap);
			//用使用者輸入的key(A、B、C)去找"查詢"資料庫吻合的PKey的值出來做後續處理

			Customer member = (Customer)session.getAttribute("member");
			String name = null;
			if(member!=null) {
				name = member.getName();
			}else {
				name = "黃曉泓";
			}
			
			//TODO 寫死的測試email
			String email = "bancohuang29@gmail.com";
			String seats = request.getParameter("seats");
			String date = request.getParameter("date");
			String time = request.getParameter("time");
			
			try {
				Map<String, Byte> seatMapFromDB = service.readByKeySet(seatMap.keySet(), date, time);
				Map<String, Byte> seatMapResultToDB = new HashMap<>();
				System.out.println("seatMapFromDB回傳結果:" + seatMapFromDB);
				/*seatMap
				seatMapFromDB*/
				for(String key: seatMap.keySet()) {
					byte seatMapValueToByte = bitToByte(seatMap.get(key));
					byte seatMapFromDBByte = seatMapFromDB.get(key);
					//System.out.println(seatMapValueToByte&seatMapFromDBByte);
					//System.out.println(seatMapValueToByte^seatMapFromDBByte);
					//比對seatMapFromDB和seatMap取出的value，
					if((seatMapValueToByte&seatMapFromDBByte) ==0) {
						//兩個值做^之後的結果輸出成map送到service做update資料庫資料
						seatMapResultToDB.put(key, (byte)(seatMapValueToByte^seatMapFromDBByte));
					}//應該拋出並處理錯誤
					
				}
				System.out.println(seatMapResultToDB);
				service.update(seatMapResultToDB, date, time);
				
				//redirect到特定網頁
				/*String submitPath = request.getParameter("submitPath");
				if(submitPath!=null) {
					response.sendRedirect(submitPath);
					return;
				}*/
				
				//送出email
				
				MailService.sendHelloMailWithLogo(name, email, seats, date, time);
				response.sendRedirect("seats_ok.jsp");		
				
			} catch (WCSException e) {
				e.printStackTrace();
			}
		}
	}
	//seatMap的value要用method轉成byte
	protected byte bitToByte(ArrayList<String> seatBit) {
		String bit1 = "0";
		String bit2 = "0";
		String bit3 = "0";
		String bit4 = "0";
		String bit5 = "0";
		String bit6 = "0";
		String bit7 = "0";
		String bit8 = "0";
		for(int i=0; i<seatBit.size(); i++) {
			switch(seatBit.get(i)) {
				case"1": bit1 = "1";break;
				case"2": bit2 = "1";break;
				case"3": bit3 = "1";break;
				case"4": bit4 = "1";break;
				case"5": bit5 = "1";break;
				case"6": bit6 = "1";break;
				case"7": bit7 = "1";break;
				case"8": bit8 = "1";break;
			}
		}
		String seatString = bit1 + bit2 + bit3 + bit4 + bit5 + bit6 + bit7 + bit8;
		//System.out.println(seatString);
		byte seatByte = (byte)Integer.parseInt(seatString, 2);
		//System.out.println(seatByte);
		return seatByte;
	}

}
