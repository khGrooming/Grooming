package com.kh.groomingProject.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
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
import com.kh.groomingProject.grooming.model.exception.GroomingException;
import com.kh.groomingProject.member.model.exception.MemberException;
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

		// if문안에 if로 처리 해야함(트리거 이용하면 신규가입 추가 insert는 전부 가능)
		if(resultInsertMember > 0) {
			System.out.println("회원가입 (insert): 성공");

			// 회원가입 (신규 가입 알림 추가 insert)
			message = "신규가입을 환영합니다.";
			MemberAlert memberAlert = new MemberAlert(message, m.getMemberEmail());
			System.out.println("회원가입 (신규 가입 알림 추가) : " + memberAlert);
			int resultAlertJoin = alertService.insertAlert(memberAlert);

			if(resultAlertJoin > 0) {
				System.out.println("회원가입 (신규 가입 알림 추가): 성공");

				// 회원가입 (신규포인트 지급 insert)
				int resultWelcomePoint = mService.welcomePoint(m.getMemberEmail());

				if(resultWelcomePoint > 0) {
					System.out.println("회원가입 (신규포인트 지급): 성공");

					// 회원가입 (신규 가입 감사 포인트 알림 추가 insert)
					memberAlert.setAlertContent("신규가입 감사 포인트가 지급 되었습니다.");
					System.out.println("회원가입 (신규포인트 지급) : " + memberAlert);
					int resultAlertPoint = alertService.insertAlert(memberAlert);

					if(resultAlertPoint > 0) {
						System.out.println("회원가입 확인 : 성공");
						return "success";

					} else {
						System.out.println("회원가입 (신규 가입 감사 포인트 알림 추가): 실패");
						return "fail";
					}

				} else {
					System.out.println("회원가입 (신규 가입 감사 포인트 지금): 실패");
					return "fail";
				}

			} else {
				System.out.println("회원가입 (신규 가입 감사 포인트 지금): 실패");
				return "fail";
			}

		} else {
			System.out.println("회원가입 (insert): 실패");
			return "fail";
		}

	}

	@RequestMapping("memberInsertkakao.do")
	@ResponseBody
	public String memberKakaoInsert(Member m) {
		String message = "";
		System.out.println("회원가입Kakao (프론트정보): " + m);

		// 회원가입 (insert)
		int resultInsertMember = mService.insertMemberKakao(m);

		// if문안에 if로 처리 해야함(트리거 이용하면 신규가입 추가 insert는 전부 가능)
		if(resultInsertMember > 0) {
			System.out.println("회원가입Kakao (insert): 성공");

			// 회원가입 (신규 가입 알림 추가 insert)
			message = "신규가입을 환영합니다.(카카오)";
			MemberAlert memberAlert = new MemberAlert(message, m.getMemberEmail());
			System.out.println("회원가입Kakao (신규 가입 알림 추가) : " + memberAlert);
			int resultAlertJoin = alertService.insertAlert(memberAlert);

			if(resultAlertJoin > 0) {
				System.out.println("회원가입Kakao (신규 가입 알림 추가): 성공");

				// 회원가입 (신규포인트 지급 insert)
				int resultWelcomePoint = mService.welcomePoint(m.getMemberEmail());

				if(resultWelcomePoint > 0) {
					System.out.println("회원가입Kakao (신규포인트 지급): 성공");

					// 회원가입 (신규 가입 감사 포인트 알림 추가 insert)
					memberAlert.setAlertContent("신규가입 감사 포인트가 지급 되었습니다.");
					System.out.println("회원가입Kakao (신규포인트 지급) : " + memberAlert);
					int resultAlertPoint = alertService.insertAlert(memberAlert);

					if(resultAlertPoint > 0) {
						System.out.println("회원가입Kakao 확인 : 성공");
						return "success";

					} else {
						System.out.println("회원가입Kakao (신규 가입 감사 포인트 알림 추가): 실패");
						return "fail";
					}

				} else {
					System.out.println("회원가입Kakao (신규 가입 감사 포인트 지금): 실패");
					return "fail";
				}

			} else {
				System.out.println("회원가입Kakao (신규 가입 감사 포인트 지금): 실패");
				return "fail";
			}

		} else {
			System.out.println("회원가입Kakao (insert): 실패");
			return "fail";
		}

	}

	// 프로필 파일 저장
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

	// 프로필 사진 파일 삭제
	private void deleteFile(String fileName, HttpServletRequest request) {
		String root=request.getSession().getServletContext().getRealPath("resources");
		String savePath = root+"\\upprofileFiles";

		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}

	}

	@RequestMapping("memberOptionUpdate.do")
	public String memberOptionUpdate(HttpServletRequest request, Member m
			,@RequestParam(value="memberTagName", required=false) String memberTagName
			,@RequestParam(value="profileFile", required=false) MultipartFile file) {
		System.out.println("회원가입 추가 // 멤버 이메일  : " + m.getMemberEmail()
						+ " 멤버 이름 : " + m.getMemberName()
						+ " 멤버 전화 : " + m.getMemberPhone()
						+ " 멤버 성별 : " + m.getMemberGender()
						+ " 멤버 사진 : " + m.getMemberPhoto()
						+ " 멤버 메모 : " + m.getMemberMemo());
		System.out.println("멤버 Tags : " + memberTagName);
		
		System.out.println((m.getMemberEmail()).length() != 0);
		System.out.println((m.getMemberName()).length() != 0);
		System.out.println((m.getMemberPhone()).length() != 0);
		System.out.println(m.getMemberGender() != null);
		System.out.println(!file.getOriginalFilename().equals(""));
		System.out.println((m.getMemberMemo()).length() != 0);
		
		if((m.getMemberEmail()).length() != 0) {
			
			// 프로필 사진 리네임을 위해 멤버 번호를 DB에서 가져온다
			Member member = mService.loginMember(m);
			System.out.println("회원가입(추가입력) 하려는 회원 : " + member);
	
			m.setMemberNo(member.getMemberNo());
	
			// 파일 저장 및 리네임
			if(!file.getOriginalFilename().equals("")) {
				String renameFileName = saveFile(member.getMemberNo(), file, request);
	
				m.setMemberPhoto(renameFileName);
			} else {
				m.setMemberPhoto("MEMBER_SAMPLE_IMG.JPG");
			}
	
			System.out.println("member update data : " + m);

			// 회원가입(추가 update)
			int resultUpdateMemberOption = mService.updateMemberOption(m);

			if(resultUpdateMemberOption > 0) {
				System.out.println("회원가입 추가정보 업데이트 : 성공");
	
			} else {
				System.out.println("회원가입 추가정보 업데이트 : 실패");
				throw new MemberException("회원가입 추가정보 업데이트 : 실패");
			}

		} else {
			System.out.println("회원 추가입력(사진,이름,성별,한줄) : skip");
		}
		
		// 태그 테이블 업데이트
		int resultMergeTags = 0;
		
		if(memberTagName.length() != 0 && !memberTagName.isEmpty()) {
			String[] tag = memberTagName.split(",");

			for(int i = 0 ; i < tag.length; i++) {
				String tagTemp = tag[i];
				resultMergeTags = tagService.mergeTags(tagTemp);
			}
			if(resultMergeTags > 0) {
				System.out.println("TAG 업데이트 : 성공");

				// 멤버태그 테이블 추가
				int resultMemberTag = 0;

				for(int i = 0 ; i < tag.length; i++) {
					String tagTemp = tag[i];
					MemberTag memberTag = new MemberTag(m.getMemberNo(), tagTemp);
					resultMemberTag = mService.mergeMemberTags(memberTag);
				}

				if(resultMemberTag > 0) {
					System.out.println("MemberTag 업데이트 : 성공");

					return "home";

				} else {
					System.out.println("MemberTag 업데이트 : 실패");
					throw new MemberException("MemberTag 업데이트 : 실패");
				}

			} else {
				System.out.println("TAG 업데이트 : 실패");
				throw new MemberException("TAG 업데이트 : 실패");
			}

		}
		
		return "home";

	}

	@RequestMapping("memberLogin.do")
	@ResponseBody
	public String memberLogin(Member m, Model model, String idSaveCheck) {
		
		System.out.println("로그인 (아이디/비번/저장) : " + m.getMemberEmail() + " / " + m.getMemberPwd() + " / " + idSaveCheck);
		
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

	@RequestMapping("kakaoLogin.do")
	@ResponseBody
	public String kakaoLogin(Member m, Model model) {
		
		System.out.println("kakao로그인 (아이디/닉네임) : " + m.getMemberEmail() + " / " + m.getMemberNickName());
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null) {
			System.out.println("kakao로그인 확인 : 성공");
			model.addAttribute("loginUser", loginUser);
			return "success";
		} else {
			System.out.println("kakao로그인 확인 : 신규가입");
			model.addAttribute("loginUser", m);
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
