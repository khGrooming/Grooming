 package com.kh.groomingProject.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.groomingProject.alert.model.service.AlertService;
import com.kh.groomingProject.member.model.exception.MemberException;
import com.kh.groomingProject.member.model.service.MemberService;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.member.model.vo.MemberAlert;
import com.kh.groomingProject.member.model.vo.MemberCertiCode;
import com.kh.groomingProject.member.model.vo.MemberSanctions;
import com.kh.groomingProject.member.model.vo.MemberTag;
import com.kh.groomingProject.tag.model.service.TagService;

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
	private JavaMailSenderImpl mailSender;

	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 로그인 페이지 이동
	@RequestMapping("loginPage.do")
	public ModelAndView loginPage(ModelAndView mv, String url) {

		mv.addObject("url", url)
		.addObject("loginCheck", "login")
		.setViewName("member/memberLoginRegistration");

		return mv;
	}

	// 회원가입 페이지 이동
	@RequestMapping("registerPage.do")
	public ModelAndView registerPage(ModelAndView mv, String url) {

		mv.addObject("url", url)
		.addObject("loginCheck", "register")
		.setViewName("member/memberLoginRegistration");

		return mv;
	}

	// 회원정보 찾기 페이지 이동
	@RequestMapping("findAccount.do")
	public ModelAndView findAccount(ModelAndView mv) {

		mv.setViewName("member/memberFindMyAccount");

		return mv;
	}

	// 회원정보 변경 페이지 이동
	@RequestMapping("changePwdPage.do")
	public ModelAndView changePwd(ModelAndView mv, Member m) {

		mv.addObject("memberEmail", m.getMemberEmail())
		.setViewName("member/memberChangePwd");

		return mv;
	}

	// 회원 가입 : 일반 회원
	@RequestMapping("memberInsert.do")
	@ResponseBody
	public String memberInsert(Model model, Member m) {
		String message = "";
		System.out.println("회원가입 (프론트정보): " + m);

		String emcPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());

		m.setMemberPwd(emcPwd);

		// 회원가입 (insert)
		int resultInsertMember = mService.insertMember(m);

		// 회원가입 확인
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
						
						Member loginUser = mService.loginMember(m);
						System.out.println("kakao로그인 (아이디/닉네임) : " + m.getMemberEmail() + " / " + m.getMemberNickName());

						model.addAttribute("loginUser", loginUser);

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

	// 회원 가입 : 카카오 회원
	@RequestMapping("memberInsertkakao.do")
	@ResponseBody
	public String memberKakaoInsert(Member m, Model model) {
		String message = "";
		System.out.println("회원가입Kakao (프론트정보): " + m);

		// 회원가입 (insert)
		int resultInsertMember = mService.insertMemberKakao(m);

		// 회원가입 확인
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

						Member loginUser = mService.loginMember(m);
						System.out.println("kakao로그인 (아이디/닉네임) : " + m.getMemberEmail() + " / " + m.getMemberNickName());

						model.addAttribute("loginUser", loginUser);

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

	// 회원 가입 : 추가 사항 업데이트
	@RequestMapping("memberOptionUpdate.do")
	public String memberOptionUpdate(HttpServletRequest request, Member m
			,@RequestParam(value="memberTagName", required=false) String memberTagName
			,@RequestParam(value="profileFile", required=false) MultipartFile file) {
		System.out.println("회원가입 추가 ( 멤버 이메일  : " + m.getMemberEmail()
						+ " 멤버 이름 : " + m.getMemberName()
						+ " 멤버 전화 : " + m.getMemberPhone()
						+ " 멤버 성별 : " + m.getMemberGender()
						+ " 멤버 사진 : " + m.getMemberPhoto()
						+ " 멤버 메모 : " + m.getMemberMemo() + " )");
		System.out.println("멤버 Tags : " + memberTagName);
		
		System.out.println("값 유무 확인 (이멜) : " + ((m.getMemberEmail()).length() != 0));
		System.out.println("값 유무 확인 (이름) : " +((m.getMemberName()).length() != 0));
		System.out.println("값 유무 확인 (전화) : " + ((m.getMemberPhone()).length() != 0));
		System.out.println("값 유무 확인 (성별) : " + (m.getMemberGender() != null));
		System.out.println("값 유무 확인 (사진) : " + (!file.getOriginalFilename().equals("")));
		System.out.println("값 유무 확인 (메모) : " + ((m.getMemberMemo()).length() != 0));

		Member member = mService.loginMember(m);
		m.setMemberNo(member.getMemberNo());

		if((m.getMemberEmail()).length() != 0 && ((m.getMemberName()).length() != 0 || (m.getMemberPhone()).length() != 0 || m.getMemberGender() != null || !file.getOriginalFilename().equals("") || (m.getMemberMemo()).length() != 0)) {

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

			for(String i : tag) {
				resultMergeTags = tagService.mergeTags(i);
			}

			if(resultMergeTags > 0) {
				System.out.println("TAG 업데이트 : 성공");

				// 멤버태그 테이블 추가
				int resultMemberTag = 0;

				for(String i : tag) {
					MemberTag memberTag = new MemberTag(m.getMemberNo(), m.getMemberEmail(), i);
					System.out.println(memberTag);
					int result = mService.mergeMemberTags(memberTag);
					resultMemberTag += result;
				}

				System.out.println("MemberTag 횟수 : " + tag.length + " / 결과 "+ resultMemberTag );

				if(resultMemberTag == tag.length) {
					System.out.println("MemberTag 업데이트 : 성공");

					return "redirect:home.do";

				} else {
					System.out.println("MemberTag 업데이트 : 실패");
					throw new MemberException("MemberTag 업데이트 : 실패");
				}

			} else {
				System.out.println("TAG 업데이트 : 실패");
				throw new MemberException("TAG 업데이트 : 실패");
			}

		}

		return "redirect:home.do";

	}

	// 회원 로그인
	@RequestMapping("memberLogin.do")
	public void memberLogin(HttpServletResponse response, Model model, Member m, String idSaveCheck) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH시mm분ss초").create();
		
		System.out.println("로그인 (아이디/비번/저장) : " + m.getMemberEmail() + " / " + m.getMemberPwd() + " / " + idSaveCheck);

		String memberEmail = m.getMemberEmail();
		
		MemberSanctions ms = mService.chkMemberSanction(memberEmail);
		
		System.out.println("로그인 유저 재제 확인 : " + ms);
		
		if(ms == null) {
			Member loginUser = mService.loginMember(m);
			System.out.println("회원 확인 : " + loginUser);
			
			if(loginUser != null) {
				if(bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
					System.out.println("로그인 확인 : 성공");
					ms.setLoginSatatus("success");
					model.addAttribute("loginUser", loginUser);
				}
			}
			System.out.println("로그인 확인 : 실패");
			ms.setLoginSatatus("fail");
		} else {
			System.out.println("로그인 확인 : 재제 중");
			ms.setLoginSatatus("sanctions");
		}
		gson.toJson(ms, response.getWriter());
		
	}

	// 카카오 회원 로그인
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

	// 회원 로그아웃
	@RequestMapping("logout.do")
	public String logout(SessionStatus status){
		status.setComplete();

		return "redirect:home.do";

	}

	// 회원 가입 : 이메일 중복 확인
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

	// 회원 가입 : 닉네임 중복 확인
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

	// 회원 가입 : 전화번호 중복 확인
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

	// 회원정보 찾기 : 이메일
	@RequestMapping("findEmail.do")
	@ResponseBody
	public String findEmail(Member m) {
		String memberEmail = "";
		System.out.println("닉네임 확인 : " + m.getMemberNickName());

		Member member = mService.findEmail(m);

		if(member != null) {
			String emailTemp = member.getMemberEmail();

			int index = emailTemp.indexOf("@");

			String id = emailTemp.substring(0, index);
			String at = emailTemp.substring(index, emailTemp.length());

			int idLength = id.length();
			int atLength = at.length();

			int cutIndex = 2;

			// 자를 id 길이 계산
			if(idLength < 2) {
				cutIndex = idLength/2;
			}

			// 보여줄 아이디 빼고 자르기
			String idTemp = id.substring(0, cutIndex);

			// 자른 만큼 *을 뒤에 붙이기
			for(int i = cutIndex; i < idLength; i++) {
				idTemp += "*";
			}

			// at을 위해 초기화
			cutIndex = 3;

			// 자를 at 길이 계산
			if(atLength < 3) {
				cutIndex = atLength/2;
			}

			// 보여줄 at 빼고 자르기
			String atTemp = at.substring(0, cutIndex);

			// 자른 만큼 *을 뒤에 붙이기
			for(int i = cutIndex; i < atLength; i++) {
				atTemp += "*";
			}

			memberEmail = (idTemp + atTemp);
		}

		return memberEmail;

	}

	// 회원정보 찾기 : 인증번호 저장 & 전송
	@RequestMapping("sendCertiEmail.do")
	@ResponseBody
	public String sendCertiMail(Member m) {
		System.out.println("메일 전송 : " + m.getMemberEmail());

		// 회원인지 확인
		int result = mService.findMemberEmail(m);

		if(result == 0) {
			System.out.println("회원 정보 찾기 : 정보 없음");
			return "fail";
		}

		// 인증 숫자 생성 (앞은 0으로 6자리 채우기)
		int randomTemp = (int)(Math.random()*1000000);
		String randomCode = String.format("%06d", randomTemp);
		System.out.println("인증코드 : " + randomCode);

		MemberCertiCode mcc = new MemberCertiCode();

		mcc.setCertiNumber(randomCode);
		mcc.setMemberEmail(m.getMemberEmail());

		result = mService.insertRandomCode(mcc);
		if(result == 0) {
			System.out.println("회원 정보 찾기 : 인증코드 저장 실패");
			return "retry";
		}

		String mailFrom = "onebunonecho@gmail.com";
		String mailTo = m.getMemberEmail();
		String mailTitle = "회원정보 찾기 인증 코드 입니다.";
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
				"<td style=\"vertical-align:bottom;font-size:14px;color:#696969;line-height:13px;font-family:NanumGothic\">회원정보</td></tr>\r\n" + 
				"</tbody>\r\n" + 
				"</table>\r\n" + 
				"</td>\r\n" + 
				"</tr>\r\n" + 
				"<tr><td height=\"13\"></td></tr>\r\n" + 
				"<tr><td style=\"padding-right:27px;padding-left:18px;line-height:34px;font-size:29px;color:#424240;font-family:NanumGothic\">요청하신 인증번호를<br><span style=\"color:#1ec800\">발송해드립니다.</span></td></tr>\r\n" + 
				"<tr><td height=\"22\"></td></tr>\r\n" + 
				"<tr><td height=\"1\" style=\"background-color:#e5e5e5\"></td></tr><tr>\r\n" + 
				"<td style=\"padding-top:24px;padding-right:27px;padding-bottom:32px;padding-left:20px\">\r\n" + 
				"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"left\" width=\"100%\">\r\n" + 
				"<tbody>\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"font-size:14px;color:#696969;line-height:24px;font-family:NanumGothic\">\r\n" + 
				"<strong>아래의 인증번호를 인증번호 입력창에 입력해 주세요.</strong> </td>\r\n" + 
				"</tr>\r\n" + 
				"<tr><td height=\"24\"></td></tr>\r\n" + 
				"<tr><td style=\"font-size:14px;color:#696969;line-height:24px;font-family:NanumGothic\"><strong>인증번호 : <span style=\"color:#009e25\">" + randomCode + "</span></strong></td></tr>\r\n" + 
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

	// 회원정보 찾기 : 인증번호 확인
	@RequestMapping("certiChk.do")
	@ResponseBody
	public String certiChk(MemberCertiCode mcc) {
		System.out.println("메일 : " + mcc.getMemberEmail() + " / 인증코드 : " + mcc.getCertiNumber());

		int result = mService.certiChk(mcc);
		if(result > 0) {
			System.out.println("회원 정보 찾기 : 인증번호 일치");
			return "success";
		}
		System.out.println("회원 정보 찾기 : 인증번호 불일치");
		return "fail";

	}

	// 회원 가입 : 일반 회원
	@RequestMapping("newPwd.do")
	public String newPwd(Member m) {
		String message = "";
		System.out.println("비밀번호 재설정 : " + m.getMemberEmail() + " / 재설정 비밀번호 : " + m.getMemberPwd());

		String emcPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());

		m.setMemberPwd(emcPwd);

		// 비밀번호 재설정
		int resultUpdateMemberPwd = mService.updateMemberPwd(m);

		// 비밀번호 재설정
		if(resultUpdateMemberPwd > 0) {
			System.out.println("비밀번호 재설정: 성공");

			// 비밀번호 재설정 (알림 추가 insert)
			message = "비밀번호가 변경 되었습니다..";
			MemberAlert memberAlert = new MemberAlert(message, m.getMemberEmail());
			System.out.println("비밀번호 재설정 (알림 추가) : " + memberAlert);
			int resultAlertJoin = alertService.insertAlert(memberAlert);

			if(resultAlertJoin > 0) {
				System.out.println("비밀번호 재설정 (알림 추가) : 성공");

				return "redirect:home.do";
			} else {
				System.out.println("비밀번호 재설정 (알림 추가) : 실패");
				throw new MemberException("비밀번호 재설정 (알림 추가) : 실패");
			}

		} else {
			System.out.println("비밀번호 재설정 : 실패");
			throw new MemberException("비밀번호 재설정 : 실패");
		}

	}

	// 회원 로그인
	@RequestMapping("refreshLoginUser.do")
	@ResponseBody
	public String memberLogin(Member m, Model model) {
		
		System.out.println("로그인 한 회원 (이메일) : " + m.getMemberEmail());
		
		Member loginUser = mService.loginMember(m);
		System.out.println("로그인 회원 새로고침 확인 : " + loginUser);
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "success";
		}
		return "fail";
	}

}
