package com.fuel.indeed.services;

public class DistanceInfo implements Comparable<DistanceInfo> {
	public int id;
	public double distance;
	
	void setDistance(double distance) {
		this.distance = distance;
	}
	double getDistance() {
		return this.distance;
	}
	int getId() {
		return this.id;
	}
	public DistanceInfo(int id, double distance) {
		this.id = id;
		this.distance = distance;
	}
	
	@Override
	public int compareTo(DistanceInfo o) {
		// TODO Auto-generated method stub
		return Double.compare(this.distance, o.distance);
	}

}
