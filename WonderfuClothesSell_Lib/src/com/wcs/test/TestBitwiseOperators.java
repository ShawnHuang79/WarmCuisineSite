package com.wcs.test;

public class TestBitwiseOperators {

	public static void main(String[] args) {
		byte i = 7;
		System.out.println(~i);
		
		byte x = 6;                //00000110
		byte y = 5;                //00000101
		
		System.out.println(x & y); //00000100
		System.out.println(x | y); //00000111
		System.out.println(x ^ y); //00000011
		int z = -32>>4;
		
		
		System.out.println(-32>>>4);
		System.out.println(Integer.toBinaryString(-32));
		System.out.println(Integer.toBinaryString(z));
		
	}

}
