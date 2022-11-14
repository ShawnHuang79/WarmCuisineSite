<%@page pageEncoding='UTF-8'%>
<!DOCTYPE HTML>
<html>
	<head>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta charset="UTF-8">
	    <title>會員資料修改</title>

	    <style>
			@import url(/wcs/css/wcs.css);
	
			header{
		        /*定位對齊*/
		        position:relative;   
		        margin: auto;
		        top: 20px;
		        text-align:center; 
	        }
			input, .loginAndSignup, #genderContainer{
	        	width: 250px;
	        	height: 20px;
	       	 	margin: 10px;
	        	color: #df5334;
	        }
			input{
		        padding: 5px;
		        border: none; 
		        border:solid 1px #ccc;
		        border-radius: 5px;
	        }
			input[type="radio"], #showPwdBox{
				width: 30px;
	        	height: 15px;
	       	 	margin: 0px;
			}
			#genderContainer{
				height: 50px;
			}
	
	        div .switchBotton{
		        margin: 20px;
		        color: #a3a2a3;
	        }
	
	        div .switchBotton:hover{
	        	color: black;
	        }
			#loginContainer, #signupContainer{
		        padding: 10px;
		        width: 280px;
		        height: 300px;
		        background-color: white;
		        border-radius: 5px;
		        border-top: 10px solid #df5334;
		        box-shadow: 0 0px 70px rgba(0, 0, 0, 0.1);
		        /*定位對齊*/
		        position:relative;   
		        margin: auto;
		        top: 200px;
	        }
			#signupContainer{
		        /*display: none;*/
		        height: 600px;
	        }
	        .submit{
		        color: white;  
		        background: #df5334;
		        width: 200px;
		        height: 30px;
		        margin: 10px;
		        padding: 5px;
		        border-radius: 5px;
		        border: 0px;
	        }
	        .submit:hover{
	        	background: #db6937;
	        }
	        footer{
				position:relative; 
		        text-align: center;
		        color: #a3a2a3;
		        margin: 220px 0px 0px 0px;
		        font-size: 14px;
	        }
	

    	</style>
	    <script src="https://code.jquery.com/jquery-3.0.0.js" 
	    integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		<script>
			
			$(document).ready(init);
			function init(){
				$("#showPwdBox").click(showPasswordHandler);
			}
			function showPasswordHandler(){
				if ((($("#showPwdBox").prop("checked")))){//prop用在沒有資料值的屬性上
					$(".Pwd").attr("type", "text");
				}else{
					$(".Pwd").attr("type", "password");
				}
			}
			function refreshCaptcha(){
					$("#captchaImage").attr("src","images/captcha.jpg?"+ new Date());
				}

		</script>
	</head>  
  	<body>
	    <header>
	    	<h2>會員資料更新</h2>
	    </header>
		<article id="signupContainer"> <!-- 改article -->
			<div class="loginAndSignup">  
				<h3>修改 Update</h3>
			</div>
	         <!-- 改action目標位置 -->
	        <form action="" method="POST">
	            <input type="text" name="id" placeholder="帳號" pattern='[A-Z][1289]\d{8}' required>
	            <input type="email" name="email" placeholder="email" required>
				<input type="text" name="fullname" placeholder="使用者姓名" required minlength="2" maxlength="20">
	            <input type="password" class=Pwd  name="password" placeholder="密碼" required>
	            <input type="password" class=Pwd name="comfirmPassword" placeholder="確認密碼" required>
				<input type="checkbox" id="showPwdBox" onchange="showPasswordHandler()"><label>顯示密碼</label>
				<input type="date" name="birthday" placeholder="生日 yyyy/mm/dd" required>
				<input type="text" name="address" placeholder="地址">
				<input type="tel" name="phone" placeholder="手機號碼">
				<div id="genderContainer">
					<label>選擇性別:</label><br>
					<label>男</label><input type="radio" name="gender" value="M" required>
					<label>女</label><input type="radio" name="gender" value="F">
					<label>不想透漏</label><input type="radio" name="gender" value="U">
				</div>
				<input type="checkbox" id="subscribedBox" name="subscribed" checked><label>訂閱電子報</label>
				<input name='captcha' required placeholder="請輸入驗證碼">
				<img src="images/captcha.jpg" id="captchaImage" onclick="refreshCaptcha()" title="點選即可更新圖片"><br>
	            <input type="submit" value="修改" class="submit">
	        </form>  
		</article>
	
		<footer id="copyright">
	      	<h4>Copyright &copy;2022 All rights reserved</h4>
	    </footer>    
  	</body>
</html>