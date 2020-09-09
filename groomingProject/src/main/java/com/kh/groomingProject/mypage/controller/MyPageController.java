package com.kh.groomingProject.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.community.model.vo.Reply;
import com.kh.groomingProject.declaration.model.service.DeclarationService;
import com.kh.groomingProject.declaration.model.vo.Declaration;
import com.kh.groomingProject.grooming.model.exception.GroomingException;
import com.kh.groomingProject.grooming.model.service.GroomingService;
import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.grooming.model.vo.GroomingAppList;
import com.kh.groomingProject.grooming.model.vo.GroomingApplicant;
import com.kh.groomingProject.grooming.model.vo.GroomingHeart;
import com.kh.groomingProject.grooming.model.vo.GroomingSpec;
import com.kh.groomingProject.grooming.model.vo.GroomingTag;
import com.kh.groomingProject.home.model.vo.HomeGrooming;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.mypage.model.exception.MypageException;
import com.kh.groomingProject.mypage.model.service.MypageService;
import com.kh.groomingProject.mypage.model.vo.MemberReport;
import com.kh.groomingProject.mypage.model.vo.MyPageApplicant;
import com.kh.groomingProject.mypage.model.vo.MyPageGrooming;
import com.kh.groomingProject.mypage.model.vo.MyPageHeart;
import com.kh.groomingProject.mypage.model.vo.MyPagePageInfo;
import com.kh.groomingProject.mypage.model.vo.MyPagePoint;
import com.kh.groomingProject.mypage.model.vo.ProfileMember;
import com.kh.groomingProject.mypage.model.vo.Spec;
import com.kh.groomingProject.tag.model.service.TagService;
import com.kh.groomingProject.tag.model.vo.Tag;

import javafx.scene.control.Tab;
import jdk.nashorn.api.scripting.JSObject;
import net.sf.json.JSONObject;

import static com.kh.groomingProject.mypage.controller.MyPagePagination.getPageInfo;


@Controller
public class MyPageController {
	
	@Autowired
	private MypageService mpService; 
	
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private TagService tagService;
	
	@Autowired
	private GroomingService gService;
	
	@Autowired
	private DeclarationService declarationService;	
	
	@RequestMapping("mypage-memberup.do")
	public String myPageView(HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		String mNo =m.getMemberNo();
		ProfileMember profileInfo = mpService.testLoginUser2(mNo);
		int memberPoint = mpService.selectPoint(mNo);
		System.out.println("memberPoint:"+memberPoint);
		System.out.println("myPage.do"+profileInfo);
		if(memberPoint==0) {
			System.out.println("MyPageView메소드의 memberPoint:"+memberPoint);
			profileInfo.setNowPoint("0");
		}else {
			String memberPoint2 = Integer.toString( mpService.selectPoint2(mNo));
			profileInfo.setNowPoint(memberPoint2);
		}
		
		
		specSelect(request, mNo);
		mentorSelect(request, mNo);
		
		session.setAttribute("profileInfo",profileInfo);
		
		
	
		return "mypage/mypage-memberup";
	}
	
	
// ===========스펙 검색 메소드 (검색 후 session에 저장)
	public void specSelect(HttpServletRequest request,String mNo) {
		HttpSession session = request.getSession();
		int school=0;
		String[] schoolList = new String[3];
		String[] schoolconfirm = new String[3];
		int certificate=0;
		String[] certificateList = new String[3];
		String[] certificateconfirm = new String[3];
		int career=0;
		String[] careerList = new String[3];
		String[] careerconfirm = new String[3];

		
		ArrayList<Spec> specList = mpService.selectSpecList(mNo);
		
		for(Spec s : specList) {
			switch (s.getSpecCName()) {
			case "학교":
				schoolList[school]=s.getSpecName();
				schoolconfirm[school]=s.getSpecConfirm();
				
				school+=1;
				break;
			case "자격증":
				certificateList[certificate]=s.getSpecName();
				certificateconfirm[certificate]=s.getSpecConfirm();
				
				System.out.println(s.getSpecName());
				certificate+=1;
				break;
			case "경력":
				careerList[career]=s.getSpecName();
				careerconfirm[career]=s.getSpecConfirm();
				System.out.println(s.getSpecConfirm());
				career+=1;
				break;
			default:
				break;
			}
		}
		
		
		session.setAttribute("schoolList",schoolList);
		session.setAttribute("schoolconfirm",schoolconfirm);
		
		session.setAttribute("certificateList",certificateList);
		session.setAttribute("certificateconfirm",certificateconfirm);
		
		
		session.setAttribute("careerList",careerList);
		session.setAttribute("careerconfirm",careerconfirm);	
	}
	 public void mentorSelect(HttpServletRequest request,String mNo) {
		 HttpSession session = request.getSession();
		 
		 String mentor = mpService.mentorUserSelect(mNo);
		 
		 if(mentor==null) {
			 System.out.println("멘토가 아닙니다");
			 mentor="F";
		 }
		 
		 session.setAttribute("mentor",mentor);
		 
	 }
	
