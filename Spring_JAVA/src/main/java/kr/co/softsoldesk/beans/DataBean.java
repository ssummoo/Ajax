package kr.co.softsoldesk.beans;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class DataBean {
	
	private String data1;	
	private int data2;
	private double data3;
	private boolean data4;
	
	
	public DataBean(String data1, int data2, double data3, boolean data4) {
	
		this.data1 = data1;
		this.data2 = data2;
		this.data3 = data3;
		this.data4 = data4;
	}
	
}