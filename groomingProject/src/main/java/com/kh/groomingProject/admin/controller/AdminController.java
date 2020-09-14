package com.kh.groomingProject.admin.controller;

import static com.kh.groomingProject.common.AdminPagination.getPageInfo;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.groomingProject.admin.model.exception.AdminException;
import com.kh.groomingProject.admin.model.service.AdminService;
import com.kh.groomingProject.admin.model.vo.DeclarationManageView;
import com.kh.groomingProject.admin.model.vo.GraphListCount;
import com.kh.groomingProject.admin.model.vo.GroomingManageView;
import com.kh.groomingProject.admin.model.vo.HelpCategory;
import com.kh.groomingProject.admin.model.vo.HelpManage;
import com.kh.groomingProject.admin.model.vo.MemberManageView;
import com.kh.groomingProject.admin.model.vo.MentoManageView;
import com.kh.groomingProject.alert.model.service.AlertService;
import com.kh.groomingProject.common.AdminPageInfo;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.member.model.vo.MemberAlert;
import com.kh.groomingProject.member.model.vo.MemberCertiCode;
import com.kh.groomingProject.studyCafe.model.service.StudyCafeService;
import com.kh.groomingProject.studyCafe.model.vo.CafeInfo;
import com.kh.groomingProject.studyCafe.model.vo.Point;


