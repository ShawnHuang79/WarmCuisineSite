package com.wcs.entity;

import java.time.LocalDate;

import com.wcs.exception.WCSInvalidDataException;

public class Customer {
	private String id;
	private String email;
	private String name;
	private String password;
	private LocalDate birthday;
	private char gender;
	
	private String address = "";
	private String phone = "";
	private boolean subscribed = false;
	private int status = 1; //開啟會員用的
	
	
	
	
	
	public Customer() {	
	}

	public Customer(String id, String name, String password) {
		this.setId(id);
		this.setName(name);
		this.setPassword(password);
	}
	public Customer(String id, String name, String password, String email) {
		this(id, name, password);
		this.setEmail(email);
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		if(checkId(id)) {
			this.id = id;
		}else {
			//System.err.println("身分證號不正確");
			throw new WCSInvalidDataException("身分證號不正確");
		}
	}
	public static final String ID_PATTERN = "[A-Za-z][1289][0-9]{8}";
	public boolean checkId(String id) {
		if(id!=null && id.matches(ID_PATTERN)) {
			int sum = 0;
			char[] idChar = new char[10];
			int[] charToInt = new int[10];
			idChar[0] = id.toUpperCase().charAt(0);
			for(int i=1; i<10; i++) {
				idChar[i] = id.charAt(i);
				charToInt[i] = idChar[i] - '0';
			}	
			//第1碼依規則計算
			switch(idChar[0]) {
				case'B':case'N':case'Z':sum = 0;break;
				case'A':case'M':case'W':sum = 1;break;
				case'K':case'L':case'Y':sum = 2;break;
				case'J':case'V':case'X':sum = 3;break;
				case'H':case'U':		sum = 4;break;
				case'G':case'T':		sum = 5;break;
				case'F':case'S':		sum = 6;break;
				case'E':case'R':		sum = 7;break;
				case'D':case'O':case'Q':sum = 8;break;
				case'C':case'I':case'P':sum = 9;break;
			}
			//第2到8碼依規則計算
			for(int i=1; i<9; i++) {
				sum = sum + (charToInt[i] * (9-i));
			}
			//10-餘數需等於最後一碼才通過檢查
			if((10 - (sum%10)) == charToInt[9]){
				return true;
			}else {
				return false;
			}
		}else {
			return false;
		}
	}
	public String getEmail() {
		return email;
	}
	public static final String EMAIL_PATTERN = "^[a-zA-Z0-9_.+\\-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$";
	public void setEmail(String email) {
		if(email!=null && email.matches(EMAIL_PATTERN)) {
			this.email = email;
		}else {
			throw new WCSInvalidDataException("email格式不正確");
		}
	}
	public String getName() {
		return name;
	}
	public static final int NAME_MIN_LENGTH = 2;
	public static final int NAME_MAX_LENGTH = 20;
	public void setName(String name) {
		if(name!=null && name.length()>=NAME_MIN_LENGTH && name.length()<=NAME_MAX_LENGTH) {
			this.name = name;
		}else {
			//System.err.printf("姓名長度不正確，必須為%s~%s個字元\n",NAME_MIN_LENGTH,NAME_MAX_LENGTH );
			String errorMsg = String.format("姓名長度不正確，必須為%s~%s個字元\n",NAME_MIN_LENGTH,NAME_MAX_LENGTH);
			throw new WCSInvalidDataException(errorMsg);			
		}

	}
	public String getPassword() {
		return password;
	}
	public static final int PWD_MINIMUM = 8;
	public static final int PWD_MAXIMUM = 20;		
	public void setPassword(String pwd) {
		if(pwd!=null && pwd.length()>=PWD_MINIMUM && pwd.length()<=PWD_MAXIMUM) {
			this.password = pwd;
		}else {
			//System.err.printf("密碼長度不正確，必須為%d~%d個字元", PWD_MINIMUM, PWD_MAXIMUM);
			String errorMsg = String.format("密碼長度不正確，必須為%d~%d個字元", PWD_MINIMUM, PWD_MAXIMUM);			//TODO:13章要改成throw Exception
			throw new WCSInvalidDataException(errorMsg);
		}	
	}
	public LocalDate getBirthday() {
		return birthday;
	}
	public static final int AGE_REQUIRED = 12;
	public void setBirthday(LocalDate birthday) {
		if(birthday!=null) {
			int thisYear = LocalDate.now().getYear();
			int birthYear = birthday.getYear();
			if(thisYear-birthYear >=AGE_REQUIRED) {
				this.birthday = birthday;
				return;
			}
		}
		//System.err.printf("客戶生日必須有值並年滿%d歲", AGE_REQUIRED);
		String errorMsg = String.format("客戶生日必須有值並年滿%d歲", AGE_REQUIRED);			//TODO:13章要改成throw Exception
		throw new WCSInvalidDataException(errorMsg);
	}
	/**
//	 * 將符合iso 8601的日期字串轉成日期物件，再傳入setBirthday(LocalDate)。
	 * @param dateStr
	 */
	public void setBirthday(String dateStr) {
		LocalDate date = LocalDate.parse(dateStr);
		this.setBirthday(date);
	}
	public void setBirthday(int year, int month, int day) {
		LocalDate date = LocalDate.of(year,month,day);
		this.setBirthday(date);
	}
	public char getGender() {
		return gender;
	}
	
