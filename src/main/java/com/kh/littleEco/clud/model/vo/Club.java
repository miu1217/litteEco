package com.kh.littleEco.clud.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Club {

	private int clubNo;
	private String clubName;
	private String clubTitle;
	private String clubGoal;
	private String clubMission;
	private String clubInfo;
	private Date createDate;
	private String status;
	
}
