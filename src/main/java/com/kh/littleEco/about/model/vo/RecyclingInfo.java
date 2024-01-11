package com.kh.littleEco.about.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecyclingInfo {
	

	private String wtTypeGbNm;	//		WT_TYPE_GB_NM:"합계" // 폐기물 종류
	private String wsteMCodeNm;	//		WSTE_M_CODE_NM:"EMPTY" // 폐기물 종류 가연성 불온성 구분
	private String wsteCodeNm;	//		WSTE_CODE_NM:"EMPTY" //폐기물 종류 ex) 폐지류...
	
	private String wsteQty;		//		WSTE_QTY:45894.6 // 년도 발생량
	private String totRecyQty;	//		TOT_RECY_QTY:25086.9 // 총계 재활용
	
	private String totInciQty;	//		TOT_INCI_QTY:13729.9 // 총계 소각
	private String totFillQty; 	//		TOT_FILL_QTY:6782.8 // 총계 매립
	private String totEtcQty;	//		TOT_ETC_QTY:295.6 // 총계 기타
	private String pubRecyQty;	//		PUB_RECY_QTY:10992.5 //공공처리 재활용
	private String pubInciQty;	//		PUB_INCI_QTY:12050.7 //공공처리 소각
	private String pubFillQty;	//		PUB_FILL_QTY:6769 // 공공처리 매립
	private String pubEtcQty;	//		PUB_ETC_QTY:192.5 // 공공처리 기타
	private String selfRecyQty;	//		SELF_RECY_QTY:110 // 자가처리 재활용
	private String selfInciQty;	//		SELF_INCI_QTY:1.1 // 자가처리 소각
	private String selfFillQty;	//		SELF_FILL_QTY:0.1 // 자가처리 매립
	private String selfEtcQty;	//		SELF_ETC_QTY:0.6 // 자가처리 기타
	private String comRecyQty;	//		COM_RECY_QTY:13984.4 // 위탁처리 재활용
	private String comInciQty;	//		COM_INCI_QTY:1678.1 // 위탁처리 소각
	private String comFillQty;	//		COM_FILL_QTY:13.7 // 위탁처리 매립
	private String comEtcQty; 	//		COM_ETC_QTY:102.5 // 위탁처리 기타
	

}
