package com.fuel.indeed.services;

import com.razorpay.*;

public class ActiveUser {
	static int id;
	public static String apiKey = "rzp_test_I1Old5tCWsytAn";
	public static String apiSecret = "lmtNkaOloyu7mLPfckT9lvIk";
	public static RazorpayClient razorpayClient;
	public static Payment payment;
	
	public static void setId(int id) {
		
		ActiveUser.id = id;
	}
	public static int getId() {
		return ActiveUser.id;
	}
	public static int checkPayment(String paymentId) {
		try {
			razorpayClient = new RazorpayClient(apiKey, apiSecret);
			payment = razorpayClient.payments.fetch(paymentId);
			int amount = payment.get("amount");
			return amount;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
