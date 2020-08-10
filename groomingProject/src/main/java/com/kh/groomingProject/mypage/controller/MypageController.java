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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.mypage.model.service.MypageService;
import com.kh.groomingProject.mypage.model.vo.ProfileMember;
import com.kh.groomingProject.mypage.model.vo.Spec;



@Controller
public class MypageController {
	
	@Autowired
	private MypageService mpService; 
	
	@RequestMapping("myPage.do")
	public String myPageView(HttpServletRequest request) {
		
		//임시 Session값 등록
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		String mNo =m.getMemberNo();
		System.out.println(mNo);
		
		int school=0;
		String[] schoolList = new String[3];
		int certificate=0;
		String[] certificateList = new String[3];
		int career=0;
		String[] careerList = new String[3];
		
//		Member loginUser = mpService.testLoginUser(mNo);
		ProfileMember profileInfo = mpService.testLoginUser2(mNo);
		ArrayList<Spec> specList = mpService.selectSpecList(mNo);

		System.out.println(profileInfo);
		for(Spec s : specList) {
			switch (s.getSpecCName()) {
			case "학교":
				schoolList[school]=s.getSpecName();
				school+=1;
				break;
			case "자격증":
				certificateList[certificate]=s.getSpecName();
				certificate+=1;
				break;
			case "경력":
				careerList[career]=s.getSpecName();
				career+=1;
				break;
			default:
				break;
			}
		}

		session.setAttribute("profileInfo",profileInfo);
		session.setAttribute("schoolList",schoolList);
		session.setAttribute("certificateList",certificateList);
		session.setAttribute("careerList",careerList);
		
	
		return "mypage/mypageinfo";
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
		ProfileMember loginUser2 = mpService.testLoginUser2(m.getMemberNo());
		String renameFileName="";
		if(!(loginUser2.getMemberPhoto()).equals("MEMBER_SAMPLE_IMG.JPG")) {
			System.out.println("파일 지우기"+loginUser2.getMemberPhoto());
			deleteFile(loginUser2.getMemberPhoto(), request1);
		}
			renameFileName=saveFile(m.getMemberNo(),profileFile, request1);
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
	private void deleteFile(String fileName, HttpServletRequest request) {
		String root=request.getSession().getServletContext().getRealPath("resources");
		String savePath = root+"\\upprofileFiles";
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
		
	}
	
	
	private String saveFile(String memberNo,MultipartFile file,HttpServletRequest request) {
		String root= request.getSession().getServletContext().getRealPath("resources");
		
		String savePath=root+"\\upprofileFiles";
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
	
	
	@RequestMapping("test1.do")
	public String test() {
		return "mypage/test";
	}
	
	
	
	
	
	
	
	
	
}
