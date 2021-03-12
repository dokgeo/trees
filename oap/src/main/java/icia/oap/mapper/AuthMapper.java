package icia.oap.mapper;

import java.util.ArrayList;

import icia.oap.beans.AuthBean;

public interface AuthMapper {
	public ArrayList<AuthBean> getManagerList(AuthBean auBean);
	
	public int joinCheck(AuthBean auBean);

	public int joinInsert(AuthBean auBean);

	public int isMember(AuthBean auBean);

	public int isPassword(AuthBean auBean);

	public int insertCommute(AuthBean auBean);

	public int logInQr(AuthBean auBean);

	public int leaveQr(AuthBean auBean);

}
