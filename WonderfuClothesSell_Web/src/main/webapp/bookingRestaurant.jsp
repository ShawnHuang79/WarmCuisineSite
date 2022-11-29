<%@page pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
	<head>
		<title>Booking Restaurant</title>
		<script src="https://code.jquery.com/jquery-3.0.0.js" 
	    	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		<style>
			#bigSize{
				position: relative;
				height: 200px;
			}
			#bottom{
				position: relative;
				border:2px solid black;
				
			}
			.seatDiv{
				position: absolute;
			}
		
		</style>
		

		<script>
			//將從資料庫讀取來的十進位byte轉成看起來像2進位的8個數字，要送出時再想辦法把8個數字組合回一個byte送回資料庫
			//後端傳來的byte以位元轉成8位數字串，顯示在前端可看出座位是否已選，0沒選，1選了。
			function byteString(n) {
			  if (n < 0 || n > 255 || n % 1 !== 0) {
			      throw new Error(n + " does not fit in a byte");
			  }
			  return ("0000000" + n.toString(2)).substr(-8)
			}
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
		<form action="BookingServlet.do" method="POST">
			<div id='outer'>
				<div id='bigSize'></div>
				<div id='bottom'>
					<%for (int i=0; i<8;i++){ %>
						<div class='seatDiv' style="top:<%=(((250+i*100-600)*(250+i*100-600))/(-4*300))+150%>px;left:<%=250+i*100%>px;"><input type="checkbox" class="seat" name="seat" value="'A'+'<%=i%>'"><label>A<%=i%></label></div>
					<%} %>
<!-- 					<input type="checkbox" class="seat" name="seat" value="A2"><label>A2</label> -->
<!-- 					<input type="checkbox" class="seat" name="seat" value="A3"><label>A3</label> -->
<!-- 					<input type="checkbox" class="seat" name="seat" value="B1"><label>B1</label> -->
<!-- 					<input type="checkbox" class="seat" name="seat" value="B2"><label>B2</label> -->
<!-- 					<input type="checkbox" class="seat" name="seat" value="C1"><label>C1</label> -->
<!-- 					<input type="checkbox" class="seat" name="seat" value="C2"><label>C2</label> -->
<!-- 					<input type="checkbox" class="seat" name="seat" value="D1"><label>D1</label> -->
<%-- 					<input type="text" value="${paramValues.seat}"> --%>
					<input type="submit" value="繼續" class="submit">
				</div>
			</div>
		</form>
		
	</body>
</html>