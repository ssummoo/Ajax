package kr.co.softsoldesk.mapper.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductVO {

	private String id;
	private String name;
	private String maker;
	private int price;
	
	public ProductVO() {
	
	}
	
	public ProductVO(String id, String name, String maker, int price) {

		this.id = id;
		this.name = name;
		this.maker = maker;
		this.price = price;
	}
	
	
}
