package com.wcs.exception;

public class WCSDuplicateEntryException extends WCSException {
	private final String columnName;
	
	
	
	public WCSDuplicateEntryException() {
		super();
		columnName = "Unknown";
	}



	public WCSDuplicateEntryException(String message, Throwable cause) {
		super(message+"已重複註冊", cause);
		columnName = message;
	}



	public WCSDuplicateEntryException(String message) {
		super(message+"已重複註冊");
		columnName = message;
	}



	public String getColumnName() {
		return columnName;
	}
	
	
}
