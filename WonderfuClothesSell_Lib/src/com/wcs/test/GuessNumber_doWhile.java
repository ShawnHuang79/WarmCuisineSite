package com.wcs.test;

import java.util.Random;
import java.util.Scanner;

public class GuessNumber_doWhile {

	public static void main(String[] args) {
		Random random = new Random();
		int answer = random.nextInt(10)+1;
		Scanner scanner = new Scanner(System.in);
		int limit = 31;
		int counter = 1;
		int target;
		do {
			System.out.println("(這是第" + counter + "次)輸入1~10之間的整數：" +answer);
			target = scanner.nextInt();
			if(target==answer) {
				System.out.println("恭喜答對");
				return;
			}else {
				System.out.print("猜錯了，");
				if(++counter>limit) break;
			}
		}while(target!=answer);
		System.out.println("已經猜" + limit + "次，GG...");
	}

}
