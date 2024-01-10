package com.kh.littleEco.moiza.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.littleEco.brand.model.vo.Category;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Moiza {

	private int moizaNo;
	private ArrayList<Integer> categoryNo;
	private String moizaName;
	private String moizaTitle;
	private String moizaMission;
	private String moizaGoal;
	private String moizaInfo;
	private Date createDate;
	private String status;
	
	
	private ArrayList<Category>cList;
}
