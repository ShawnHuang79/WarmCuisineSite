<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
	<head>
		<title>Booking Restaurant</title>

		<style>
			@import url(/wcs/css/wcs.css);
			
			#selectedoption{
				/*position: relative;
				top:100px;*/
				display:flex;
				flex-direction: row;
				justify-content: space-around;
				
			}
			#selectedoption, #selectedseats{
				padding: 20px;
			}
			
			.reservationSelected{
				width: 200px;
				height: 60px;
				font-size: 20px;
				
				text-align: center;
				
			}
			#bottom{
				position: relative;
				/*border:2px solid black;*/

			}
			.seatDiv{
				position: absolute;
				background-color:rgba(253,249,240,1);
				border-radius:5px;
				
			}

			.seatDiv label{
				border:2px solid black;
				border-radius:5px;
				text-align: center;
 				padding: 2px 0px;
				display: block;
				cursor: pointer;
				user-select: none;
				width: 30px;
				font-size: 1em;
			    
			}
			/*從後端傳來的資料透過data-status儲存，1就是有劃位了*/
			.seatDiv[data-status='1']{
				background-color: grey;
				
				color: white;
				
			}
			.seatDiv[data-status='1'] label{
				cursor: default;
			}
			input[type=checkbox]{
				display: none;
			}
			#selectedList{
				width: 425px;
			}
			input[type=submit]{
				cursor:pointer;
				background-color: black;
				color: white;
			}

		
		</style>
		<script src="https://code.jquery.com/jquery-3.0.0.js" 
	    	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
	    	crossorigin="anonymous">
		</script>
		<script>
			$(document).ready(init)
			
			function init(){
				$(".seatDiv").click(seatClickHandler);
			}
			var selectedArray = [];
			var numbersOfPoeple = ${param.number}
			function seatClickHandler(){
				//console.log($(this).find('input').prop("disable"));
				
				if($(this).find('input').attr("data-status")==0){
					if((!$(this).find('input').prop("checked")) && (selectedArray.length<numbersOfPoeple)){
						$(this).find('input').prop("checked","checked");
						$(this).css({"background-color": "#984B4B",  "color":"white"});
						selectedArray.push($(this).find('input').attr("data-position"));
						selectedArray.sort(function(s,t){//進行排序讓A2可以正確在A10前面
							var a = s.toLowerCase();
							var b = t.toLowerCase();
							if(a.length===2){
								a = a.slice(0, 1) + '0' +a.slice(-1);
							}
							if(b.length===2){
								b = b.slice(0, 1) + '0' +b.slice(-1);
							}
							if(a>b) return 1;
							if(a<b) return -1;
							return 0;
							//return a-b;
						})
						$("#selectedList").val(selectedArray);
					}else{
						$(this).find('input').prop("checked","");
						$(this).css({"background-color":"", "color":"black"});
						var index = selectedArray.indexOf($(this).find('input').attr("data-position"));
						if (index > -1) {
							selectedArray.splice(index, 1);
							}
						$("#selectedList").val(selectedArray);
						if(selectedArray.length == numbersOfPoeple){
							alert("座位已超過人數");
						}
					}
					
				}
				
			}
			function bookingHandler(){
				if(${param.number} > selectedArray.length){
					alert("所選座位數與人數不合");
					return false;
				}
				
				
			}
			//將從資料庫讀取來的十進位byte轉成看起來像2進位的8個數字，要送出時再想辦法把8個數字組合回一個byte送回資料庫
			//後端傳來的byte以位元轉成8位數字串，顯示在前端可看出座位是否已選，0沒選，1選了。
			/*function byteString(n) {
			  if (n < 0 || n > 255 || n % 1 !== 0) {
			      throw new Error(n + " does not fit in a byte");
			  }
			  return ("0000000" + n.toString(2)).substr(-8)
			}*/
// 			function 
<%-- 			<%=request.getAttribute("seatMapFromDB") %> --%>

			//將8個座位的0(沒選)或1(選擇)合成字串後轉成byte送去到後端，應該要去後端做。
			/*function bitToByte(bit1, bit2, bit3, bit4, bit5, bit6, bit7, bit8){
				return (Number)("0b" + bit1 + bit2 + bit3 + bit4 + bit5 + bit6 + bit7 + bit8);
			} */
			
			
			/*var a = byteString(5);
			alert(a);
			alert(bitToByte(0,0,0,0,0,1,0,0));*/
		</script>
	</head>
	<body>
