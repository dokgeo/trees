package icia.oap.mapper;

import java.util.ArrayList;

import icia.oap.beans.AlbaBean;


public interface AlbaMapper {
	//알바생 정보 조회
	public ArrayList<AlbaBean> getAlbaInfo(AlbaBean aBean);;
	
	
	
	//알바생 정보 수정
	public int editName(AlbaBean aBean);
	
	public int editPassword(AlbaBean aBean);
	
	public int editAccount(AlbaBean aBean);
	
}
