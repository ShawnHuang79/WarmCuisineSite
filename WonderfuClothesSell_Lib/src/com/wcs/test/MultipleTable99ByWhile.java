package com.wcs.test;

public class MultipleTable99ByWhile {

	public static void main(String[] args) {
		int i = 1;
outerLoop:
		while(i<10) {
			int j=1;
innerLoop:
			while(j<10) {
				System.out.print(j + "*" + i + "=" + i*j + "\t");
				j++;
				//if(j>i) break;
				if(j>i) {
					System.out.println();
					i++;
					continue outerLoop;
				}
			}
		}
	}
}