<%-- 		<div><%=request.getAttribute("seatListFromDB") %></div> --%>
		<form action="booking.do" method="POST" onsubmit="return bookingHandler(event)">
			<div id='outer'>
				<div id='header'>
<!-- 					value還要再帶值 -->
					<div id='selectedoption'>
						<input type='text' class='reservationSelected' name='number' value='${param.number eq 1? param.number.concat(" person") : param.number.concat(" people")}' readonly>&nbsp;&nbsp;&nbsp;
						<input type='date' class='reservationSelected' name='date' value='${param.date}' readonly>&nbsp;&nbsp;&nbsp;
						<input type='text' class='reservationSelected' name='time' value='${param.time}' readonly>
					</div>
					<div id='selectedseats'>
						<input type='text' id=selectedList class='reservationSelected' value='' placeholder='Choosed Seats' readonly>&nbsp;&nbsp;&nbsp;
						<input type='submit' class='reservationSelected' value='Find Seats' readonly>
					</div>
					
				</div>
				<div id='bottom'>
					<%--比對到一樣就要將data-status="1"並且套顏色，這樣上面的seatClickHandler就無法改了 --%>
					<%
					/*int xSite= 525;
					int ySite= -150;
					int originSite= 300;
					int curve= 100;
					int position= 50;*/
					ArrayList<String> seatListFromDB = (ArrayList)request.getAttribute("seatListFromDB");
					//System.out.println(seatListFromDB);
					int xSite= 730;
					int ySite= 275;
					int originSite= 120;
					int curve= 80;
					int position= 35;
					for (int i=1; i<9;i++){ %>
						<%--(x-600)^2=4*400*(y+300)，600,300影響x,y切點位置，400影響弧度數字越小就越大，400正負影響上下開口；originSite + 3.5*position需=x或ysite就能置中--%>
						<div class='seatDiv' data-status='<%=seatListFromDB.get(i-1) %>' style="top:<%=originSite+i*position%>px;left:<%=((originSite+i*position-ySite)*(originSite+i*position-ySite)/(-4*curve))+xSite%>px;">
							<input type="checkbox" class="seat" name="seat" data-position='A<%=i%>' data-status='<%=seatListFromDB.get(i-1) %>' value="A<%=i%>">
							<label><%=i%></label>
						</div> 
<%-- 						<div class='seatDiv' style="top:<%=(((originSite+i*position-xSite)*(originSite+i*position-xSite))/(-4*curve))-ySite%>px;left:<%=originSite+i*position%>px;"> --%>
<%-- 							<input type="checkbox" class="seat" name="seat" data-status="0" value="A<%=i%>"> --%>
<%-- 							<label><%=i%></label> --%>
<!-- 						</div> -->
					<%} %>
					<%
// 					
					List<Integer> seatRowNumber = new ArrayList<>();
					seatRowNumber.add(16);//座位由上而下的數量
					seatRowNumber.add(12);
					seatRowNumber.add(12);
					seatRowNumber.add(16);
					//給座位號碼
					int seatListSerialNumber = 0;
					List<String> seatRowCode = new ArrayList<>();
					for(char i='B'; i<'I'; i++){
						for(int j=1; j<9; j++){
							seatRowCode.add(""+i+j);
						}
					}
// 					System.out.println(seatRowCode);
						
					char frontEndRowCode = 'B';
					for (int i=0; i<4;i++, frontEndRowCode++){ 
						for(int j=1; j<seatRowNumber.get(i)+1;j++, seatListSerialNumber++){%>
							<div class='seatDiv' data-status='<%=seatListFromDB.get(seatListSerialNumber+8) %>' style="top:<%=50+i*150%>px;left:<%=(j-1)*45%>px;">
								<input type="checkbox" class="seat" name="seat" data-position='<%=""+frontEndRowCode+j%>' data-status='<%=seatListFromDB.get(seatListSerialNumber+8) %>' value="<%=seatRowCode.get(seatListSerialNumber)%>">
								<label><%=j%></label>
							</div>
					<%	}
					} %>
				</div>
			</div>
		</form>
		
	</body>
</html>