	//==========================================================================
	
	@RequestMapping(value="upproimg.do", method=RequestMethod.POST)
	public String updateProfileIMG(MultipartHttpServletRequest request, ProfileMember m,
			HttpServletRequest request1,
			HttpSession session,
			HttpServletResponse response){
	
		MultipartFile profileFile = request.getFile("profileFile");
		if(profileFile.getOriginalFilename() == "") {
			System.out.println("파일이 업습니다.");
		}
		System.out.println(profileFile.getOriginalFilename());
		System.out.println(m.getMemberNo());
		String folderName = "\\upprofileFiles";
		
		ProfileMember loginUser2 = mpService.testLoginUser2(m.getMemberNo());
		String renameFileName="";
		if(!(loginUser2.getMemberPhoto()).equals("MEMBER_SAMPLE_IMG.JPG")) {
			System.out.println("파일 지우기"+loginUser2.getMemberPhoto());
			deleteFile(loginUser2.getMemberPhoto(), request1,folderName);
			
			
		}
		if(profileFile.getOriginalFilename() == "") {
			renameFileName="MEMBER_SAMPLE_IMG.JPG";
		}else {
			
			renameFileName=saveFile(m.getMemberNo(),profileFile, request1,folderName);
		}
		m.setMemberPhoto(renameFileName);
		
		
		
		System.out.println(renameFileName);
		int result = mpService.updateProfileIMG(m);
		
		ProfileMember profileMember = mpService.testLoginUser2(m.getMemberNo());
		String memberPoint2 = Integer.toString( mpService.selectPoint2(m.getMemberNo()));
		profileMember.setNowPoint(memberPoint2);
		session.setAttribute("profileInfo",profileMember);
		Member loginUser = (Member)session.getAttribute("loginUser");
		loginUser.setMemberPhoto(renameFileName);
		session.setAttribute("loginUser",loginUser);
		
		return "mypage/mypage-memberup";
	}
	
	//==========================================================================
	private void deleteFile(String fileName, HttpServletRequest request,String folderName) {
		String root=request.getSession().getServletContext().getRealPath("resources");
		String savePath = root+folderName;
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
		
	}
	
	
	private String saveFile(String memberNo,MultipartFile file,HttpServletRequest request, String folderName) {
		String root= request.getSession().getServletContext().getRealPath("resources");
		
		String savePath=root+folderName;
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			//webapp 아래에 있는 resources 폴더 아래에 nuploadFiles가 없어서 File객체를 찾을 수 없다면
			folder.mkdirs();
		}
		//공지글은 파일명 중복 제거는 신경쓰지 않고 했지만
		//게시판에서는 파일명을 날ㄹ짜(엡로드시간)로 rename해보자
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddHHmmss");
		String originFileName=file.getOriginalFilename();
		System.out.println("sava메소드에서"+originFileName);
		String renameFileName = memberNo+sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."+originFileName.substring(originFileName.lastIndexOf(".")+1);
		System.out.println("sava메소드에셔"+renameFileName);
		String filePath = folder +"\\" +renameFileName;
		//실제 저장될 파일의 경로 + rename파일명
		
