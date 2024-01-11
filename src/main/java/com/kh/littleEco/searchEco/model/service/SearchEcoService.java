package com.kh.littleEco.searchEco.model.service;

import java.util.ArrayList;

import com.kh.littleEco.brand.model.vo.Attachment;
import com.kh.littleEco.brand.model.vo.Brand;
import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.searchEco.model.vo.EcoLike;
import com.kh.littleEco.searchEco.model.vo.SearchEco;

public interface SearchEcoService {

	//게시글 개수
	int searchEcoListCount();

	//서치에코 리스트 조회
	ArrayList<SearchEco> searchEcoList(PageInfo pi);

	//좋아요 인서트
	int ecoLikeInsert(int bno, int memberNo);

	//좋아요 카운트
	int ecoLikeCount(int bno);

	//좋아요 체크
	int ecoLikeCheck(int bno, int memberNo);

	//좋아요 업데이트
	int ecoLikeUpdate(int bno, int memberNo);

	//좋아요 삭제
	int ecoLikeDelete(int bno, int memberNo);

	//좋아요 누른 멤버 확인
	int likeMemCheck(int bno, int memberNo);

	//int insertSearchEco(SearchEco se);

	//int insertAttachment(Attachment a);

	//브랜드 시퀀스채번
	int getNextBrandNo();

	//서치에코보드 시퀀스 채번
	int getNextEcoBoardNo();

	//어태치먼트 시퀀스 채번
	int getNextFileNo();

	//브랜드 인서트
	int insertBrand(Brand b);

	//서치에코 보드인서트
	int insertSearchEco(SearchEco se);

	//파일 어태치먼트
	int insertAttachment(Attachment at);

	//조회수 증가
	int increaseCountSearchEco(int bno);

	//상세보기
	SearchEco detailSearchEco(int bno);

	Brand selectBrandNo(Brand b);

	//게시글 삭제하기
	int searchEcoDelete(int bno);

	//게시글 업데이트
	int searchEcoUpdate(SearchEco se);

	//좋아요 인서트
	int ecoLikeInsert(EcoLike like);

	//좋아요 취소
	int ecoLikeRemove(EcoLike like);


	

}
