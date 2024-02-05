package com.kh.littleEco.popularSearch.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PopularSearch {
	
	private int keywordNo;
	private String keyword;
	private int searchCount;
	private String updateDate;

}
