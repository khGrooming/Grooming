package com.kh.groomingProject.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.groomingProject.alert.model.service.AlertService;
import com.kh.groomingProject.member.model.service.MemberService;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.member.model.vo.MemberAlert;
import com.kh.groomingProject.member.model.vo.MemberTag;
import com.kh.groomingProject.tag.model.service.TagService;
import com.kh.groomingProject.tag.model.vo.Tag;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	@Autowired
	private TagService tagService;
	
	@Autowired
	private AlertService alertService;

	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("loginPage.do")
	public ModelAndView loginPage(ModelAndView mv, String url) {

//		System.out.println("request.getParameter(\"pageHistory\") : " + request.getParameter("pageHistory"));
		
		mv.addObject("url", url)
		.addObject("loginCheck", "login")
		.setViewName("member/memberLoginRegistration");

		return mv;
	}

	@RequestMapping("registerPage.do")
	public ModelAndView registerPage(ModelAndView mv, String url) {

		mv.addObject("url", url)
		.addObject("loginCheck", "register")
		.setViewName("member/memberLoginRegistration");

		return mv;
	}

	@RequestMapping("memberInsert.do")
	@ResponseBody
	public String memberInsert(Member m) {
		String message = "";
		System.out.println("회원가입 (프론트정보): " + m);

		String emcPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());

		m.setMemberPwd(emcPwd);

		// 회원가입 (insert)
		int resultInsertMember = mService.insertMember(m);
		
		// 회원가입 (select)
		Member member = mService.loginMember(m);
		System.out.println("회원가입 정보 : " + m);

		message = "신규가입을 환영합니다.";
		
		MemberAlert memberAlert = new MemberAlert(member.getMemberNo(), message);
		System.out.println("회원가입 (신규 가입 알림 추가) : " + memberAlert);
		
		// 회원가입 (신규 가입 알림 추가)
		int resultAlertJoin = alertService.insertAlert(memberAlert);

		// 회원가입 (신규포인트 지급)
		int resultWelcomePoint = mService.welcomePoint(member.getMemberNo());
		
		message = "신규가입 감사 포인트가 지급 되었습니다.";
		
		memberAlert.setAlertContent(message);
		System.out.println("회원가입 (신규포인트 지급) : " + memberAlert);
		
		// 회원가입 (신규 가입 감사 포인트 알림 추가)
		int resultAlertPoint = alertService.insertAlert(memberAlert);

		if(resultInsertMember == 0) {
			System.out.println("회원가입 (insert): 실패");

		} else if(member.getMemberNo() == null) {
			System.out.println("회원가입 (select): 실패");

		} else if(resultAlertJoin == 0) {
			System.out.println("회원가입 (신규 가입 알림 추가): 실패");
			
		} else if(resultWelcomePoint == 0) {
			System.out.println("회원가입 (신규포인트 지급): 실패");
			
		} else if(resultAlertPoint == 0) {
			System.out.println("회원가입 (신규 가입 감사 포인트 알림 추가): 실패");
			
		} else {
			System.out.println("회원가입 확인 : 성공");
			return "success";
		}
		return "fail";

	}
	
	private String saveFile(String memberNo,MultipartFile file,HttpServletRequest request) {
		String root= request.getSession().getServletContext().getRealPath("resources");
		
		String savePath=root+"\\upprofileFiles";
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddHHmmss");
		String originFileName=file.getOriginalFilename();
		String renameFileName = memberNo+sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."+originFileName.substring(originFileName.lastIndexOf(".")+1);
		String filePath = folder +"\\" +renameFileName;

		try {
			file.transferTo(new File(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("변경된 파일 명 : " + renameFileName);
		
		return renameFileName;

	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String root=request.getSession().getServletContext().getRealPath("resources");
		String savePath = root+"\\upprofileFiles";
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
		
	}
	
	@RequestMapping("memberOptionUpdate.do")
	public String memberOptionUpdate(HttpServletRequest request, Member m, String tagName
			,@RequestParam(value="profileFile", required=false) MultipartFile file) {
		System.out.println("회원가입 추가 // 멤버 이메일  : " + m.getMemberEmail()
						+ " 멤버 이름 : " + m.getMemberMemo()
						+ " 멤버 성별 : " + m.getMemberGender()
						+ " 멤버 사진 : " + m.getMemberPhoto()
						+ " 멤버 메모 : " + m.getMemberMemo());
		System.out.println("Tags : " + tagName);
		
		Member member = mService.loginMember(m);
		System.out.println("회원가입(추가입력) 하려는 회원 : " + member);
		
		m.setMemberNo(member.getMemberNo());
		
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(member.getMemberNo(), file, request);

			m.setMemberPhoto(renameFileName);
		} else {
			m.setMemberPhoto("MEMBER_SAMPLE_IMG.JPG");
		}
		
		System.out.println("member update data : " + m);

		int result = mService.updateMemberOption(m);

		System.out.println("member update result : " + result);

		if(result > 0) {
			System.out.println("회원가입 추가정보 업데이트 : 성공");
		} else {
			System.out.println("회원가입 추가정보 업데이트 : 실패");
		}

		// 태그 테이블 업데이트
		if(!tagName.isEmpty()) {
			String[] tag = tagName.split(",");
	
			for(int i = 0 ; i < tag.length; i++) {
				String tagTemp = tag[i];
				result = tagService.mergeTags(tagTemp);
			}
		}
		
		if(result > 0) {
			System.out.println("TAG 업데이트 : 성공");
		} else {
			System.out.println("TAG 업데이트 : 실패");
		}

		// 멤버태그 테이블 추가
//		ArrayList<Tag> tag = tagService.selectList()
		
//		ArrayList<MemberTag> memberTag = new ArrayList<MemberTag>();
//		System.out.println("memberTag : " + memberTag);
		


//		if(result > 0) {
//			System.out.println("회원가입 추가정보 업데이트 : 성공");
//			return "success";
//		} else {
//			System.out.println("회원가입 추가정보 업데이트 : 실패");
//			return "fail";
//		}
		
		return "home";
	}

	@RequestMapping("memberLogin.do")
	@ResponseBody
	public String memberLogin(Member m, Model model) {
		
		System.out.println("memberLogin : " + m);
		
		Member loginUser = mService.loginMember(m);
		
		if(bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			System.out.println("로그인 확인 : 성공");
			model.addAttribute("loginUser", loginUser);
			return "success";
		} else {
			System.out.println("로그인 확인 : 실패");
			return "fail";
		}
		
	}
	
	@RequestMapping("logout.do")
	public String logout(SessionStatus status){
		status.setComplete();

		return "home";
		
	}
	
	@RequestMapping("emailDuplicateChk.do")
	@ResponseBody
	public String emailDuplicateChk(Member m) {
		
		System.out.println("이메일 중복 확인 : " + m.getMemberEmail());
		
		int result = mService.emailDuplicateChk(m);
		
		if(result == 0) {
			System.out.println("이메일 중복 확인 : " + m.getMemberEmail() + "( 사용가능 )");
			return "success";
		} else {
			System.out.println("이메일 중복 확인 : " + m.getMemberEmail() + "( 사용 중 )");
			return "fail";
		}

	}
	
	@RequestMapping("nickNameDuplicateChk.do")
	@ResponseBody
	public String nickNameDuplicateChk(Member m) {
		
		System.out.println("닉네임 중복 확인 : " + m.getMemberNickName());
		
		int result = mService.nickNameDuplicateChk(m);
		
		if(result == 0) {
			System.out.println("닉네임 중복 확인 : " + m.getMemberNickName() + "( 사용가능 )");
			return "success";
		} else {
			System.out.println("닉네임 중복 확인 : " + m.getMemberNickName() + "( 사용 중 )");
			return "fail";
		}
		
	}

	@RequestMapping("phoneDuplicateChk.do")
	@ResponseBody
	public String phoneDuplicateChk(Member m) {
	
		System.out.println("전화번호 중복 확인 : " + m.getMemberPhone());
	
		int result = mService.phoneDuplicateChk(m);
	
		if(result == 0) {
			System.out.println("전화번호 중복 확인 : " + m.getMemberPhone() + "( 사용가능 )");
			return "success";
		} else {
			System.out.println("전화번호 중복 확인 : " + m.getMemberPhone() + "( 사용 중 )");
			return "fail";
		}

	}

}
