package com.kooream.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BidShopVO {
	private int m_no, p_no, bid_sell, bid_buy, bid_no;
	String pp_size;
	
	//-------------테이블 구분
	private List<ProductVO> productvo;
	private List<AttachFileVO> attachList;
	private List<String> imageUrls;
}