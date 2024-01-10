package com.kh.littleEco.moiza.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MoizaMember {

	private int moizaNo;
	private int memberNo;
	private int memberLevel;
	private int approvalStatus;
	private Date createDate;
	private Date deleteDate;
}
