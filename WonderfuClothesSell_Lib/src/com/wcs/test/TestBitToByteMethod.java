package com.wcs.test;

import java.util.ArrayList;

public class TestBitToByteMethod {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<Character> seatBit = new ArrayList<>();
		seatBit.add('1');
		seatBit.add('5');
		seatBit.add('8');
		System.out.println(seatBit);
			char bit1 = '0';
			char bit2 = '0';
			char bit3 = '0';
			char bit4 = '0';
			char bit5 = '0';
			char bit6 = '0';
			char bit7 = '0';
			char bit8 = '0';
			for(int i=0; i<seatBit.size(); i++) {
				switch(seatBit.get(i)) {
					case'1': bit1 = '1';break;
					case'2': bit2 = '1';break;
					case'3': bit3 = '1';break;
					case'4': bit4 = '1';break;
					case'5': bit5 = '1';break;
					case'6': bit6 = '1';break;
					case'7': bit7 = '1';break;
					case'8': bit8 = '1';break;
				}
			}
			String seatString = "" + bit1 + bit2 + bit3 + bit4 + bit5 + bit6 + bit7 + bit8;
			System.out.println(seatString);
			//byte seatByte = -0b0000000;
			byte seatByte = (byte)Integer.parseInt(seatString, 2);
			System.out.println(seatByte);
			//byte test = -65 ^ 64;
			//System.out.println(test);
		}
	}


