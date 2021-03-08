package icia.kotlin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;

import icia.kotlin.beans.Movie;
import icia.kotlin.beans.Seat;
import icia.kotlin.mapper.MapperInterface;
import icia.kotlin.mapper.ReservationIf;

@Service
public class Reservation {
	@Autowired
	private ReservationIf mapper;
	@Autowired
	private PlatformTransactionManager tran;
	@Autowired
	private Gson gson;
	public ModelAndView entrance(Movie mv) {

		ModelAndView mav = null;

		if (mv.getMvCode() == null) {
			mav = this.movieListCtl(mv);
		} else {
			switch (mv.getSCode()) {
			case "toDate":
				mav = this.dateCtl(mv);
				break;
			case "toTime":
		
				mav = this.timeCtl(mv);
				break;
			case "toSeat":
				mav = this.seatCtl(mv);
			default:
				break;
			}
		}
		return mav;

	}
private ModelAndView seatCtl(Movie mv) {
    ModelAndView mav = new ModelAndView();
    
   
   
    mav.addObject("SeatInfo" ,gson.toJson(this.getSeat(mv)));
    mav.addObject("Access",this.getCurrentDate('d'));
    
    System.out.println();
    mav.setViewName("SeatChoice");
		return mav;
	}
private ArrayList<Seat> getSeat(Movie mv){
	return mapper.getSeat(mv);
}
//시간선택
	   private ModelAndView timeCtl(Movie mv) {
		      ModelAndView mav = new ModelAndView();
		      
		      String jsonData = gson.toJson(this.getScreeningInfo(mv));
		      System.out.println(jsonData);
		      mav.addObject("SI", jsonData);
		      
		      mav.setViewName("dateChoice");
		      return mav;
		   }

	private ModelAndView dateCtl(Movie mv) {
	      ModelAndView mav = new ModelAndView();
	      
	      /* Start Date */
	      mav.addObject("Access", this.getCurrentDate('d'));

	      
	      /* Movie Info & Convert to JSON */
	      String jsonData = gson.toJson(this.getMovieList(mv));
	      mav.addObject("movieData", jsonData);
	      
	      /* View */
	      mav.setViewName("dateChoice");
	      return mav;
	}
	//날짜선택 매서드 --> 
	private ArrayList<String> makeDate() {
		String timedate = null;
		SimpleDateFormat Format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		ArrayList<String> list = new ArrayList<String>();

		for (int i = 0; i < 7; i++) {
			if (i == 0) {
				cal.add(Calendar.DATE, 0);
			} else {
				cal.add(Calendar.DATE, 1);
			}
			timedate = Format.format(cal.getTime());
			list.add(timedate);
		}
		return list;
	}
	
	   private ArrayList<Movie> getScreeningInfo(Movie mv) {
		      return mapper.getScreeningInfo(mv);
		   }

	private ModelAndView movieListCtl(Movie mv) {
		ModelAndView mav = new ModelAndView();
		ArrayList<Movie> movieList = null;

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E요일");
		mav.addObject("Access", sdf.format(date));


		String jsonData = gson.toJson(this.getMovieList(mv));
		
		mav.addObject("jsonData",jsonData);
		
		
		mav.setViewName("home");
		return mav;
	}

	private ArrayList<Movie> getMovieList(Movie mv) {
		return mapper.getMovieList(mv);
	}
	private String getCurrentDate(char dateType) {
	      Date date = new Date();
	      SimpleDateFormat sdf = (dateType=='f')? new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E요일") :
	         (dateType=='d')? new SimpleDateFormat("yyyy-MM-dd") :
	            (dateType=='t')? new SimpleDateFormat("HH:mm E요일") :null;
	            
	      
	      return sdf.format(date);
	      
	   }
	
	// 영화리스트 -- json 사용시 아래방법 말고 jsp페이지에서 스크립트 구현
	private String makeMovieList(ArrayList<Movie> mList) {
		StringBuffer sb = new StringBuffer();
		int index = 0;
		for (Movie movie : mList) {

			index++;

			// 3으로 나눈 값이 1이면(if 앞에 index++가 있으므로 현 시점에 index는 이미 1)
			// index가 1,4,7,... 등 3n+1일 때마다
			// div를 하나 만들고, 이 div의 style을 flex로 설정
			if (index % 3 == 1) {
				sb.append("<div style=\"display: flex\">");
			}
			sb.append("<div onClick=\"toDate(\'" + movie.getMvCode() + "\')\">");
			sb.append("<div><img src=\"resources/image/" + movie.getMvImage() + "\" /></div>");
			sb.append("<div>" + movie.getMvName() + " / " + movie.getMvGrade() + "등급</div>");
			sb.append("</div>");

			// 3으로 나눈 값이 0이면(index가 3의 배수, 즉 3,6,9,... 등 3n일 때마다 div를 닫음)
			if (index % 3 == 0) {
				sb.append("</div>");
			}

		}

		return sb.toString();
	}
}
