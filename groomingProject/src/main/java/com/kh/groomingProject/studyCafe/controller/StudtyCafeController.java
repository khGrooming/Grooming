package com.kh.groomingProject.studyCafe.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.studyCafe.model.service.StudyCafeService;
import com.kh.groomingProject.studyCafe.model.vo.CafeInfo;
import com.kh.groomingProject.studyCafe.model.vo.Reservation;
import com.kh.groomingProject.studyCafe.model.vo.ReservationView;
import com.kh.groomingProject.studyCafe.model.vo.StudyCafe;

@Controller
public class StudtyCafeController {
	
	@Autowired
	StudyCafeService studyCafeService;
	
	// 카카오맵에서 검색
	@RequestMapping("searchMap.do")
	public String searchMap() {
		return "studyCafe/searchMap";
	}
	
	// 이름으로 검색 첫 화면 이동
	@RequestMapping("searchName.do")
	public ModelAndView searchName(ModelAndView mv) throws JsonIOException, IOException {
		ArrayList<CafeInfo> cafeList = new ArrayList<>();
		
		cafeList = studyCafeService.selectCafeList();
		
		mv.addObject("cafeList", cafeList);
		mv.setViewName("studyCafe/searchName");
		
		return mv;
	}
	
	// 입력 된 이름으로 검색 기능
	@RequestMapping(value="cafeName.do", method=RequestMethod.POST)
	public void getCafeNameList(String name, HttpServletResponse response) throws IOException {
		ArrayList<StudyCafe> list = new ArrayList<>();

		list = studyCafeService.selectCafeNameList(name);
		

		
		response.setContentType("application/json;charset=UTF-8");
		
		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());
	}
	
	// 지역으로 검색 화면으로 이동
	@RequestMapping("searchLocal.do")
	public ModelAndView searchLocal(ModelAndView mv) throws JsonIOException, IOException {
		ArrayList<CafeInfo> cafeList = new ArrayList<>();
		
		cafeList = studyCafeService.selectCafeList();
		
		mv.addObject("cafeList", cafeList);
		mv.setViewName("studyCafe/searchLocal");
		
		return mv;
	}
	
	// 입력 된 지역으로 카페 검색 기능
	@RequestMapping(value="cafeLocal.do", method=RequestMethod.POST)
	public void getCafeLocalList(String name, HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<StudyCafe> list = new ArrayList<>();
		
		list = studyCafeService.selectCafeLocalList(name);
		
		response.setContentType("application/json;charset=UTF-8");
		
		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());
	}
	
	// 카페 디테일 페이지로 이동
	@RequestMapping(value="cafeDetail.do")
	public ModelAndView cafeDetail(ModelAndView mv, CafeInfo cafeNo, String cReserNo) {
		ArrayList<CafeInfo> info = studyCafeService.selectCafeInfo(cafeNo);
		
		mv.addObject("cReserNo", cReserNo);
		mv.addObject("info", info);
		mv.setViewName("studyCafe/cafeDetailView");
		
		return mv;
	}
	
	// 상세보기 들어가서 룸 선택시 일정과 시간을 불러와 예약 가능한지 확인(ajax)
	@RequestMapping(value="checkRoom.do", method=RequestMethod.POST)
	public void checkRoomList(String cPriceNo, String day, HttpServletResponse response) throws JsonIOException, IOException {
		Map str = new HashMap();
		str.put("day", day);
		str.put("cPriceNo", cPriceNo);
		ArrayList<Reservation> list = studyCafeService.selectCheckRoom(str);
		
		response.setContentType("application/json;charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();;
		gson.toJson(list, response.getWriter());
	}
	
	@RequestMapping(value="checkTime.do", method=RequestMethod.POST)
	public void searchTime(String date, String cPriceNo, HttpServletResponse response ) throws JsonIOException, IOException {
		Map str = new HashMap();
		str.put("date", date);
		str.put("cPriceNo", cPriceNo);
		
		ArrayList<Reservation> list = studyCafeService.selectCheckTime(str);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();;
		gson.toJson(list, response.getWriter());
	}
	
	// 최종 예약
	@RequestMapping(value="insertR.do", method=RequestMethod.POST)
	public String insertReservation(Reservation r, String money, Member m) {
		Map rinfo = new HashMap();
		
		ArrayList<ReservationView> rlist = studyCafeService.selectReservation(m.getMemberNo());
		
		for(int i=0; i<rlist.size(); i++) {
			if(r.getcReserNo().equals(rlist.get(i).getcReserNo())) {
				int oldMoney = Integer.valueOf(rlist.get(i).getcRoomPrice()) * rlist.get(i).getcReserHeadCount() *  (Integer.valueOf(rlist.get(i).getcReserETime())- Integer.valueOf(rlist.get(i).getcReserSTime()));
				
				rinfo.put("memberNo", m.getMemberNo());
				rinfo.put("pointList", "카페 예약 취소");
				rinfo.put("addPoint", oldMoney);
				int resultPoint = studyCafeService.pointCalculation(rinfo);
			}
		}
		
		int result = studyCafeService.insertReservation(r);
		
		rinfo.put("memberNo", m.getMemberNo());
		int totalPoint = studyCafeService.checkPoint(rinfo);

		if(totalPoint > Integer.valueOf(money)) {
			rinfo.put("pointList", "카페 예약");
			rinfo.put("addPoint", -Integer.valueOf(money));
			int resultPoint = studyCafeService.pointCalculation(rinfo);			
		}
		
		return "redirect:reservationCheck.do";
	}
	
	// 카페 신청  내역 페이지로 이동
	@RequestMapping(value="reservationCheck.do")
	public ModelAndView reservationCheck(ModelAndView mv, Member m) {
		ArrayList<ReservationView> rlist = studyCafeService.selectReservation(m.getMemberNo());

		mv.addObject("rlist", rlist);
		mv.setViewName("studyCafe/reservationCheck");
		
		return mv;
	}
	
	@RequestMapping(value="reservationHistory.do")
	public ModelAndView rHistoryCheck(ModelAndView mv, Member m) {
		ArrayList<ReservationView> rlist = studyCafeService.rHistoryCheck(m.getMemberNo());
		
		mv.addObject("rlist", rlist);
		mv.setViewName("studyCafe/reservationHistory");
		return mv;
	}
	
	@RequestMapping("cancelR.do")
	public String canccelReservation(String cReserNo, Member m) {
		Map rinfo = new HashMap();

		ArrayList<ReservationView> rlist = studyCafeService.selectReservation(m.getMemberNo());
		
		for(int i=0; i<rlist.size(); i++) {
			if(cReserNo.equals(rlist.get(i).getcReserNo())) {
				int oldMoney = Integer.valueOf(rlist.get(i).getcRoomPrice()) * rlist.get(i).getcReserHeadCount() *  (Integer.valueOf(rlist.get(i).getcReserETime())- Integer.valueOf(rlist.get(i).getcReserSTime()));
				
				rinfo.put("memberNo", m.getMemberNo());
				rinfo.put("pointList", "카페 예약 취소");
				rinfo.put("addPoint", oldMoney);
				int resultPoint = studyCafeService.pointCalculation(rinfo);
			}
		}
		
		int result = studyCafeService.deleteReservation(cReserNo);
		
		return "redirect:reservationCheck.do";
	}
	
	@RequestMapping("checkPoint.do")
	@ResponseBody
	public String checkPoint(int money, String cReserNo, Member m) {
		Map rinfo = new HashMap();
		rinfo.put("memberNo", m.getMemberNo());
		
		int totalPoint = studyCafeService.checkPoint(rinfo);
		
		if(totalPoint >= money) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	
}
