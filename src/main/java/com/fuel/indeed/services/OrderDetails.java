package com.fuel.indeed.services;
import java.security.SecureRandom;
import java.util.*;

public class OrderDetails {
	public static String fuel, address, latitude, longitude;
	public static SecureRandom rand = new SecureRandom();
	public static int randInt = rand.nextInt(1000000);
	public static PriorityQueue<DistanceInfo> pq = new PriorityQueue<>();
	
	public static String getFuel() {
		return fuel;
	}

	public static void setFuel(String fuel) {
		OrderDetails.fuel = fuel;
	}

	public static String getAddress() {
		return address;
	}

	public static void setAddress(String address) {
		OrderDetails.address = address;
	}

	public static int getRandInt() {
		return OrderDetails.randInt;
	}

	public static String getLatitude() {
		return latitude;
	}

	public static void setLatitude(String latitude) {
		OrderDetails.latitude = latitude;
	}

	public static String getLongitude() {
		return longitude;
	}

	public static void setLongitude(String longitude) {
		OrderDetails.longitude = longitude;
	}
	
}
