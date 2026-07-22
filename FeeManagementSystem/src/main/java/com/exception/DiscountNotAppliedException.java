package com.exception;

public class DiscountNotAppliedException extends ParentFeeException  {
	
	public DiscountNotAppliedException(String message) {
		super(message);
	}

}