		try {
			file.transferTo(new File(filePath));
			//이 상태로는 파일 업로드가 되지 않는다
			//왜냐면 파일 제한크기에 대한 설정을 주지 않았기 때문이다.
			//root-context.xml에 업로드 제한 파일 크기를 지정해 주자.
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}		
		return renameFileName;
				
	}
	
	
	@RequestMapping(value="upMemo.do",method=RequestMethod.POST)
	public void updateMemo(String memberMemo
						   ,HttpServletRequest request
						   ) {
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		m.setMemberMemo(memberMemo);
		
		System.out.println(memberMemo);
		System.out.println(m.getMemberNo());
		int result = mpService.updateMemo(m);

		if(result > 0) {
			System.out.println("성공");
		}
	}
	
	
	

	
	
	
	@RequestMapping(value="pwdCheck.do",method=RequestMethod.POST)
	public void pwdCheck(HttpServletResponse response
						,HttpServletRequest request
						,String inputPwd) throws IOException {

		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		PrintWriter out = response.getWriter(); 
		System.out.println(inputPwd);
		System.out.println(m);
		if(bcryptPasswordEncoder.matches(inputPwd,m.getMemberPwd())) {
			System.out.println("비번 확인 : 성공");
			out.append("Y");
		} else {
			System.out.println("비번 확인 : 실패");
			out.append("N");
		}
		

		
		out.flush();
		out.close();
	}
	
	
	@RequestMapping("memberDel.do")
	public String memberDel(SessionStatus status, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		
		int result = mpService.memberDelete(m);
		
		if(result > 0) {
			
			session.invalidate();
		}else {
			System.out.println("탈퇴실패");
		}

		System.out.println("퇄퇴");
		return "home";
	}
	

	@RequestMapping("memberup.do")
	public String memberUpdate(Member m,HttpServletRequest request) {
		System.out.println(m);
		HttpSession session = request.getSession();
		Member pwdM = (Member)session.getAttribute("loginUser");
		if(m.getMemberPwd()=="") {
			m.setMemberPwd(pwdM.getMemberPwd());
		}else {
			String encPwd=bcryptPasswordEncoder.encode(m.getMemberPwd());
			m.setMemberPwd(encPwd);
		}
		System.out.println("memberup.do"+m);
		
		int result = mpService.memberInfoUpdate(m);
		if(result > 0) {
			System.out.println("수정 완료");
			Member loginUser = mpService.selectMember(pwdM.getMemberNo());
			ProfileMember profileInfo = mpService.testLoginUser2(pwdM.getMemberNo());
			
			System.out.println("정보수정 후 loginUser"+loginUser);
			System.out.println("정보수정 후 profileInfo"+profileInfo);
			session.setAttribute("loginUser",loginUser);
			session.setAttribute("profileInfo",profileInfo);
		}else {
			System.out.println("수정 실패:memberUpdate 반드시 throw 할것");
		}
		
		return "mypage/mypage-memberup";
	}
	
	@RequestMapping(value="insertSpec.do",method=RequestMethod.POST)
	public String insertSpect(MultipartHttpServletRequest request,HttpServletRequest request1, Spec s) {
		
		String folderName = "//upSpecFiles";
		
		if(request1.getAttribute("mentorFome") == "Y") {
			System.out.println("마자마자");
		}
		
		MultipartFile specFile = request.getFile("specFileName1");
		System.out.println(specFile.getOriginalFilename());
		
		String specFileName = saveFile(s.getMemberNo(), specFile, request1, folderName);
		s.setSpecFileName(specFileName);
		int result = mpService.insertSpec(s);
		
		if(result > 0) {
			System.out.println("등록 성공");
			HttpSession session = request.getSession();
		
			specSelect(request, s.getMemberNo());
			
		
		}
		

		return "mypage/mypage-memberup";
	}
	
	@RequestMapping("mentorA.do")
	public void mentorA(MultipartHttpServletRequest request, Spec s,
			HttpServletRequest request1,
			HttpServletResponse response) throws IOException {
		String folderName = "//upSpecFiles";
		
		if(request1.getAttribute("mentorFome") == "Y") {
			System.out.println("마자마자");
		}
		
		MultipartFile specFile = request.getFile("specFileName1");
		System.out.println(specFile.getOriginalFilename());
		
		String specFileName = saveFile(s.getMemberNo(), specFile, request1, folderName);
		s.setSpecFileName(specFileName);
		int result = mpService.insertSpec(s);
		PrintWriter out=response.getWriter();
		if(result > 0) {
			System.out.println("등록 성공");
			HttpSession session = request.getSession();
		
			specSelect(request, s.getMemberNo());
		
		}
		System.out.println("갔다 안오나?");
		out.append("Y");
		
		
		
		out.flush();
		out.close();
		
	}
	
	@RequestMapping("mentor.do")
	public String mentorPage(HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		return "mypage/mentor";
	}
	
	
	@RequestMapping("memberSecession.do")
	public String memberSecession() {
		return "mypage/memberSecession";
	}
	
	@RequestMapping("mentorApply")
	public String mentorApply(HttpSession session,HttpServletRequest request) {
		
		String mNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		int result = mpService.insertMentor(mNo);
		
		if(result>0) {
			mentorSelect(request,mNo);
			return "mypage/mentor";
		}else {
			throw new MypageException("멘토 등록 실패");
		}
		
	}
	
	
