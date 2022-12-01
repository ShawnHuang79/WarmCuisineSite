<%@page pageEncoding='UTF-8'%>
<!DOCTYPE HTML>
<html>
	<head>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta charset="UTF-8">
	    <title>會員登入</title>

	    <style>
			@import url(/wcs/css/wcs.css);
			#loginContainer{
				text-align:center;
			}

	        #captchaImage{
	        	cursor: pointer;
	        	width:200px;
	        	height:100px;
	        }
	        .memberInfo{
	        	display:flex;
				flex-direction: column;
				/*justify-content:center;*/
				align-content: center;
	        }
	        .memberInnerInfo{
	        	display:flex;
				flex-direction: row;
	        }
	        #id, #Pwd{
	        	
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
				if ((($("#showPwdBox").prop("checked")))){
					$("#Pwd").attr("type", "text");
				}else{
					$("#Pwd").attr("type", "password");
				}	
			}
			function refreshCaptcha(){
				$("#captchaImage").attr("src","images/login_captcha.jpg?refresh="+ new Date());
			}
		</script>
	</head>  
  	<body>
	    <div id="loginContainer"> <!-- 改article -->
	        <div>  
	        	<h3>登入 Login</h3>
	        </div>
        	<div>
	        	<form class="loginAndSignup" action="login.do" method="POST">
	        		<div>${errorList}</div>
	        		<div class='memberInfo'>
			            <div class='memberInnerInfo'>
				            <input type="text" name="id" placeholder="帳號" required value='${cookie.id.value}'>
				            <input type="checkbox" id="idSaveBox" name="autoId" value='ON' ${cookie.autoId.value}><label>記住我的帳號</label>
			            </div>
			            <div class='memberInnerInfo'>
				            <input type="password" id="Pwd" name="password" placeholder="密碼" required>
							<input type="checkbox" id="showPwdBox"><label>顯示密碼</label>
						</div>
						<div class='memberInnerInfo'>
							<input name='captcha' required placeholder="請輸入驗證碼">
						</div>
						<div class='memberInnerInfo'>
							<img src="images/login_captcha.jpg" id="captchaImage" onclick="refreshCaptcha()" title="點選即可更新圖片">
						</div>
			        	<div>
			        		<input type="submit" value="登入" class="submit" onclick="location.href='https://'">
			        	</div>
		        	</div>
	        	</form>  
        	</div>	
	    </div>  
  	</body>
</html>