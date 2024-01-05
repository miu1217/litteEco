package com.kh.littleEco.clud.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ClubMember {

	private int clubNo;
	private int memberNo;
	private int memberLevel;
	private int approvalStatus;
	private Date createDate;
	private Date deleteDate;
}
