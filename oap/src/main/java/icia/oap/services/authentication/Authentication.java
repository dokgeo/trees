package icia.oap.services.authentication;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.oap.beans.AuthBean;
import icia.oap.beans.ManageBean;
import icia.oap.mapper.AuthMapper;

@Service
public class Authentication {
	
	@Autowired
	private AuthMapper mapperA;
	@Autowired
	private PlatformTransactionManager tran;
	@Autowired
	private Gson gson;
	
	public Authentication() {
		
	}
	
	public ModelAndView entrance(AuthBean authBean) {
		
		ModelAndView mav = null;
		
		
		if(authBean.getMCode()==null && authBean.getWCode()==null) {
			
			
		}else {
			mav = this.homeViewCtl(authBean);
		}
		
		
		
		return mav;
	}
	private ModelAndView homeViewCtl(AuthBean auBean) {
		
		ModelAndView mav = new ModelAndView();
		String jsonData = gson.toJson(this.getManagerList(auBean));
		mav.addObject("nameList",jsonData);
		System.out.println(jsonData);
		mav.setViewName("home");
		return mav;
	}
	private ArrayList<AuthBean> getManagerList(AuthBean auBean){
		
		return mapperA.getManagerList(auBean);
	}
	
	private ModelAndView joinForm(AuthBean auBean) {
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	
	private ModelAndView joinTypeSelect(AuthBean aubBean) {
		
		ModelAndView mav = new ModelAndView();
		
		
		return mav;
	}
	
	
	private ModelAndView joinAgree(AuthBean auBean) {
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	
	private ModelAndView join(AuthBean auBean) {
		
		ModelAndView mav = new ModelAndView();
		
		
		return mav;
	}

	
	private boolean converToBoolean(int data) {
		
		return (data==1)? true : false;
	}
	
	
	private boolean joinCheck(AuthBean auBean) {
		return this.converToBoolean(mapperA.joinCheck(auBean));
	}
	
	private boolean joinInsert(AuthBean auBean) {
		return this.converToBoolean(mapperA.joinInsert(auBean));
	}
	
	private ModelAndView logInCtl(AuthBean auBean) {
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	private boolean isMember(AuthBean auBean) {
		return this.converToBoolean(mapperA.isMember(auBean));
	}
	
	private boolean isPassword(AuthBean auBean) {
		return this.converToBoolean(mapperA.isPassword(auBean));
	}
	
	private boolean insertCommute(AuthBean auBean) {
		return this.converToBoolean(mapperA.insertCommute(auBean));
	}
	
	private ModelAndView logOutCtl(AuthBean auBean) {
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	private boolean logInQr(AuthBean auBean) {
		return this.converToBoolean(mapperA.logInQr(auBean));
	}
	
	private boolean leaveQr(AuthBean auBean) {
		return this.converToBoolean(mapperA.leaveQr(auBean));
	}
	
	
}















