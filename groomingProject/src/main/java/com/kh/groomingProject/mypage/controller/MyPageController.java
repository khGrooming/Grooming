package com.kh.groomingProject.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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

import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.mypage.model.exception.MypageException;
import com.kh.groomingProject.mypage.model.service.MypageService;
import com.kh.groomingProject.mypage.model.vo.ProfileMember;
import com.kh.groomingProject.mypage.model.vo.Spec;



@Controller
public class MyPageController {
	
	@Autowired
	private MypageService mpService; 
	
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	

	@RequestMapping("mypage-memberup.do")
	public String myPageView(HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		String mNo =m.getMemberNo();
		System.out.println(mNo);
		ProfileMember profileInfo = mpService.testLoginUser2(mNo);
		System.out.println("myPage.do"+profileInfo);
		
		
//		int school=0;
//		String[] schoolList = new String[3];
//		String[] schoolconfirm = new String[3];
//		int certificate=0;
//		String[] certificateList = new String[3];
//		String[] certificateconfirm = new String[3];
//		int career=0;
//		String[] careerList = new String[3];
//		String[] careerconfirm = new String[3];
//
//		
//		ArrayList<Spec> specList = mpService.selectSpecList(mNo);
//
//		
//		for(Spec s : specList) {
//			switch (s.getSpecCName()) {
//			case "학교":
//				schoolList[school]=s.getSpecName();
//				schoolconfirm[school]=s.getSpecConfirm();
//				
//				school+=1;
//				break;
//			case "자격증":
//				certificateList[certificate]=s.getSpecName();
//				certificateconfirm[certificate]=s.getSpecConfirm();
//				
//				certificate+=1;
//				break;
//			case "경력":
//				careerList[career]=s.getSpecName();
//				careerconfirm[career]=s.getSpecConfirm();
//				
//				career+=1;
//				break;
//			default:
//				break;
//			}
//		}
//
//		
//		session.setAttribute("schoolList",schoolList);
//		session.setAttribute("schoolconfirm",schoolconfirm);
//		
//		session.setAttribute("certificateList",certificateList);
//		session.setAttribute("certificateconfirm",certificateconfirm);
//		
//		
//		session.setAttribute("careerList",careerList);
//		session.setAttribute("careerconfirm",careerconfirm);		
		
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
		System.out.println(specList);
		
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
				
				certificate+=1;
				break;
			case "경력":
				careerList[career]=s.getSpecName();
				careerconfirm[career]=s.getSpecConfirm();
				
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
		 
		 System.out.println("mentor:"+mentor);
		 if(mentor==null) {
			 System.out.println("멘토가 아닙니다");
			 mentor="F";
		 }
		 
		 session.setAttribute("mentor",mentor);
		 
	 }
	
	//==========================================================================
	
	@RequestMapping(value="upproimg.do", method=RequestMethod.POST)
	public void updateProfileIMG(MultipartHttpServletRequest request, ProfileMember m,
			HttpServletRequest request1,
			HttpSession session,
			HttpServletResponse response) throws IOException {
	
		MultipartFile profileFile = request.getFile("profileFile");
		System.out.println(profileFile.getOriginalFilename());
		System.out.println(m.getMemberNo());
		String folderName = "\\upprofileFiles";
		
		ProfileMember loginUser2 = mpService.testLoginUser2(m.getMemberNo());
		String renameFileName="";
		if(!(loginUser2.getMemberPhoto()).equals("MEMBER_SAMPLE_IMG.JPG")) {
			System.out.println("파일 지우기"+loginUser2.getMemberPhoto());
			deleteFile(loginUser2.getMemberPhoto(), request1,folderName);
		}
			renameFileName=saveFile(m.getMemberNo(),profileFile, request1,folderName);
			m.setMemberPhoto(renameFileName);
		
		System.out.println(renameFileName);
		
		int result = mpService.updateProfileIMG(m);
		
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			
			
			out.print(renameFileName);
			out.flush();
			out.close();
		}else {
			System.out.println("오륭다");
		}
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
		System.out.println(m.getMemberPwd());
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
		
		return "mypage/mypageinfo";
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
		System.out.println("Sdfasdf"+s);
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
	public String mentorPage() {
		return "mypage/mentor";
	}
	
	
	@RequestMapping("memberSecession.do")
	public String memberSecession() {
		return "mypage/memberSecession";
	}
	
	@RequestMapping("mentorApply")
	public String mentorApply(HttpSession session) {
		String mNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		int result = mpService.insertMentor(mNo);
		
		if(result>0) {
			return "home";
		}else {
			throw new MypageException("멘토 등록 실패");
		}
		
	}
	
}
