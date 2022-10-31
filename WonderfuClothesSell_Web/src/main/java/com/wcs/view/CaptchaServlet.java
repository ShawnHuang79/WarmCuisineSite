package com.wcs.view;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CaptchaServlet
 */
//@WebServlet("/images/captcha.jpg") //http://localhost:8080/wcs/images/captcha.jpg
public class CaptchaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int len = 6, width = 16 * 2 + 12 * len, height = 60;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CaptchaServlet() {
        super();
    }
    
    @Override
    public void init() {
    	String len = this.getInitParameter("len");
    	if(len!=null && len.matches("\\d+")) {
    		int length = Integer.parseInt(len);
    		if(length>3 && length<7) {//4~6個字元的驗證碼
    			this.len = length;
    			this.width = 16 * 2 + 12 * this.len;
    		}
    	}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Random random = new Random();
		String captcha = "";
		for(int i=0;i<len;i++) {
			int data = random.nextInt(34);
			char ch = (char)(data<8? data+'2':data-8+'A');
			captcha +=ch;
		}
		//存入session給LoginServlet檢查用
		HttpSession session = request.getSession();
		session.setAttribute(this.getServletName(), captcha);
		//繪製captcha在圖片中。
		BufferedImage image = generateImage(captcha, width, height);
		
		//3.圖片輸出到前端
		response.setContentType("image/jpeg");//jpg的MIME TYPE
        try (ServletOutputStream outStream = response.getOutputStream();){      //將影像輸出到前端
            ImageIO.write(image, "JPEG", outStream);
        } 
		
	}
	private BufferedImage generateImage(String rand, int width, int height) {
        //開始建立圖片
        BufferedImage image =
                new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();   //取得影像繪圖區，g就像水彩筆。
        
        

        
        //畫出背景方塊
        g.setColor(getRandomColor(200, 250)); //設定繪圖區背景色，這裡目標是畫淺色背景深色字，淺色就是RGB的數值大。
        g.fillRect(0, 0, width, height);    //在繪圖區畫個長方型rect

        //畫干擾線讓背景雜亂，用比上方深色一點的顏色
        Random random = new Random();
        g.setColor(getRandomColor(170, 210));
        for (int i = 0; i<155; i++) {//會畫155條一樣顏色的線
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(12);//最多12點的長度
            int yl = random.nextInt(12);
            g.drawLine(x, y, x + xl, y + yl);//往右往下最多12點長度
        }
        Graphics2D g2d = (Graphics2D)g;//改成2D方法
        g2d.setFont(new Font("Arial", Font.PLAIN, 18));//設定字體，Arial寬度不一，要小心突出去。
        g2d.setColor(getRandomColor(20, 140));//換更深的顏色寫字
        double randRotate = ((random.nextInt(10))-5)/10d;
        g2d.rotate(randRotate);//旋轉角度
        if(randRotate>0) {
        	g2d.drawString(rand, 15, 25);
        }else {
        	g2d.drawString(rand, 0, 50);// 將認證文字畫到image中(內容, x位置, y位置)，translate()也可以換位置。
        }
        g2d.dispose();//結束畫筆
        return image;     
    } 

    private Color getRandomColor(int fc, int bc) {
        //在參數設定的範圍內，隨機產生顏色
        Random random = new Random();
        if (fc > 255) fc = 255;
        if (bc > 255) bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }
}