//	개설한 스터디 그룹 리스트
	@RequestMapping("opengrooming.do")
	public ModelAndView opengroomingPage(ModelAndView mv,HttpSession session
										, @RequestParam(value="page", required=false) Integer page) {
		
		String mNo= ((Member)session.getAttribute("loginUser")).getMemberNo();
		System.out.println(mNo);
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = mpService.mpSelectListCount(mNo);
		int GroomingLimit = 4;
		double f=0.8;
		MyPagePageInfo pi = getPageInfo(currentPage, listCount, GroomingLimit,f);
		
		ArrayList<HomeGrooming> openGroomingList = mpService.selectopenGroomingList(pi,mNo);
		System.out.println("개설한 스터디 리스트"+openGroomingList);
		
		if(openGroomingList != null) {
			mv.addObject("pi", pi);
			mv.addObject("openGroomingList", openGroomingList);
			
		}

		mv.addObject("listCount",listCount);
		
		mv.setViewName("mypage/opengrooming");
		
		return mv;
	}
	
	
//	찜 목록 리스트
	@RequestMapping("GHeart.do")
	public ModelAndView GHeartPage(ModelAndView mv,HttpSession session
								   ,@RequestParam(value="page", required=false) Integer page) {
		String mNo= ((Member)session.getAttribute("loginUser")).getMemberNo();
		System.out.println("GHeart.do에서 mNo :"+mNo);
		
		int currentPage =1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = mpService.heartListCount(mNo);
		System.out.println("GHeart.do에서 listCount:"+listCount);
		int GroomingLimit = 5;
		double f = 0.8;
		MyPagePageInfo pi = getPageInfo(currentPage, listCount, GroomingLimit,f);
		
		
		ArrayList<MyPageHeart> hlist = mpService.selectMyPageHeart(pi,mNo);
		System.out.println("GHeart.do에서 mNo :"+hlist);
		if(hlist != null) {
			mv.addObject("pi", pi);
			mv.addObject("hlist", hlist);
		}else {
			throw new MypageException("찜목록 조회 실패");
		}
		System.out.println(hlist);
		mv.addObject("listCount",listCount);
		mv.setViewName("mypage/gHeart");
		return mv;
	}
	
	
//	찜 목록 지우기
	@RequestMapping("heartDele.do")
	public ModelAndView HeartDelete(HttpServletRequest request,ModelAndView mv) {
		String[] checkList =(request.getParameter("checkList")).split(",");
		
		System.out.println("하트 지우러 옴:");
		int result=0;
		for(int a=0;a<checkList.length;a++) {
			System.out.println(checkList[a]);
			result = mpService.heartListDelete(checkList[a]);
			if(result <0) {
				throw new MypageException("찜목록 삭제 실패");
			}
		}
		mv = GHeartPage(mv,request.getSession(),1);
		mv.setViewName("mypage/gHeart");
		return mv;
	}
	
