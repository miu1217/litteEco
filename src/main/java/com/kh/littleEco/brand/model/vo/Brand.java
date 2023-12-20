package com.kh.littleEco.brand.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Brand {
	private int brandNo;
	private String brandName;
	private String brandUrl;
	private String brandInfo;
	private Date createDate;
	private String status;
}
