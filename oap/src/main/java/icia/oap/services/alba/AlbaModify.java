package icia.oap.services.alba;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.oap.beans.AlbaBean;
import icia.oap.mapper.AlbaMapper;

@Service
public class AlbaModify {

	ModelAndView mav = null;

	@Autowired
	private AlbaMapper mapperW;
	@Autowired
	private Gson gson;
	@Autowired
	private PlatformTransactionManager tran;

	public AlbaModify() {

	}

	public ModelAndView entrance(AlbaBean aBean) {
		ModelAndView mav = null;

		switch (aBean.getSCode()) {
		case "Modify":
			mav = this.modifyCtl(aBean);
			break;
		case "ModifyComplete":
			mav = this.modifyCompleteCtl(aBean);
			break;
		case "ModifyComplete2":
			mav = this.modifyComplete2Ctl(aBean);
			break;
		case "ModifyComplete3":
			mav = this.modifyComplete3Ctl(aBean);
			break;
		}

		return mav;
	}

	private ModelAndView modifyCompleteCtl(AlbaBean aBean) {
		ModelAndView mav = new ModelAndView();

			TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
			
			if(this.editPassword(aBean)) {
				System.out.println("업데이트 성공");
				tran.commit(status);
			}
		mav.setViewName("home");	
		 return mav;
	}
	
	private ModelAndView modifyComplete2Ctl(AlbaBean aBean) {
		ModelAndView mav = new ModelAndView();

			TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
			if(this.editName(aBean)) {
				System.out.println("업데이트 성공");
				tran.commit(status);
			}
		mav.setViewName("home");	
		 return mav;
	}
	private ModelAndView modifyComplete3Ctl(AlbaBean aBean) {
		ModelAndView mav = new ModelAndView();

			TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
		 if(this.editAccount(aBean)) {
				System.out.println("업데이트 성공");
				tran.commit(status);
			}
		mav.setViewName("home");	
		 return mav;
	}
	// 알바생 정보 조회 컨트롤
	private ModelAndView modifyCtl(AlbaBean aBean) {
		ModelAndView mav = new ModelAndView();
		String jsonData = gson.toJson(this.getAlbaInfo(aBean));

		mav.addObject("memInfo", jsonData);
		mav.setViewName("modify");
		return mav;
	}

	// 정보조회 매퍼
	private ArrayList<AlbaBean> getAlbaInfo(AlbaBean aBean) {

		return mapperW.getAlbaInfo(aBean);
	}

	private boolean convertToBoolean(int value) {
		return value == 1 ? true : false;

	}

	private boolean editName(AlbaBean aBean) {
		return convertToBoolean(mapperW.editName(aBean));
	}

	private boolean editPassword(AlbaBean aBean) {
		return convertToBoolean(mapperW.editPassword(aBean));
	}

	private boolean editAccount(AlbaBean aBean) {
		return convertToBoolean(mapperW.editAccount(aBean));
	}
}