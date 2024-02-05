package com.kh.littleEco.popularSearch.model.service;

import java.util.ArrayList;

import com.kh.littleEco.moiza.model.vo.Moiza;
import com.kh.littleEco.popularSearch.model.vo.PopularSearch;
import com.kh.littleEco.recycleboard.model.vo.recycleBoard;
import com.kh.littleEco.searchEco.model.vo.SearchEco;

public interface PopularSearchService {

	ArrayList<PopularSearch> selectKeyword();

	int insertKeyword(String keyword);

	int resetCount();

	ArrayList<PopularSearch> autoComplate(String keyword);

	ArrayList<SearchEco> searchEcoKeyword(String keyword);

	ArrayList<recycleBoard> searchRecycleBoardKeyword(String keyword);

	ArrayList<Moiza> searchMoiza(String keyword);

}