//	신청한 스터디 그룹 
	@RequestMapping("gApplicant.do")
	public String GApplicantPage(HttpSession session,HttpServletRequest request
								,@RequestParam(value="page",required=false) Integer page) {
		String mNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		int listCount = mpService.gApplicantListCount(mNo);
		int currentPage=1;
		if(page != null) {
			currentPage = page;
		}
		int GroomingLimit = 4;
		double f=0.8;
		MyPagePageInfo pi = getPageInfo(currentPage, listCount, GroomingLimit,f);
		
		ArrayList<MyPageApplicant> gApplicantList = mpService.selectgApplicant(pi,mNo);
		
		if(gApplicantList != null) {
			session.setAttribute("pi", pi);
			session.setAttribute("appList",gApplicantList);
			return "mypage/gApplicant";
		}else {
			throw new MypageException("신청내역 조회 실패");
		}
		
		
		
	}

	//신청한 스터디 그룹 삭제하기
	@RequestMapping("deleteAppl.do")
	public void deleteApplicant(ModelAndView mv,HttpSession session,String gApplyNo,HttpServletResponse response,String memberNo,@RequestParam(value="page",required=false) Integer page) throws IOException {
		
		int result=mpService.deleteApplicant(gApplyNo);
		PrintWriter out = response.getWriter();
		if(result > 0) {
			int listCount = mpService.gApplicantListCount(memberNo);
			int currentPage=1;
			if(page != null) {
				currentPage = page;
			}
			int GroomingLimit = 4;
			double f=0.8;
			MyPagePageInfo pi = getPageInfo(currentPage, listCount, GroomingLimit,f);
			
			ArrayList<MyPageApplicant> gApplicantList = mpService.selectgApplicant(pi,memberNo);
			
			if(gApplicantList != null) {
				session.setAttribute("pi", pi);
				session.setAttribute("appList",gApplicantList);
				out.append("Y");
				out.flush();
				out.close();
			}
		}else {
			throw new MypageException("신청내역 삭제 실패");
		}
		
		
		
		
	}
	
	//진행중인 그루밍 보여주기
	@RequestMapping("mpgrooming.do")
	public String myPageGroomingPage(HttpSession session,@RequestParam(value="page",required=false) Integer page
														,@RequestParam(value="pageh",required=false) Integer pageh) {
		String mNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		int listCount = mpService.selectGroomingMemberCount(mNo);
		int currentPage=1;
		if(page != null) {
			currentPage = page;
		}
		int GroomingLimit = 4;
		double f=0.8;
		MyPagePageInfo pi = getPageInfo(currentPage, listCount, GroomingLimit,f);
		
		ArrayList<MyPageGrooming> mpgList = mpService.selectMypageGmember(pi,mNo);
		System.out.println(mpgList);
		
		session.setAttribute("mpgList",mpgList);
		session.setAttribute("pi", pi);
		
		int HlistCount = mpService.selectGroomingHostCount(mNo);
		int currentPageh=1;
		if(pageh != null) {
			currentPageh = pageh;
		}
		int GroomingLimith = 4;
		double fh=0.8;
		MyPagePageInfo pih = getPageInfo(currentPageh, HlistCount, GroomingLimit,fh);
		
		ArrayList<MyPageGrooming> hpgList = mpService.selectMypageGhost(pih,mNo);
		session.setAttribute("hpgList",hpgList);
		session.setAttribute("pih", pih);
		
		
		return "mypage/mpgrooming";
	}
	
	//임시저장 페이지 이동 및 데이터 불러오기
	@RequestMapping("ginsertTemp.do")
	public String groomingInsertHistory(HttpSession session) {
		String mNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		String TempGno = mpService.selectTempGroomingNo(mNo);
		
		Grooming groomingTemp = mpService.selectGroomingTemp(mNo);
		String str = "";
		
		if(groomingTemp != null){
			ArrayList<Tag> tlist = tagService.selectGtagList(TempGno);
		
			if(tlist != null) {
				for (int i = 0; i < tlist.size(); i++) {
					str += tlist.get(i).getTagName();
					if ((i + 1) < tlist.size()) {
						str += ',';
					}
				}
			}
		
		}
		session.setAttribute("grooming",groomingTemp);
		session.setAttribute("tlist", str);
		return "mypage/ginsertTemp";
	}
	
	@RequestMapping("mypagePoint.do")
	public ModelAndView myPagePoint(ModelAndView mv,HttpSession session) {
		String mNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		ArrayList<MyPagePoint> pList = mpService.selectPointList(mNo);
		mv.addObject("pList",pList);
		
		mv.setViewName("mypage/mypagePoint");
		System.out.println(pList);
		
		return mv;
	}
	
	@RequestMapping("pointPay.do")
	public void pointPay(String mNo, String money,HttpServletResponse response) throws IOException {
		System.out.println("pointPay.do 클래스: "+mNo+","+money);
		int intMoney = (Integer.valueOf(money))/10;
		MyPagePoint insertPoint = new MyPagePoint(mNo, intMoney, "포인트 충전");
		
		int result= mpService.insertPoint(insertPoint);
		
		if(result > 0) {
			Date time = new Date();
			String format1 = (new SimpleDateFormat ("yyyy-MM-dd")).format(time);
			System.out.println( insertPoint.getPointList());
			JSONObject job = new JSONObject();
			response.setContentType("application/json;charset=utf-8");
			job.put("addPoint", insertPoint.getAddPoint());
			job.put("pointList", insertPoint.getPointList());
			job.put("pointDate", format1);
			
			PrintWriter out = response.getWriter();
			out.print(job);
			out.flush();
			out.close();
		}else {
			throw new MypageException("포인트 충전 실패");
		}
	}
	

	@RequestMapping("profilePage.do")
	public ModelAndView profilePage(ModelAndView mv,HttpSession session,String pfMemberNo ,@RequestParam(value="pageh",required=false) Integer pageh) {
		ProfileMember profileInfo = mpService.testLoginUser2(pfMemberNo);
		String mentor = mpService.mentorUserSelect(pfMemberNo);
		 if(mentor==null) {
			 mentor="F";
		 }
		 
		 int school=0;
		String[] schoolList = new String[3];
		int certificate=0;
		String[] certificateList = new String[3];
		int career=0;
		String[] careerList = new String[3];
		
		
		ArrayList<Spec> specList = mpService.selectSpecList(pfMemberNo);
		
		for(Spec s : specList) {
			switch (s.getSpecCName()) {
			case "학교":				
				if(s.getSpecConfirm().equals("Y")) {
					schoolList[school]=s.getSpecName();
					school+=1;
				}
				break;
			case "자격증":
				if(s.getSpecConfirm().equals("Y")) {
				certificateList[certificate]=s.getSpecName();
				certificate+=1;
				}
				
				break;
			case "경력":
				if(s.getSpecConfirm().equals("Y")) {
				careerList[career]=s.getSpecName();
				career+=1;
				}
				
				break;
			default:
				break;
			}
		}
		
		int HlistCount = mpService.selectGroomingHostCount(pfMemberNo);
		int currentPageh=1;
		if(pageh != null) {
			currentPageh = pageh;
		}
		int GroomingLimith = 4;
		double fh=0.8;
		MyPagePageInfo pih = getPageInfo(currentPageh, HlistCount, GroomingLimith,fh);
		
		ArrayList<HomeGrooming> openGroomingList = mpService.selectopenGroomingList(pih,profileInfo.getMemberNo());
	
		MemberReport repM = new MemberReport(((Member)session.getAttribute("loginUser")).getMemberNo(),profileInfo.getMemberNo());
		MemberReport repInfo = mpService.selectReportInfo(repM);
		
		mv.addObject("repInfo", repInfo);
		mv.addObject("pih", pih);
		mv.addObject("hpgList", openGroomingList);
		mv.addObject("profileInfo", profileInfo);
		mv.addObject("schoolList", schoolList);
		mv.addObject("certificateList", certificateList);
		mv.addObject("careerList", careerList);
		mv.addObject("mentor", mentor);
		mv.setViewName("mypage/profilePage");
		return mv;
	}
	@RequestMapping(value="memberReport.do",method=RequestMethod.POST)
	public void memberReport(MemberReport mr,HttpServletResponse response) throws IOException {
	
		int result = mpService.insertMemberReport(mr);
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.append("Y");
			
		}else {
			System.out.println("에러처리");
		}
		out.flush();
		out.close();
				
	}
	
	@RequestMapping("mypageCommunity.do")
	public ModelAndView mypageCommunity(ModelAndView mv,HttpSession session,@RequestParam(value="page",required=false) Integer page) {
		String mNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		int bCount = mpService.selectMyCommunityCount(mNo);
		int currentPage=1;
		if(page != null) {
			currentPage = page;	
		}
		int GroomingLimit= 10;
		double f=0.9;
		MyPagePageInfo pi = getPageInfo(currentPage, bCount, GroomingLimit,f);
		ArrayList<Board> blist = mpService.selectMemberBoardList(mNo,pi);
		System.out.println(blist);
		
		mv.addObject("blist",blist);
		mv.addObject("pi",pi);
		mv.setViewName("mypage/mypageCommunity");
		return mv;
	}
	
	@RequestMapping("mypageReply.do")
	public ModelAndView mypageReply(ModelAndView mv,HttpSession session,@RequestParam(value="page",required=false) Integer page) {
		String mNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		int rCount = mpService.selectMyReplyCount(mNo);
		System.out.println(rCount);
		int currentPage=1;
		if(page != null) {
			currentPage = page;	
		}
		int GroomingLimit= 10;
		double f=0.9;
		MyPagePageInfo pi = getPageInfo(currentPage, rCount, GroomingLimit,f);
		
		ArrayList<Reply> rlist = mpService.selectMemberReplyList(mNo,pi);
		System.out.println(rlist);
		mv.addObject("pi", pi);
		mv.addObject("rlist", rlist);
		mv.setViewName("mypage/mypageReply");
		
		return mv;
	}
	@RequestMapping("test.do")
	public ModelAndView test(ModelAndView mv,HttpSession session, String groomingNo, String memberNo
			, @RequestParam(value = "page", required = false) Integer page) {
		groomingNo = "G00017";
		memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		int result = gService.addReadCount(groomingNo);
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		System.out.println("test에서 result"+result);
		if (result > 0) {
			Grooming grooming = gService.selectGrooming(groomingNo);

			ArrayList<GroomingTag> tag = gService.selectTag(groomingNo);
			ArrayList<GroomingSpec> spec = gService.selectSpec(groomingNo);
			Member member = gService.selectMember(groomingNo);
			ArrayList<Member> galist = gService.selectAppMember(groomingNo);

			ArrayList<GroomingAppList> appList = gService.selectAppContent(groomingNo);
			Map info = new HashMap();
			info.put("groomingNo", groomingNo);
			info.put("memberNo", memberNo);
			Declaration declaration = declarationService.selectGroomingDeclare(info);
			GroomingApplicant memberNoList = gService.selectAppMemberNo(info);
			GroomingHeart heart = gService.selectHeartMember(info);
			System.out.println("나 heart야 " +heart);

			if (grooming != null && tag != null && spec != null && member != null) {
				mv.addObject("grooming", grooming).addObject("tag", tag).addObject("spec", spec)
						.addObject("member", member).addObject("appList", appList)
						.addObject("memberNoList", memberNoList).addObject("heart", heart).addObject("currentPage" , currentPage)
						.setViewName("mypage/test");
			} else {
				throw new GroomingException("조회실패!");
			}

		} else {
			throw new GroomingException("게시글 조회수 증가 실패!");
		}

		return mv;
	}

}