	private static final char MALE = 'M';
	private static final char FEMALE = 'F';
	private static final char GENDER_UNKNOWN = 'U';
	public void setGender(char gender) {
		if(gender == MALE||gender == FEMALE||gender == GENDER_UNKNOWN) {
			this.gender = gender;
		}else {
			//System.err.printf("性別資料不正確，需為%s、%s或%s(不願透漏)", MALE, FEMALE, GENDER_UNKNOWN);
			String errorMsg = String.format("性別資料不正確，需為%s、%s或%s(不願透漏)", MALE, FEMALE, GENDER_UNKNOWN);
			throw new WCSInvalidDataException(errorMsg);
		}
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public static final String PHONE_PATTERN = "[0][9][0-9]{8}";
	public void setPhone(String phone) {
		if(phone!=null && phone.matches(PHONE_PATTERN)) {
			this.phone = phone;
		}else {
			throw new WCSInvalidDataException("手機格式不正確");
		}
		
	}
	public boolean isSubscribed() {
		return subscribed;
	}
	public void setSubscribed(boolean subscribed) {
		this.subscribed = subscribed;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getAge(LocalDate birthday) {
		if(birthday!=null) {
			int thisYear = LocalDate.now().getYear();
			int birthYear = birthday.getYear();
			return thisYear - birthYear;
		}else {
			throw new WCSInvalidDataException("無客戶生日，無法計算年齡");
		}
	}
	/**
	 * 計算客戶年齡
	 * @return 年齡的整數值，值為0以上。若為-1表示無客戶生日資料。
	 */
	public int getAge() {
			return getAge(this.birthday);
	}
	@Override
	public String toString() {
		return this.getClass().getSimpleName() +
				": id=" + id + ", 電子郵件=" + email + ", 姓名=" + name + ",\n 密碼=" + password + ", 生日="
				+ birthday + (this.birthday == null?"": "," + getAge()+ "歲") + ", 性別=" + gender + ", 地址=" + address + ",\n 電話號碼=" + phone + ", 訂閱="
				+ subscribed + ", status=" + status;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!(obj instanceof Customer)) {
			return false;
		}
		Customer other = (Customer) obj;
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		return true;
	}
	
	
	/*
	@Override
	public boolean equals(Object obj) {
		if(this == obj) return true;
		if(obj instanceof Customer) {
			Customer another = (Customer)obj;
			if(this.id!=null && this.id.equals(another.id)){
				return true;
			}
		}
		return false;
	}

	@Override
	public int hashCode() {
		return id!=null?id.hashCode():0;
	}*/
	
}