@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private StudyCafeService studyCafeService;
	
	@Autowired
	private AlertService alertService;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@RequestMapping("adminMain.do")
	public ModelAndView goMain(ModelAndView mv) {
		
		ArrayList<GraphListCount> clist = adminService.adminGraphCount();
		
		ArrayList<GraphListCount> point = adminService.adminPoint(clist);
		ArrayList<GraphListCount> blist = adminService.adminBoardList(clist);
		ArrayList<GraphListCount> glist = adminService.adminGroomingList(clist);
		ArrayList<GraphListCount> mlist = adminService.adminMemberList(clist);
		System.out.println("point : "+point);
		
		mv.addObject("point", point);
		mv.addObject("clist", clist);
		mv.addObject("mlist", mlist);
		mv.addObject("blist", blist);
		mv.addObject("glist", glist);
		mv.setViewName("admin/adminMain");
		
		return mv;
	}
	
	// 회원 관리
	@RequestMapping("memberManage.do")
	public ModelAndView memberManage(ModelAndView mv,@RequestParam(value="category", required=false) String category ,@RequestParam(value="name", required=false) String name, @RequestParam(value="page", required=false) Integer page) {
		Map info = new HashMap();
		info.put("name", name);
		info.put("category", category);
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = adminService.memberList(info);
		
		AdminPageInfo pi = getPageInfo(currentPage, listCount);
		
		ArrayList<MemberManageView> list = adminService.selectList(pi, info);
		System.out.println("mList : "+list);
		if(list != null) {
			mv.addObject("category", category);
			mv.addObject("name", name);
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("admin/memberManage");
		}else {
			throw new AdminException("회원 조회 실패!");
		}
		
		return mv;
	}
	
	// 포인트 지급 및 차감
	@RequestMapping("pointCalculation.do")
	public String pointCalculation(Point p) {
		int nowPoint = 0;
		
		if(Integer.valueOf(p.getAddPoint()) < 0) {
			p.setPointList("포인트 차감");
			nowPoint = adminService.nowPoint(p);

		}else {
			p.setPointList("포인트 지급");
		}
		
		if(nowPoint + Integer.valueOf(p.getAddPoint()) < 0) {
			p.setAddPoint(-nowPoint);
		}
		
		int result = adminService.pointCalculation(p);
		
		if(result > 0) {
			return "redirect:memberManage.do";			
		}else {
			throw new AdminException("포인트 변경 실패!");
		}
		
	}
	
	@RequestMapping("mentoManage.do")
	public ModelAndView mentoManage(ModelAndView mv, @RequestParam(value="mpage", required=false) Integer mpage, @RequestParam(value="spage", required=false) Integer spage, String category, String searchMento) {

		int scurrentPage = 1;
		int mcurrentPage = 1;
		
		if(mpage != null) {
			mcurrentPage = mpage;
		}
		if(spage != null) {
			scurrentPage = spage;
		}

		int listCount = adminService.selectmentoCount(1);
		int spareCount = adminService.selectmentoCount(2);

		
		AdminPageInfo pi = getPageInfo(mcurrentPage, listCount);
		AdminPageInfo spi = getPageInfo(scurrentPage, spareCount);

		
		ArrayList<MemberManageView> mNo = adminService.selectNo(pi, 1);
		ArrayList<MemberManageView> sNo = adminService.selectNo(spi, 2);


		ArrayList<MentoManageView> mentoList = adminService.selectmentoList(mNo);
		ArrayList<MentoManageView> spareList = adminService.selectSpareMentoList(sNo);

		System.out.println("listCount : "+listCount);
		System.out.println("mNo : "+mNo);
		System.out.println("mentoList : "+mentoList);
		
		mv.addObject("pi", pi);
		mv.addObject("spi", spi);
		
		mv.addObject("mNo",mNo);
		mv.addObject("sNo", sNo);
		
		mv.addObject("mentoList", mentoList);
		mv.addObject("spareMentoList", spareList);
		
		mv.setViewName("admin/mentoManage");

		return mv;
	}
	

	@RequestMapping("groomingManage.do")
	public ModelAndView groomingManage(ModelAndView mv, @RequestParam(value="page", required=false) Integer page, @RequestParam(value="category", required=false) String category,@RequestParam(value="day", required=false) String day,@RequestParam(value="groomingName", required=false) String groomingName) {
		Map str = new HashMap();
		str.put("category", category);
		str.put("day", day);
		str.put("groomingName", groomingName);
		
		System.out.println("str : "+str);
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		int gListCount = adminService.selectGroomingCount(str);
		
		AdminPageInfo pi = getPageInfo(currentPage, gListCount);
		
		ArrayList<GroomingManageView> glist = adminService.selectGroomingList(pi, str);
		
		System.out.println("glist : "+glist);
		
		mv.addObject("category", category);
		mv.addObject("day", day);
		mv.addObject("groomingName", groomingName);
		mv.addObject("pi", pi);
		mv.addObject("glist", glist);
		mv.setViewName("admin/groomingManage");
		
		return mv;
	}
	
	@RequestMapping("gActivation.do")
	public String gActivation(String gActivation, String groomingNo) {
		Map str = new HashMap();
		str.put("gActivation", gActivation);
		str.put("groomingNo", groomingNo);
		System.out.println("그루밍 관리 정보 : "+str);
		
		int result = adminService.gActivation(str);
		System.out.println("그루밍 관리 결과 : "+result);
		if(result > 0) {
			return "redirect:groomingManage.do";
		}else {
			throw new AdminException("그루밍 관리 실패!");
		}
		
	}
	
	@RequestMapping("declarationManage.do")
	public ModelAndView declationManage(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		
		int dListCount = adminService.selectDeclarationCount();
		
		AdminPageInfo pi = getPageInfo(currentPage, dListCount);
		
		ArrayList<MemberManageView> dMemberList = adminService.selectDMemberCount();
		ArrayList<DeclarationManageView> dList = adminService.selectDeclarationList(dMemberList);
		
		ArrayList<MemberManageView> mList = adminService.selectDeclarationMember(pi, dMemberList);
		
		ArrayList<MemberManageView> dCount = adminService.selectDCount(dMemberList);
		ArrayList<MemberManageView> totalCount = adminService.selectTotalCount(dMemberList);

		mv.addObject("pi", pi);
		mv.addObject("dList", dList);
		mv.addObject("mList", mList);
		mv.addObject("dCount", dCount);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("admin/declarationManage");
		
		return mv;
	}
	
	@RequestMapping("sanctionsInsert.do")
	public String sanctionsInsert(String sanctions, Member m, String issue) {
		Map info = new HashMap();
		info.put("sanctions", sanctions);
		info.put("memberNo", m.getMemberNo());
		info.put("issue", issue);
		
		
		int result = 0;
		int resultAlertJoin = 0;
		String message = issue+" 로 경고를 받으셨습니다.";
		
		if(Integer.valueOf(sanctions) == 0) {
			MemberAlert memberAlert = new MemberAlert(message, m.getMemberEmail());
	         System.out.println("경고 알림 : " + memberAlert);
	         resultAlertJoin = alertService.insertAlert(memberAlert);
		}else {
			result = adminService.sanctionsInsert(info);			
		}

		if(result>0 || resultAlertJoin>0) {
			int delResult = adminService.declarationDelete(info);
			if(delResult>0) {
				return "redirect:declarationManage.do";				
			}else {
				throw new AdminException("신고 목록 업데이트 실패!");
			}
		}else {
			throw new AdminException("제재기간 업데이트 실패!");
		}
		
		
	}
	
	
	@RequestMapping("cafeManage.do")
	public ModelAndView cafeManage(ModelAndView mv, @RequestParam(value="page", required=false) Integer page, @RequestParam(value="name", required=false) String name, @RequestParam(value="local", required=false) String local) {
		Map str = new HashMap();
		str.put("name", name);
		str.put("local", local);
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int cListCount = studyCafeService.selectcafeCount(str);
		
		AdminPageInfo pi = getPageInfo(currentPage, cListCount);
		ArrayList<CafeInfo> cafeList = studyCafeService.selectCafeList(pi, str);
		
		mv.addObject("pi", pi);
		mv.addObject("cafeList", cafeList);
		mv.setViewName("admin/cafeManage");
		
		return mv;
	}
	
	@RequestMapping("cafeManageAjax.do")
	public void cafeManageAjax(HttpServletResponse response, @RequestParam(value="page", required=false) Integer page, @RequestParam(value="name", required=false) String name, @RequestParam(value="local", required=false) String local) throws JsonIOException, IOException {
		Map str = new HashMap();
		str.put("name", name);
		str.put("local", local);
		System.out.println("str : "+str);
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int cListCount = studyCafeService.selectcafeCount(str);
		
		AdminPageInfo pi = getPageInfo(currentPage, cListCount);
		ArrayList<CafeInfo> cafeList = studyCafeService.selectCafeList(pi, str);
		
		response.setContentType("application/json;charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();;
		gson.toJson(cafeList, response.getWriter());
	}
	
	@RequestMapping("cafeinfo.do")
	public void cafeDetail(HttpServletResponse response, CafeInfo cafe) throws JsonIOException, IOException {
		ArrayList<CafeInfo> info = studyCafeService.selectCafeInfo(cafe);

		response.setContentType("application/json;charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();;
		gson.toJson(info, response.getWriter());
	}
	
	@RequestMapping(value="cafeInfoChange.do", method=RequestMethod.POST)
	public ModelAndView cafeInfoChange(ModelAndView mv, CafeInfo cafe, @RequestParam(value="uploadFile", required=false) MultipartFile file, HttpServletRequest request, @RequestParam(value="page", required=false) Integer page, @RequestParam(value="name", required=false) String name, @RequestParam(value="local", required=false) String local) {
		Map str = new HashMap();
		str.put("name", name);
		str.put("local", local);
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		if(cafe.getcPriceNo() != null && cafe.getcPriceNo() != "") {
			int cPriceDel = adminService.DeleteCafeInfo(cafe);
		}
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);

			cafe.setCafeImg(renameFileName);
		}
		
		int result = adminService.cafeInfoChange(cafe);
		
		if(result > 0) {
			int cListCount = studyCafeService.selectcafeCount(str);
			
			AdminPageInfo pi = getPageInfo(currentPage, cListCount);
			ArrayList<CafeInfo> cafeList = studyCafeService.selectCafeList(pi,str);
			
			mv.addObject("pi", pi);
			mv.addObject("cafeList", cafeList);
			mv.setViewName("admin/cafeManage");
			
			return mv;
		}else {
			throw new AdminException("카페 정보 변경 실패!");
		}
	}
	
	@RequestMapping(value="insertCafeInfo.do", method=RequestMethod.POST)
	public String insertCafeInfo(CafeInfo cafe, @RequestParam(value="uploadFile", required=false) MultipartFile file, HttpServletRequest request) {
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);

			cafe.setCafeImg(renameFileName);
		}
		
		System.out.println("cafe : "+cafe);
		int result = adminService.insertCafeInfo(cafe);
		
		if(result > 0) {
			return "redirect:cafeManage.do";
		}else {
			throw new AdminException("카페 정보 입력 실패!");
		}

	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\views\\images\\cafeImage";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {	
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."+originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String filePath = folder + "\\" + renameFileName;
		// 실제 저장 될 파일의 경로 + rename 파일명
		
		try {
			file.transferTo(new File(filePath));
			// 이 상태로는 파일 업로드가 되지 않는다.
			// 왜냐하면 파일 제한크기에 대한 설정을 주지 않았기 때문이다.
			// root-context.xml에 업로드 제한 파일 크기를 지정해 주자.
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return renameFileName;
	}
	
	@RequestMapping("mentoFail.do")
	public String mentoFail(String memberNo) {
		int result = adminService.mentoManage(memberNo);
		
		if(result>0) {
			return "redirect:mentoManage.do";			
		}else {
			throw new AdminException("멘토 자격 박탈 실패!");
		}
		
	}
	
	@RequestMapping("mentoSuccess.do")
	public String mentoSuccess(String memberNo) {
		int result = adminService.mentoSManage(memberNo);
		
		if(result>0) {
			return "redirect:mentoManage.do";		
		}else {
			throw new AdminException("멘토 자격 승인 실패!");
		}
		
		
	}
	
	@RequestMapping("careerConfirm.do")
	public String careerConfirm(MentoManageView mv) {
		int result = adminService.careerConfirm(mv);
		System.out.println("mv : "+mv);
		if(result>0) {
			return "redirect:mentoManage.do";
		}else {
			throw new AdminException("멘토 자격 승인 실패!");
		}

	}
	
	// 문의 관리
	@RequestMapping("helpManage.do")
	public ModelAndView helpManage(ModelAndView mv,@RequestParam(value="category", required=false) String category 
			,@RequestParam(value="helpValue", required=false) String helpValue
			, @RequestParam(value="page", required=false) Integer page) {
		Map info = new HashMap();
		info.put("helpValue", helpValue);
		info.put("category", category);
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = adminService.helpListCount(info);
		
		AdminPageInfo pi = getPageInfo(currentPage, listCount);
		
		ArrayList<HelpCategory> hCList = adminService.selectHelpCList();
		
		ArrayList<HelpManage> hList = adminService.selectHelpList(pi, info);
		System.out.println("hList : "+hList);

		if(hList != null) {
			mv.addObject("category", category);
			mv.addObject("helpValue", helpValue);
			mv.addObject("hList", hList);
			mv.addObject("hCList", hCList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/helpManage");
		}else {
			throw new AdminException("문의 조회 실패!");
		}
		
		return mv;
	}

	// 문의 답변
	@RequestMapping("helpAnswer.do")
	@ResponseBody
	public String sendCertiMail(String helpEmailModal, String helpAnswerModal) {
		System.out.println("메일 전송 : " + helpEmailModal + " / " + helpAnswerModal);

		String mailFrom = "onebunonecho@gmail.com";
		String mailTo = helpEmailModal;
		String mailTitle = "문의 답변입니다.";
		String mailContent = "<div marginwidth=\"0\" marginheight=\"0\">\r\n" + 
				"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\r\n" + 
				"style=\"width:100%;background-color:#f8f8f9;letter-spacing:-1px\" align=\"center\">\r\n" + 
				"<tbody>\r\n" + 
				"<tr>\r\n" + 
				"<td align=\"center\">\r\n" + 
				"<div style=\"max-width:595px;margin:0 auto\">\r\n" + 
				"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:595px;width:100%;font-family:'\\00b098\\00b214\\00ace0\\00b515',NanumGothic,'\\00b9d1\\00c740\\00ace0\\00b515',Malgun Gothic,'\\00b3cb\\00c6c0',Dotum,Helvetica,'Apple SD Gothic Neo',Sans-serif;background-color:#fff;text-align:left\" align=\"center\">\r\n" + 
				"<tbody>\r\n" + 
				"<tr><td height=\"30\"></td></tr>\r\n" + 
				"<tr><td style=\"padding-right:27px;padding-left:21px\">\r\n" + 
				"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n" + 
				"<tbody>\r\n" + 
				"<tr><td style=\"padding-right:5px;line-height:34px;font-size:29px;color:#424240;font-family:NanumGothic\">Grooming</td>\r\n" + 
				"<td style=\"vertical-align:bottom;font-size:14px;color:#696969;line-height:13px;font-family:NanumGothic\">문의 답변</td></tr>\r\n" + 
				"</tbody>\r\n" + 
				"</table>\r\n" + 
				"</td>\r\n" + 
				"</tr>\r\n" + 
				"<tr><td height=\"13\"></td></tr>\r\n" + 
				"<tr><td style=\"padding-right:27px;padding-left:18px;line-height:34px;font-size:29px;color:#424240;font-family:NanumGothic\">요청하신 문의를<br><span style=\"color:#1ec800\">답변 드립니다.</span></td></tr>\r\n" + 
				"<tr><td height=\"22\"></td></tr>\r\n" + 
				"<tr><td height=\"1\" style=\"background-color:#e5e5e5\"></td></tr><tr>\r\n" + 
				"<td style=\"padding-top:24px;padding-right:27px;padding-bottom:32px;padding-left:20px\">\r\n" + 
				"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"left\" width=\"100%\">\r\n" + 
				"<tbody>\r\n" + 
				"<tr><td height=\"24\"></td></tr>\r\n" + 
				"<tr><td style=\"font-size:14px;color:#696969;line-height:24px;font-family:NanumGothic\"><strong>답변 내용 : <span style=\"color:#009e25\">" + helpAnswerModal + "</span></strong></td></tr>\r\n" + 
				"<tr><td height=\"24\"></td></tr>\r\n" + 
				"<tr><td style=\"font-size:14px;color:#696969;line-height:24px;font-family:NanumGothic\">Grooming을 이용해 주셔서 감사합니다.<br> 더욱 편리한 서비스를 제공하기 위해 항상 최선을 다하겠습니다.</td></tr>\r\n" + 
				"</tbody>\r\n" + 
				"</table>\r\n" + 
				"</td>\r\n" + 
				"</tr>\r\n" + 
				"<tr><td style=\"padding-top:26px;padding-left:21px;padding-right:21px;padding-bottom:13px;background:#f9f9f9;font-size:12px;font-family:NanumGothic;color:#696969;line-height:17px\">본 메일은 발신전용 입니다. Grooming 서비스관련 궁금하신 사항은 Grooming <a href=\"http://localhost:8888/groomingProject/help.do\" style=\"color:#696969;font-weight:bold;text-decoration:underline\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=http://localhost:8888/groomingProject/help.do\">고객센터</a>에서 확인해주세요.</td></tr>\r\n" + 
				"<tr><td style=\"padding-left:21px;padding-right:21px;padding-bottom:57px;background:#f9f9f9;font-size:12px;font-family:Helvetica;color:#696969;line-height:17px\">\r\n" + 
				"Copyright ⓒ <strong>Grooming</strong> Corp. All Rights Reserved.</td></tr>\r\n" + 
				"</tbody>\r\n" + 
				"</table>\r\n" + 
				"</div>\r\n" + 
				"</td>\r\n" + 
				"</tr>\r\n" + 
				"</tbody>\r\n" + 
				"</table>\r\n" + 
				"</div>";

		final MimeMessagePreparator mmp = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(mailFrom);
				helper.setTo(mailTo);
				helper.setSubject(mailTitle);
				helper.setText(mailContent, true);
			}
		};
		mailSender.send(mmp);

		return "success";

	}
}
