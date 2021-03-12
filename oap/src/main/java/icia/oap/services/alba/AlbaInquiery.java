package icia.oap.services.alba;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.oap.beans.AlbaBean;
import icia.oap.beans.ManageBean;
import icia.oap.mapper.AlbaMapper;

@Service
public class AlbaInquiery {
	
	ModelAndView mav = null;
	
	@Autowired
	private AlbaMapper mapperW;
	@Autowired
	private Gson gson;
	
	public AlbaInquiery() {
		
	}
	
	public ModelAndView entrance(AlbaBean aBean) {
		ModelAndView mav = null;
		
		
		return mav;
	}
	
	


	
}