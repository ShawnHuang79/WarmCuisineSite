<%@page pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
	<head>
		<title>Booking Restaurant</title>

		<style>
			@import url(/wcs/css/wcs.css);
			/*#header{
				position: relative;
				height: 200px;
			}*/
			/*#bottom{
				position: relative;
				border:2px solid black;

			}*/
			#logo, #nav, #reservationDiv{
				font-size:5em;
				color:#fdf9f0;/*#fdf9f0 #984B4B*/
				position:absolute;
				top:15%;
				left:30%;
				font-weight: bolder;
				/*background-color: ()*/
			}
			#nav{
				font-size:1.3em;
				top:30%;
				left:40%;
				width:400px;
				display:flex;
				flex-direction: row;
				justify-content:space-between;
				color:black;
			}
			#reservationDiv{
				font-size: 2em;
				top: 50%;
				left: 40%;
				color:black;
				font-weight:normal;
			}
			.navText{
				/*padding:10px;*/
			}
			#nav a:visited{
				color:black;
			}
			body{
				background-image:url(/wcs/images/bookingBackground.jpg);
			}
			.seatDiv{
				position: absolute;
				background-color:rgba(253,249,240,1);
			}
			.seatDiv label{
				border:2px solid black;
				border-radius:5px;
				text-align: center;
 				padding: 10px;
			    display: block;
			    cursor: pointer;
			    user-select: none;
			    
			}
			.seat{
			}
			input[type=checkbox]{
				display: none;
			}
			.reservationSelect{
				width: 200px;
				height: 60px;
				font-size: 20px;
				
			}
			#reservationDetailsInner, #reservationSubmit{
				margin: 20px 0px;			
			}
			
			
			#reservationSubmit{
				background-color: black;
				color: #fdf9f0;
				position: relative;
				left: 14%;
			}
			#reservationDetails{
				
			}
			#reservationDetailsInner{
				position: relative;
				left: -20%;
    
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
				checkReservationDate();
			}
			function seatClickHandler(){
				console.log($(this).find('input').prop("disable"));
				
				if($(this).find('input').attr("data-status")==0){
					if(!$(this).find('input').prop("checked")){
						$(this).find('input').prop("checked","checked");
						$(this).css({"background-color": "#984B4B", "border-radius": "5px", "color":"white"});
					}else{
						$(this).find('input').prop("checked","");
						$(this).css({"background-color":"", "color":"black"});
					}
				}
			}
			function checkReservationDate(){
				var date = new Date();
				
				var yearForMin = date.getFullYear();
				var monthForMin = date.getMonth()+1 <10? "0"+(date.getMonth()+1) : date.getMonth()+1;
				var dateForMin = date.getDate() <10? "0"+date.getDate() : date.getDate();
				date.setDate(date.getDate()+14);
				var yearForMax = date.getFullYear();
				var monthForMax = date.getMonth()+1 <10? "0"+(date.getMonth()+1) : date.getMonth()+1;
				var dateForMax = date.getDate() <10? "0"+date.getDate() : date.getDate();
				
				$("#selectDate").attr("value", yearForMin + "-" + monthForMin + "-" + dateForMin);
 				$("#selectDate").attr("min", yearForMin + "-" + monthForMin + "-" + dateForMin);
 				$("#selectDate").attr("max", yearForMax + "-" + monthForMax + "-" + dateForMax);
 				
 				
			}
			
			
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
		<div id='logoAndNav'>
			<div id="logo">Warm Cuisine Site</div>
			<div id="nav">
				<div class='navText'><a href='/wcs/products_list.jsp'>START TASTE</a></div>
				<div><img src="/wcs/images/fork.png"></div>
				<div class='navText'><a href='/wcs/booking.jsp'>RESERVATION</a></div>
			</div>
			<div id="reservationDiv">
				<div id=>Make &nbsp;&nbsp; a &nbsp;&nbsp;Reservation</div>
				<div >
					<form id="reservationDetails" action="BookingServlet.do" method="POST">
						<div id="reservationDetailsInner">
							<select class='reservationSelect' name="selectNumber">
								<option value='1'>1 person</option>
								<option value='2'>2 people</option>
								<option value='3'>3 people</option>
								<option value='4'>4 people</option>
								<option value='5'>5 people</option>
								<option value='6'>6 people</option>
								<option value='7'>7 people</option>
								<option value='8'>8 people</option>
							</select>
							<input type='date' id='selectDate' class='reservationSelect' name="selectDate">
		<!-- 					<select class='reservationSelect' name="selectDate" ></select> -->
							<select class='reservationSelect' name="selectTime">
								<option value='12:00AM'>12:00 AM</option>
								<option value='5:00PM'>5:00 PM</option>
								<option value='7:00PM'>7:00 PM</option>
							</select>
						</div>
						<div>
							<input type='submit' id='reservationSubmit' class='reservationSelect' value='Find Seats'>
						</div>
					</form>
				</div>
			</div>
			
		</div>
		<form action="BookingServlet.do" method="POST">
			<div id='outer'>
				<div id='header'></div>
				<div id='bottom'>

				</div>
			</div>
		</form>
		
	</body>
</html>