package icia.oap.services.management;

import java.util.ArrayList;

import org.apache.ibatis.io.ResolverUtil.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;


import icia.oap.beans.ManageBean;
import icia.oap.mapper.ManageMapper;

@Service
public class ManagementInquiery {
	
	@Autowired
	private ManageMapper mapperM;
	@Autowired
	private Gson gson;
	
	ModelAndView mav = null;
	
	public ManagementInquiery() {
		
	}
	
	public ModelAndView entrance(ManageBean mBean) {
		ModelAndView mav = null;
	
		switch(mBean.getSCode()) {
		case "myWorkZone":
			mav = this.workZoneManagementCtl(mBean);
		break;
		
		case "searchMap":
			mav = this.searchMapCtl(mBean);
		break;
		
		case "workLog":
			mav = this.workLogCtl(mBean);
		break;
		
		case "workDiary":
			mav = this.workDiaryCtl(mBean);
		break;
		}
		
		
		return mav;
	}
	


	private ModelAndView workLogCtl(ManageBean mBean) {
ModelAndView mav = new ModelAndView();

		
	
	
		
		mav.setViewName("workLog");
		return mav;
	}
	


	// 나의 매장리스트 가져오기
	private ModelAndView workZoneManagementCtl(ManageBean mBean) {
	
		ModelAndView mav = new ModelAndView();
		String jsonData = gson.toJson(this.getMyWorkZoneList(mBean));
		
		ArrayList<ManageBean> mbTest = new ArrayList<ManageBean>();
		
		mbTest = this.getMyWorkZoneList(mBean);
	
		
		
		mav.addObject("WL", jsonData);
		

		
		mav.setViewName("myWorkZone");
		return mav;
	}
	private ModelAndView searchMapCtl(ManageBean mBean) {
		
		ModelAndView mav = new ModelAndView();

		
	
	
		
		mav.setViewName("searchMap");
		return mav;
	}
	// 나의 매장리스트 가져오기 - mapper
	private ArrayList<ManageBean> getMyWorkZoneList(ManageBean mBean){
		
		return mapperM.getMyWorkZoneList(mBean);
	}
	
	// 알바생 관리 ( 현재 매장의 알바생 리스트 가져오기 ) 
	private ModelAndView albaManagementCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	// 알바생 관리 ( 현재 매장의 알바생 리스트 가져오기 )
	private ArrayList<ManageBean> getAlbaList(ManageBean mBean){
		return mapperM.getAlbaList(mBean);
	}
	
	
	private ModelAndView albaInfoSearch(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getAlbaSearch(ManageBean mBean){
		return mapperM.getAlbaSearch(mBean);
	}
	
	private ModelAndView albaInfoDetail(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getAlbaDetailSearch(ManageBean mBean){
		return mapperM.getAlbaDetailSearch(mBean);
	}
	
	private ModelAndView commuteManagementCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getCommuteList(ManageBean mBean){
		return mapperM.getCommuteList(mBean);
	}
	
	private ModelAndView workCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getzCode(ManageBean mBean){
		
		return mapperM.getzCode(mBean);
	}
	
	private ModelAndView selectTimeCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getTypeCode(ManageBean mBean){
		return mapperM.getTypeCode(mBean);
	}
	
	private ModelAndView payCtl(ManageBean mBean){
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getPayList(ManageBean mBean){
		return mapperM.getPayList(mBean);
	}
	
	private ModelAndView payDetailCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ManageBean getPayInfo(ManageBean mBean) {
		return mapperM.getPayInfo(mBean);
	}
	
	private ModelAndView paySelectCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getPayDate(ManageBean mBean){
		return mapperM.getPayDate(mBean);
	}
	
	private ModelAndView scheduleCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getScheduleList(ManageBean mBean){
		return mapperM.getScheduleList(mBean);
	}
	
	private ModelAndView workDiaryCtl(ManageBean mBean) {
		ModelAndView mav = new ModelAndView();
		String jsonData = gson.toJson(this.getLogList(mBean));
		
		
		ArrayList<ManageBean> mbTest = new ArrayList<ManageBean>();
		mbTest = this.getLogList(mBean);
		mav.addObject("Log", jsonData);
		
		mav.addObject("oman",mbTest.get(7).getMCOUNT());
		mav.addObject("man",mbTest.get(6).getMCOUNT());
		mav.addObject("ocheon",mbTest.get(5).getMCOUNT());
		mav.addObject("cheon",mbTest.get(4).getMCOUNT());
		mav.addObject("obak",mbTest.get(3).getMCOUNT());
		mav.addObject("bak",mbTest.get(2).getMCOUNT());
		mav.addObject("osip",mbTest.get(1).getMCOUNT());
		mav.addObject("sip",mbTest.get(0).getMCOUNT());
		
		mav.addObject("abName", mbTest.get(0).getAbName());
		mav.addObject("workTime", mbTest.get(0).getWorkTime());
		mav.addObject("note", mbTest.get(0).getNote());
		
		System.out.println(jsonData);
		
		
		mav.setViewName("workDiary");
		return mav;
	}
	


	private ArrayList<ManageBean> getLogList(ManageBean mBean){
		return mapperM.getLogList(mBean);
	}
	
	private ModelAndView logDetailCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ModelAndView logDetailSelect(ManageBean mBean) {
		return mapperM.logDetailSelect(mBean);
	}
	
	private ModelAndView laborListCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> larborList(ManageBean mBean){
		return mapperM.larborList(mBean);
	}
	
	private ModelAndView laborDetailCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ModelAndView larborDetailSelect(ManageBean mBean) {
		return mapperM.larborDetailSelect(mBean);
	}
	
}












