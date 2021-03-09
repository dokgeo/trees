package icia.oap.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.AuthBean;
import icia.oap.beans.ManageBean;
import icia.oap.services.management.ManagementEnroll;
import icia.oap.services.management.ManagementInquiery;
import icia.oap.services.management.ManagementModify;

@Controller
public class ManageController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private ManagementEnroll mEnroll;
	@Autowired
	private ManagementModify mModify;
	@Autowired
	private ManagementInquiery mInquiery;

	ModelAndView mav = null;

	/* ------------------------- 관리자 - 조회 ------------------------- */
	// 나의 매장 관리
	@RequestMapping(value = "/myWorkZone", method = RequestMethod.GET)
	public ModelAndView myWorkZone(@ModelAttribute ManageBean mBean) {
		mBean.setSCode("myWorkZone");
		
		mBean.setShMnCode("10000000");
		
		return mInquiery.entrance(mBean);
	}
	
	//지도 조회
	@RequestMapping(value = "/searchMap", method = RequestMethod.GET)
	public ModelAndView searchMape(@ModelAttribute ManageBean mBean) {
		mBean.setSCode("searchMap");
		return mInquiery.entrance(mBean);
	}

	// 알바생 관리
	@RequestMapping(value = "/Info", method = RequestMethod.GET)
	public ModelAndView info(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}

	// 알바생 관리 - 알바생 검색
	@RequestMapping(value = "/AlbaInfoSearch", method = RequestMethod.GET)
	public ModelAndView albaInfoSearch(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}
	
	// 알바생 관리 - 알바생 클릭시 상세정보
	@RequestMapping(value = "/AlbaInfoDetail", method = RequestMethod.GET)
	public ModelAndView albaInfoDetail(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}
	
	// 출퇴근 관리 - 알바생들의 출퇴근 기록 리스트를 보여줌
	@RequestMapping(value = "/Commute", method = RequestMethod.GET)
	public ModelAndView commute(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}
	
	// 출퇴근 관리 - 날자 선택후 조회하기 버튼클릭시 요청
	@RequestMapping(value = "/Inquiery", method = RequestMethod.GET)
	public ModelAndView inquiery(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}
	
	// 업무 관리  - 등록되어있는 업무리스트 확인 ( 알바생이 해야할 일 )
	@RequestMapping(value = "/Work", method = RequestMethod.GET)
	public ModelAndView work(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}
	
	// 업무 관리 - 파트타임 별로 클릭햇을 때 해당 시간파트만 보기위해 클릭하는 기능
	@RequestMapping(value = "/SelectTime", method = RequestMethod.GET)
	public ModelAndView selectTime(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}
	
	// 급여 관리 - 나의 매장 식구들의 급여리스트를 보여줌 
	@RequestMapping(value = "/Pay", method = RequestMethod.GET)
	public ModelAndView pay(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}
	
	// 급여 관리 - 나의 매장 식구들의 급여리스트중 한명의 내역을 상세하게 보여줌
	@RequestMapping(value = "/PayDetail", method = RequestMethod.GET)
	public ModelAndView payDetail(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}
	
	// 급여 관리 - 급여리스트를 날자값에 의해 보여주기위해 날자를 선택 후 조회를 클릭 
	@RequestMapping(value = "/PaySelect", method = RequestMethod.GET)
	public ModelAndView paySelect(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}
	
	// 일정 관리 - 일정 표를 보여줌 ( 알바생들이 몇시에 누가 일 하는지 ) 
	@RequestMapping(value = "/Schedule", method = RequestMethod.GET)
	public ModelAndView schedule(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}
	
	// 근무 일지 - 알바생이 퇴근하면서 작성해놓은 날자별 근무일지를 볼때 클릭
	@RequestMapping(value = "/workLog", method = RequestMethod.GET)
	public ModelAndView workLog(@ModelAttribute ManageBean mBean) {
		

	
		
		mBean.setSCode("workLog");
		
		return mInquiery.entrance(mBean);
	}
	
	// 근무 일지 - 근무일지에 무슨일이 잇엇는지 확인하기위해 상세정보를 보기위한 요청
	@RequestMapping(value = "/workDiary", method = RequestMethod.GET)
	public ModelAndView log(@ModelAttribute ManageBean mBean) {
		mBean.setSCode("workDiary");
		mBean.setRTTYPE("2");
		mBean.setShCode("100000000");
		mBean.setABCODE("100000000");
		
		return mInquiery.entrance(mBean);
	}
	
	// 근로 계약서 - 해당 매장에 잇는 알바생들의 근로 계약서 리스트 보여짐
	@RequestMapping(value = "/Larbor", method = RequestMethod.GET)
	public ModelAndView larbor(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}
	
	// 근로 계약서 - 근로계약서를 상세하게 보기위해 클릭할때 요청
	@RequestMapping(value = "/LarborDetail", method = RequestMethod.GET)
	public ModelAndView larborDetail(@ModelAttribute ManageBean mBean) {
		return mInquiery.entrance(mBean);
	}
	
	/* ------------------------- 관리자 - 등록  ------------------------- */
	// 매장 관리 - 매장 추가하기      sCode :: 1
	@RequestMapping(value = "/addWorkZone", method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView addWorkZone(@ModelAttribute ManageBean mBean) {
	
		mBean.setSCode("addWorkZone");
		
	
		return mEnroll.entrance(mBean);
	}
	
	
	
	
	
	// 업무 관리 - 업무 추가하기      sCode :: 1
	@RequestMapping(value = "/AddWork", method = RequestMethod.GET)
	public ModelAndView addWork(@ModelAttribute ManageBean mBean) {
		return mEnroll.entrance(mBean);
	}
	
	// 업무 관리 - 업무 추가하기 화면이동 후 추가시키는 요청을 날릴 때    sCode :: 2
	@RequestMapping(value = "/WorkAdd", method = RequestMethod.GET)
	public ModelAndView workAdd(@ModelAttribute ManageBean mBean) {
		return mEnroll.entrance(mBean);
	}
	
	// 일정 관리 - 해당 매장에 알바생이 일할 시간을 등록       sCode :: 3
	@RequestMapping(value = "/AddSchedule", method = RequestMethod.GET)
	public ModelAndView addSchedule(@ModelAttribute ManageBean mBean) {
		return mEnroll.entrance(mBean);
	}
	

	
	/* ------------------------- 관리자 - 수정  ------------------------- */

	// 업무 관리 - 업무내용 수정하기  
	@RequestMapping(value = "/Change", method = RequestMethod.GET)
	public ModelAndView change(@ModelAttribute ManageBean mBean) {
		return mModify.entrance(mBean);
	}
	
	// 업무 관리 - 업무내용 삭제하기  
	@RequestMapping(value = "/Drop", method = RequestMethod.GET)
	public ModelAndView drop(@ModelAttribute ManageBean mBean) {
		return mModify.entrance(mBean);
	}
	
	// 일정 관리 - 일정 삭제하기
	@RequestMapping(value = "/DeleteSchedule", method = RequestMethod.GET)
	public ModelAndView deleteSchedule(@ModelAttribute ManageBean mBean) {
		return mModify.entrance(mBean);
	}
	
}




