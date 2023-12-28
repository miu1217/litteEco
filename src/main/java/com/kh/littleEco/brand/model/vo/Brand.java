package com.kh.littleEco.brand.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Brand {
	private int brandNo;
	private ArrayList<Integer> categoryNo;
	private String brandName;
	private String brandUrl;
	private String brandInfo;
	private Date createDate;
	private String status;
	
	private ArrayList<Category>cList;
	private String imgSrc;
}
