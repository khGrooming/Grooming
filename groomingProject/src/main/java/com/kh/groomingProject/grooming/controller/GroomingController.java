package com.kh.groomingProject.grooming.controller;

import static com.kh.groomingProject.common.GroomingPagination.getPageInfoG;
import static com.kh.groomingProject.common.GroomingPagination.getPageInfoM;
import static com.kh.groomingProject.common.GroupPagination.getPageInfo;
import static com.kh.groomingProject.common.HomePagination.getPageInfo;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.groomingProject.declaration.model.service.DeclarationService;
import com.kh.groomingProject.declaration.model.vo.Declaration;
import com.kh.groomingProject.grooming.model.exception.GroomingException;
import com.kh.groomingProject.grooming.model.service.GroomingService;
import com.kh.groomingProject.grooming.model.vo.GCheck;
import com.kh.groomingProject.grooming.model.vo.GReply;
import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.grooming.model.vo.GroomingAppList;
import com.kh.groomingProject.grooming.model.vo.GroomingApplicant;
import com.kh.groomingProject.grooming.model.vo.GroomingHeart;
import com.kh.groomingProject.grooming.model.vo.GroomingPageInfo;
import com.kh.groomingProject.grooming.model.vo.GroomingSearch;
import com.kh.groomingProject.grooming.model.vo.GroomingSpec;
import com.kh.groomingProject.grooming.model.vo.GroomingTag;
import com.kh.groomingProject.grooming.model.vo.GroupBoard;
import com.kh.groomingProject.grooming.model.vo.GroupMember;
import com.kh.groomingProject.grooming.model.vo.GroupPageInfo;
import com.kh.groomingProject.grooming.model.vo.Mentor;
import com.kh.groomingProject.home.model.service.HomeService;
import com.kh.groomingProject.home.model.vo.HomeGrooming;
import com.kh.groomingProject.home.model.vo.HomePageInfo;
import com.kh.groomingProject.member.model.service.MemberService;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.mypage.model.service.MypageService;
import com.kh.groomingProject.mypage.model.vo.MyPagePoint;
import com.kh.groomingProject.tag.model.service.TagService;
import com.kh.groomingProject.tag.model.vo.Tag;

@Controller
public class GroomingController {

	@Autowired
	private GroomingService gService;

	@Autowired
	private TagService tagService;

	@Autowired
	private DeclarationService declarationService;	

	@Autowired
	private MemberService mService;

	@Autowired
	private MypageService mpService;
	
	@Autowired
	private HomeService homeService;
	
//	메인으로 가기
	@RequestMapping("groomingMain.do")
	public ModelAndView groomingList(ModelAndView mv, String memberNo,@RequestParam(value="page", required=false) Integer page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
	
		
		ArrayList<HomeGrooming> gAList = getAllGroomingList(currentPage);
		System.out.println("나 gAList야 :" +gAList);
		mv.addObject("gAList",gAList).setViewName("grooming/groomingMain");
		return mv;
	}

private ArrayList<HomeGrooming> getAllGroomingList(int currentPage) {
	
	
	
	int listCount = homeService.getGListCount();

	System.out.println("전체 그루밍 : " + listCount);
	
	int boardLimit = 8;

	HomePageInfo pi = getPageInfo(currentPage, listCount, boardLimit);

	ArrayList<HomeGrooming> gAList = homeService.getGroomingList(pi);

	return gAList;
	
	
	}

	// 멘토 필터 적용
	@RequestMapping("GroomingList.do")
	public void GroomingList(HttpServletResponse response,@RequestParam(value="page", required=false) Integer page) throws JsonIOException, IOException  {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = gService.getGroomingListCount();
		int boardLimit = 8;
		GroomingPageInfo pi = getPageInfoG(currentPage, listCount,boardLimit);
		
		ArrayList<Grooming> glist = gService.selectList(pi);
		new Gson().toJson(glist, response.getWriter());
	}
// 멘토 필터 적용
	@RequestMapping("groomingMe.do")
	public void groomingMentorList(HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		ArrayList<Grooming> glist = gService.selectMentorList();

		System.out.println("그루밍 멘토 : " + glist);
		
//		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
//		gson.toJson(glist, response.getWriter());
		new Gson().toJson(glist, response.getWriter());
	}

// 예치금 필터 적용
	@RequestMapping("groomingMo.do")
	public void groomingMoneyList(HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		ArrayList<Grooming> glist = gService.selectMoneyList();
		
		System.out.println("그루밍 멘토 : " + glist);
		
//		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
//		gson.toJson(glist, response.getWriter());
		new Gson().toJson(glist, response.getWriter());
	}

	// 검색
	@RequestMapping("search.do")
	public void gSearchWriter(HttpServletResponse response, GroomingSearch gs)
			throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

//		ArrayList<Grooming> glist = new ArrayList<>();
//		if (search.equals("title")) {
//			ArrayList<Grooming> list = gService.gSearchTitle(keyword);
//			glist = list;
//		} else if (search.equals("writer")) {
//			ArrayList<Grooming> list = gService.gSearchWriter(keyword);
//			glist = list;
//		} else {
//			ArrayList<Grooming> list = gService.gSearchContent(keyword);
//			glist = list;
//		}
		
		ArrayList<Grooming> glist = gService.groomingSearch(gs);

		System.out.println("검색 내용 " + glist);
		
//		System.out.println("gSearchWriter // search : " + search);
//		System.out.println("gSearchWriter // keyword : " + keyword);
//		System.out.println("gSearchWriter // glist : " + glist);
//		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
//		gson.toJson(glist, response.getWriter());
		new Gson().toJson(glist, response.getWriter());
	}

	// 그루밍 글쓰기 페이지 이동
	@RequestMapping("groomingInsert.do")
	public ModelAndView groomingInsert(ModelAndView mv, String memberNo) {
		
		Mentor m = gService.selectMentor(memberNo);
		
		mv.addObject("m",m).setViewName("grooming/groomingInsertForm");
		
		return mv;
	}

	// 그루밍 글쓰기
	@RequestMapping("groomingInsertForm.do")
	public String groomingInsertForm(HttpServletRequest request, String memberNo, Grooming g, String tagName,
			@RequestParam(value = "uploadFile", required = true) MultipartFile file) {
//		 Map<Object, String> map = new HashMap<> ();
//		 map.put(g, "g");
//		g.setMemberNo(memberNo);
		if (!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);

			if (renameFileName != null) { // 파일이 잘 저장되어 경로가 반환 된다면..
				g.setGroomingImg(renameFileName);
			}

		}

		// 그루밍 테이블에 값을 넣음
		int result = gService.insertGrooming(g);
		int result1 = 0;
		// 그루밍 테이블 번호를 가져옴
		String groomingNo = gService.getGroomingNo(memberNo);
		if (tagName.length() != 0) {
			String[] tag = tagName.split(",");
			String[] tagNo = new String[tag.length];

			for (int i = 0; i < tag.length; i++) {
				// TAG 테이블에 값넣기
				String tagTemp = tag[i];
				result = tagService.mergeTags(tagTemp);
				// GTAG 테이블에 값넣기
				tagNo[i] = gService.findTagNo(tagTemp);
				String GtagNo = tagNo[i];

				Map map = new HashMap();
				map.put("GtagNo", GtagNo);
				map.put("groomingNo", groomingNo);

				// db 갔다 오기
				result1 = gService.insertGtag(map);

			}
		}
		Map map1 = new HashMap();
		map1.put("memberNo", memberNo);
		map1.put("groomingNo", groomingNo);
		int result2 = gService.GroupHostIn(map1);

		if (result > 0 && result1 > 0 && result2 > 0) {
			return "redirect:groomingMain.do";
		} else {
			throw new GroomingException("게시글 등록 실패!");
		}
	}

	// 파일이 저장 될 경로를 설정하는 메소드
	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\upGroomingFiles";

		File folder = new File(savePath);

		if (!folder.exists()) { // webapp아래에 있는 resources 폴더 아래에
								// nuploadFiles가 없어서 File객체를 찾을 수 없다면
			folder.mkdirs();

		}

		// 공지글은 파일명 중복 제거는 신경쓰지 않고 했지만
		// 게시판에서는 파일명을 날짜(업로드 시간)로 rename 해보자

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String filePath = folder + "\\" + renameFileName;
		// 실제 저장 될 파일의 경로 + rename 파일명

		try {
			file.transferTo(new File(filePath));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return renameFileName;
	}

	// 그루밍 상세보기
	@RequestMapping("groomingDetail.do")
	public ModelAndView groomingDetailView(ModelAndView mv, String groomingNo, String memberNo
			, @RequestParam(value = "page", required = false) Integer page) {

		int result = gService.addReadCount(groomingNo);
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		System.out.println(result);
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
				GroomingHeart heart = gService.selectHeartMember(info);
				Declaration declaration = declarationService.selectGroomingDeclare(info);
				GroomingApplicant memberNoList = gService.selectAppMemberNo(info);
				
				if (grooming != null && tag != null && spec != null && member != null) {
					mv.addObject("grooming", grooming).addObject("tag", tag).addObject("spec", spec)
					.addObject("member", member).addObject("appList", appList)
					.addObject("memberNoList", memberNoList).addObject("heart", heart).addObject("currentPage" , currentPage)
					.setViewName("grooming/groomingDetailView");
				} else {
					throw new GroomingException("조회실패!");
				}
				
			

		} else {
			throw new GroomingException("게시글 조회수 증가 실패!");
		}

		return mv;
	}


	
	// 그루밍 신청자 list ajax
	@RequestMapping("gacceptList.do")
	@ResponseBody
	public void groomingAppAccept(HttpServletResponse response, String groomingNo) throws JsonIOException, IOException {

		response.setContentType("application/json; charset=utf-8");
		ArrayList<GroomingAppList> appList = gService.selectAppContent(groomingNo);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(appList, response.getWriter());

	}

	// 그루밍 신청자 수락 ajax
	@RequestMapping("gaccept.do")
	@ResponseBody
	public String groomingAccept(String applyNo, String groomingNo,String money,String groomingType) {
		System.out.println(applyNo);
		int result = gService.selectApplyOne(applyNo);
		int result1 = gService.addGroomingP(groomingNo);

		String memberNo = gService.findAppMemberNo(applyNo);
	
		
		Map map = new HashMap();
		map.put("memberNo", memberNo);
		map.put("groomingNo", groomingNo);

		int result2 = gService.addGroomingMember(map);
	

		int tmoney = Integer.parseInt(money)*(-1);



		Map map1 = new HashMap();
		map1.put("memberNo", memberNo);
		map1.put("money", tmoney);

		System.out.println("나 map1 : " +map1);
		
		int result3 = gService.addPointMember(map1);
		
		String mNo = gService.selectMemberNo(groomingNo);
		
		tmoney = tmoney * (-1);
		Map map2 = new HashMap();
		map2.put("memberNo", mNo);
		map2.put("money", tmoney);
		
		int result4 = 0;
		System.out.println("groomingType : " + groomingType);
		System.out.println("tmoney :" + tmoney);
		if(groomingType.equals("멘토")) {
			 result4 = gService.addMentorPoint(map2);
		}
		System.out.println("result4 : " + result4);
		if (result > 0 && result1 > 0 && result2 > 0 && result3 > 0 && result4 >= 0) {
			return "success";
		} else {
			return "false";
		}

	}
	// 그루밍 신청자 거절 ajax
	@RequestMapping("greject.do")
	@ResponseBody
	public String groomingReject(String applyNo) {
		System.out.println(applyNo);
		int result = gService.selectRejectApp(applyNo);
		if (result > 0) {
			return "success";
		} else {
			return "false";
		}

	}

	// 그루밍 글 수정 페이지 이동
	@RequestMapping("groomingUpdate.do")
	public ModelAndView groomingUpdateView(ModelAndView mv, String groomingNo,@RequestParam("page") Integer page, String memberNo) {
		ArrayList<Tag> tlist = tagService.selectGtagList(groomingNo);
//		System.out.println("나 tlist야" +tlist);
		Grooming grooming = gService.selectGrooming(groomingNo);
		String str = "";
		for (int i = 0; i < tlist.size(); i++) {
			str += tlist.get(i).getTagName();
			if ((i + 1) < tlist.size()) {
				str += ',';
			}
		}
		Mentor m = gService.selectMentor(memberNo);
		if (grooming != null && tlist != null) {
			mv.addObject("grooming", grooming).addObject("tlist", str).addObject("currentPage",page).addObject("m",m).setViewName("grooming/groomingUpdateForm");
		} else {
			throw new GroomingException("수정 게시글 불러오기 실패!");
		}

		return mv;
	}

	// 그루밍 글 수정
	@RequestMapping("gUpdate.do")
	public ModelAndView groomingUpdate(HttpServletRequest request,String money1, String tagName, ModelAndView mv, String groomingNo,String memberNo,
			Grooming g, @RequestParam(value = "uploadFile", required = false) MultipartFile file,@RequestParam("page") Integer page) {
		System.out.println("money1 : " + money1);
		if(money1.equals("x")) {
			g.setMoney("0");
		}
		String renameFileName = "";
		// 기존의 파일이 input hidden으로 와서 매개변수의 Board 객체에 담김
		// 그럼 그걸 가지고 기존의 파일을 삭제하자
		System.out.println(g.getGroomingImg());
		if (!file.getOriginalFilename().equals("")) { // 새로 올린 파일이 있는냐
			if (g.getGroomingImg() != null) { // 기존의 파일이 있느냐
				deleteFile(g.getGroomingImg(), request);
			}
			renameFileName = saveFile(file, request);

			// Grooming 객체에 새로 올린 파일명을 담고(원본 및 변경한 것 둘다) DB를 다녀오자(update)
			if (!renameFileName.equals("")) {

				g.setGroomingImg(renameFileName);
			}

		} else {
			g.setGroomingImg(gService.selectGimg(groomingNo));
		}

		g.setGroomingNo(groomingNo);
		System.out.println("수정controller" + g);

		int result = gService.updateGrooming(g);

		int result1 = 0;

		// 기존에 GTAG에 존재해있던 값을 지우자
		int result2 = gService.deleteGtag(groomingNo);

		if (tagName.length() != 0) {
			String[] tag = tagName.split(",");
			String[] tagNo = new String[tag.length];

			for (int i = 0; i < tag.length; i++) {
				// TAG 테이블에 값넣기
				String tagTemp = tag[i];
				result = tagService.mergeTags(tagTemp);
				// GTAG 테이블에 값넣기
				tagNo[i] = gService.findTagNo(tagTemp);
				String GtagNo = tagNo[i];

				Map map = new HashMap();
				map.put("GtagNo", GtagNo);
				map.put("groomingNo", groomingNo);

				// db 갔다 오기
				result1 = gService.insertGtag(map);

			}
		}

		System.out.println("나 수정 됬어요~" + result);
		Grooming grooming = gService.selectGrooming(groomingNo);
		
		
		
		ArrayList<GroomingTag> tag = gService.selectTag(groomingNo);
		ArrayList<GroomingSpec> spec = gService.selectSpec(groomingNo);
		Member member = gService.selectMember(groomingNo);
		ArrayList<Member> galist = gService.selectAppMember(groomingNo);
		
		ArrayList<GroomingAppList> appList = gService.selectAppContent(groomingNo);
		Map info = new HashMap();
		info.put("groomingNo", groomingNo);
		info.put("memberNo", memberNo);
		GroomingHeart heart = gService.selectHeartMember(info);
		Declaration declaration = declarationService.selectGroomingDeclare(info);
		GroomingApplicant memberNoList = gService.selectAppMemberNo(info);
		
		if (result > 0 && result1 > 0 && result2 > 0) {
			mv.addObject("currentpage",page).addObject("grooming", grooming).addObject("tag", tag).addObject("spec", spec)
			.addObject("member", member).addObject("appList", appList)
			.addObject("memberNoList", memberNoList).addObject("heart", heart)
			.setViewName("grooming/groomingDetailView");

		} else {
			throw new GroomingException("게시글 수정 실패!");
		}
		return mv;
	}

	// 기존에 파일 삭제
	private void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\upGroomingFiles";

		File f = new File(savePath + "\\" + fileName);
		if (f.exists()) {
			f.delete();
		}
	}

	// 그루밍 게시글 삭제
	@RequestMapping("groomingDelete.do")
	public String groomingDelete(String groomingNo) {

		int result = gService.groomingDelete(groomingNo);

		if (result > 0) {
			return "redirect:groomingMain.do";
		} else {
			throw new GroomingException("게시글 삭제 실패!");
		}
	}

	// 그루밍 게시글 마감 처리
	@RequestMapping("groomingLimit.do")
	@ResponseBody
	public String groomingLimit(String groomingNo) {

		int result = gService.statusUpdate(groomingNo);

		if (result > 0) {
			return "success";
		} else {
			return "false";
		}
	}

	// 그루밍 신청서 작성
	@RequestMapping("applyContent.do")
	public ModelAndView applyContent(ModelAndView mv, GroomingApplicant ga,String money,String groomingNo, String memberNo) {
		System.out.println("나 ga" + ga);
		int result = gService.applyContent(ga);
		
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
				GroomingHeart heart = gService.selectHeartMember(info);
				Declaration declaration = declarationService.selectGroomingDeclare(info);
				GroomingApplicant memberNoList = gService.selectAppMemberNo(info);
				
				if (grooming != null && tag != null && spec != null && member != null) {
					mv.addObject("grooming", grooming).addObject("tag", tag).addObject("spec", spec)
					.addObject("member", member).addObject("appList", appList)
					.addObject("memberNoList", memberNoList).addObject("heart", heart)
					.setViewName("grooming/groomingDetailView");
				} else {
					throw new GroomingException("조회실패!");
				}
				
			

		} else {
			throw new GroomingException("게시글 조회수 증가 실패!");
		}
		return mv;
	}

	// 그루밍 신고
	@RequestMapping("declare.do")
	public ModelAndView declareG(ModelAndView mv, Declaration d,String groomingNo, String memberNo) {

		int result = declarationService.declareG(d);

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

			GroomingApplicant memberNoList = gService.selectAppMemberNo(info);
			GroomingHeart heart = gService.selectHeartMember(info);
			
			mv.addObject("grooming", grooming).addObject("tag", tag).addObject("spec", spec)
			.addObject("member", member).addObject("appList", appList)
			.addObject("memberNoList", memberNoList).addObject("heart", heart)
			.setViewName("grooming/groomingDetailView");
		} else {
			throw new GroomingException("게시글 신고 실패!");
		}
		
		return mv;
	}

	// 그루밍 소그룹 게시판 신고
	@RequestMapping("declareG.do")
	public ModelAndView declareGroup(Declaration d, String memberNo, String gBoardNo,
			@RequestParam("currentPage") Integer page, ModelAndView mv, String groomingNo) {
		int currentPage = page;
		int result = declarationService.declareG(d);
		Member member = mService.selectGroupMemberNo(gBoardNo);
		Grooming grooming = gService.selectGrooming(groomingNo);
		Map map = new HashMap();
		map.put("memberNo", memberNo);
		map.put("gBoardNo", gBoardNo);

		Declaration declaration = declarationService.selectGroupDeclare(map);
		if (result > 0) {
			GroupBoard gboard = gService.selectGBoard(gBoardNo);
			if (gboard != null) {
				mv.addObject("gboard", gboard).addObject("currentPage", currentPage).addObject("grooming", grooming)
						.addObject("member", member).addObject("declaration", declaration)
						.setViewName("grooming/groupBoardDetailView");
			}
		} else {
			throw new GroomingException("게시글 신고 실패!");
		}

		return mv;
	}

//	찜하기

	@RequestMapping("addHeart.do")
	@ResponseBody
	public String addHeart(ModelAndView mv, String groomingNo, String memberNo) {

		Map info = new HashMap();
		info.put("groomingNo", groomingNo);
		info.put("memberNo", memberNo);

		int result = gService.addHeart(info);
		
		if(result >0) {
			return "success";
		}else {
			return "false";
		}
	}

	// 찜취소
	@RequestMapping("cancelHeart.do")
	@ResponseBody
	public String cancelHeart(String groomingNo, String memberNo) {

		Map info = new HashMap();
		info.put("groomingNo", groomingNo);
		info.put("memberNo", memberNo);

		int result = gService.cancelHeart(info);
		
		if(result >0) {
			return "success";
		}else {
			return "false";
		}
	}

	// 임시저장 페이지 
	@RequestMapping("save.do")
	public String groomingSaveForm(HttpServletRequest request, String memberNo, Grooming g, String tagName,
			@RequestParam(value = "uploadFile", required = false) MultipartFile file) {
//		 Map<Object, String> map = new HashMap<> ();
//		 map.put(g, "g");
//		g.setMemberNo(memberNo);
		System.out.println("나 save.do야");
		if (!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);

			if (renameFileName != null) { // 파일이 잘 저장되어 경로가 반환 된다면..
				g.setGroomingImg(renameFileName);
			}

		}

		// 그루밍 테이블에 값을 넣음
		int result = gService.insertSaveGrooming(g);
		int result1 = 0;

		// 그루밍 테이블 번호를 가져옴
		String groomingNo = gService.getGroomingNo(memberNo);

		if (tagName.length() != 0) {
			String[] tag = tagName.split(",");
			String[] tagNo = new String[tag.length];

			for (int i = 0; i < tag.length; i++) {
				// TAG 테이블에 값넣기
				String tagTemp = tag[i];
				result = tagService.mergeTags(tagTemp);
				// GTAG 테이블에 값넣기
				tagNo[i] = gService.findTagNo(tagTemp);
				String GtagNo = tagNo[i];

				Map map = new HashMap();
				map.put("GtagNo", GtagNo);
				map.put("groomingNo", groomingNo);

				// db 갔다 오기
				result1 = gService.insertGtag(map);

			}
		}

		if (result > 0) {
			return "redirect:groomingMain.do";
		} else {
			throw new GroomingException("게시글 임시저장 실패!");
		}
	}
	
	// 소그룹 페이지 이동
	@RequestMapping("groupPage.do")
	public ModelAndView groupPage(ModelAndView mv, String groomingNo) {

		Grooming grooming = gService.selectGrooming(groomingNo);
		ArrayList<Member> mlist = new ArrayList<>();
		mlist = mService.GroupMList(groomingNo);

		if (grooming != null && mlist != null) {
			mv.addObject("grooming", grooming).addObject("mlist", mlist).setViewName("grooming/groupPage");
		} else {
			throw new GroomingException("그룹페이지 조회실패!");
		}
		return mv;
	}

	// 소그룹 메인
	@RequestMapping("groupList.do")
	@ResponseBody
	public void groupList(HttpServletResponse response, String groomingNo) throws JsonIOException, IOException {

		response.setContentType("application/json; charset=utf-8");
		ArrayList<GroupMember> memberList = gService.selectMemberList(groomingNo);
		Member gMemberNo = gService.selectMember(groomingNo);
		for (int i = 0; i < memberList.size(); i++) {
			memberList.get(i).setgMemberNo(gMemberNo.getMemberNo());
			System.out.println(gMemberNo.getMemberNo());
		}

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(memberList, response.getWriter());

	}

	// 스터디원 추방
	@RequestMapping("kickOut.do")
	@ResponseBody
	public String kickOut(String memberNo) {

		int result = gService.deleteGmember(memberNo);

		if (result > 0) {
			return "success";
		} else {
			return "false";
		}
	}

	// 그룹게시판 불러오기
	@RequestMapping("gBlist.do")
	public ModelAndView gBoardList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			String groomingNo) {
		// 페이징 관련 처리부터 하자
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		System.out.println("나 현재 페이지야 : " + currentPage);

		int listCount = gService.getListCount(groomingNo);
		GroupPageInfo pi = getPageInfo(currentPage, listCount);
		/*
		 * Map map = new HashMap();
		 * 
		 * map.put("pi", pi); map.put("groomingNo",groomingNo);
		 */

		ArrayList<GroupBoard> glist = gService.selectGroupBoardList(pi, groomingNo);
		Grooming grooming = gService.selectGrooming(groomingNo);
		if (glist != null) {
			mv.addObject("grooming", grooming).addObject("glist", glist).addObject("pi", pi)
					.setViewName("grooming/groupBoard");

		} else {
			throw new GroomingException("그룹게시판 조회실패!");
		}
		return mv;
	}

	
	// 그룹 게시판 글작성페이지로 이동
	@RequestMapping("groupBoardInsertForm.do")
	public ModelAndView groupBoardInsertForm(@RequestParam("page") Integer page, String groomingNo, String memberNo,
			ModelAndView mv) {

		Grooming grooming = gService.selectGrooming(groomingNo);
		Map map = new HashMap();
		map.put("groomingNo", groomingNo);
		map.put("memberNo", memberNo);

		String gMemberNo = gService.selectGMemberNo(map);
		mv.addObject("grooming", grooming).addObject("gMemberNo", gMemberNo).addObject("page", page)
				.setViewName("grooming/groupBoardInsertForm");

		return mv;
	}
	
	// 그룹페이지 글쓰기
	@RequestMapping("groupInsert.do")
	public ModelAndView groupInsert(@RequestParam(value = "page", required = false) Integer page,
			HttpServletRequest request, ModelAndView mv, GroupBoard g, String gMemberNo, String groomingNo,
			@RequestParam(value = "uploadFile", required = false) MultipartFile file) {

		if (!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);

			if (renameFileName != null) { // 파일이 잘 저장되어 경로가 반환 된다면..
				g.setgBoardImg(renameFileName);
			}

		}

		int result = gService.insertBoard(g);

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		System.out.println("나 현재 페이지야 : " + currentPage);

		int listCount = gService.getListCount(groomingNo);
		GroupPageInfo pi = getPageInfo(currentPage, listCount);

		ArrayList<GroupBoard> glist = gService.selectGroupBoardList(pi, groomingNo);
		Grooming grooming = gService.selectGrooming(groomingNo);

		if (result > 0) {
			mv.addObject("grooming", grooming).addObject("glist", glist).addObject("pi", pi)
					.setViewName("grooming/groupBoard");
		} else {
			throw new GroomingException("게시글 등록 실패!");
		}

		return mv;

	}
	
	// 그룹게시판 상세보기
	@RequestMapping("groupDetail.do")
	public ModelAndView groupBoardDetailView(String memberNo, String gBoardNo, @RequestParam(value = "page", required = false) Integer page,
			ModelAndView mv, String groomingNo) {

		int currentPage = page;

		int result = gService.addBoardReadCount(gBoardNo);
		Member member = mService.selectGroupMemberNo(gBoardNo);
		Grooming grooming = gService.selectGrooming(groomingNo);
		Map map = new HashMap();
		map.put("memberNo", memberNo);
		map.put("gBoardNo", gBoardNo);

		Declaration declaration = declarationService.selectGroupDeclare(map);
		if (result > 0) {
			GroupBoard gboard = gService.selectGBoard(gBoardNo);
			if (gboard != null) {
				mv.addObject("gboard", gboard).addObject("currentPage", currentPage).addObject("grooming", grooming)
						.addObject("member", member).addObject("declaration", declaration)
						.setViewName("grooming/groupBoardDetailView");
			} else {
				throw new GroomingException("게시글 조회 실패!");
			}
		} else {
			throw new GroomingException("게시글 조회수 증가 실패!");
		}

		return mv;
	}

	// 그룹 게시글 삭제하기
	  @RequestMapping("groupDelete.do") public ModelAndView
	  groupDelete(ModelAndView mv,String groomingNo, String gBoardNo,@RequestParam(value = "page", required = false) Integer page) {
	 
	  int result = gService.groupDelete(gBoardNo); 
	  int currentPage = 1; 
	  if(page !=null) {
		 currentPage = page;
	  }
	  
	  int listCount = gService.getListCount(groomingNo); 
	  GroupPageInfo pi = getPageInfo(currentPage, listCount);
	  
	  ArrayList<GroupBoard> glist = gService.selectGroupBoardList(pi,groomingNo);
	  Grooming grooming = gService.selectGrooming(groomingNo); 
	  if (result > 0) {
	  mv.addObject("grooming",grooming)
	  .addObject("glist",glist)
	  .addObject("pi",pi)
	  .setViewName("grooming/groupBoard"); 
	  } else { 
		  throw new GroomingException("게시글 삭제 실패!"); 
	} 
	  return mv; }
	 
	  // 그룹 게시글 수정 페이지
	  @RequestMapping("groupBoardUpdate.do")
	  public ModelAndView groupBoardUpdate(ModelAndView mv,String groomingNo, String gBoardNo,
			  @RequestParam(value = "page", required = false) Integer page) {
		  
		  GroupBoard g = gService.selectGBoard(gBoardNo);
		  
		  Grooming grooming = gService.selectGrooming(groomingNo); 
		  mv.addObject("g",g).addObject("page",page).addObject("grooming",grooming).setViewName("grooming/groupBoardUpdateForm");
		  
		  return mv;
	  }
	 
	  // 게시글 수정
	  @RequestMapping("groupUpdate.do")
	  public ModelAndView groupUpdate(@RequestParam(value = "page", required = false) Integer page,String gBoardNo,String memberNo,
				HttpServletRequest request, ModelAndView mv, GroupBoard g, String groomingNo,
				@RequestParam(value = "uploadFile", required = false) MultipartFile file) {
		  
		  String renameFileName = "";
			// 기존의 파일이 input hidden으로 와서 매개변수의 Board 객체에 담김
			// 그럼 그걸 가지고 기존의 파일을 삭제하자
			System.out.println(g.getgBoardImg());
			if (!file.getOriginalFilename().equals("")) { // 새로 올린 파일이 있는냐
				if (g.getgBoardImg() != null) { // 기존의 파일이 있느냐
					deleteFile(g.getgBoardImg(), request);
					// deleteFile메소드는 NoticeController에 만들었으니 아래에 복붙해서
					// 폴더명만 수정하자
				}
				renameFileName = saveFile(file, request);

				// Grooming 객체에 새로 올린 파일명을 담고(원본 및 변경한 것 둘다) DB를 다녀오자(update)
				if (!renameFileName.equals("")) {

					g.setgBoardImg(renameFileName);
				}

			} else {
				g.setgBoardImg(gService.selectGboardimg(gBoardNo));
			}

	
			int result = gService.updateGroupBoard(g);

		
			int currentPage = page;

			Member member = mService.selectGroupMemberNo(gBoardNo);
			Grooming grooming = gService.selectGrooming(groomingNo);
			Map map = new HashMap();
			map.put("memberNo", memberNo);
			map.put("gBoardNo", gBoardNo);

			Declaration declaration = declarationService.selectGroupDeclare(map);
		
			System.out.println("나 수정 됬어요~" + result);
			if (result > 0) {
				GroupBoard gboard = gService.selectGBoard(gBoardNo);
				if (gboard != null) {
					mv.addObject("gboard", gboard).addObject("currentPage", currentPage).addObject("grooming", grooming)
							.addObject("member", member).addObject("declaration", declaration)
							.setViewName("grooming/groupBoardDetailView");
				} else {
					throw new GroomingException("게시글 조회 실패!");
				}

			} else {
				throw new GroomingException("게시글 수정 실패!");
			}
		  return mv;
	  }
	  
	  // 게시글 댓글
		@RequestMapping("groupReply.do")
		public void groupReply(HttpServletResponse response,String gBoardNo) throws JsonIOException, IOException {
			response.setContentType("application/json; charset=utf-8");

			ArrayList<GReply> rlist = gService.selectReplyList(gBoardNo);

			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(rlist, response.getWriter());
		}

		// 게시글 댓글 추가
		@RequestMapping("addGroupReply.do")
		@ResponseBody
		public String addReply(GReply g, String memberNo,String groomingNo) {
			Map map = new HashMap();
			map.put("memberNo", memberNo);
			map.put("groomingNo",groomingNo);
			
			String gMemberNo = gService.selectGMemberNo(map);
			System.out.println("나 gMemberNo야" +gMemberNo);
			g.setgMemberNo(gMemberNo);
			int result = gService.addReply(g);
			
			
			if(result > 0) {
				return "success";
			}else{
				return "false";
			}
			
		}
	  
		// 임시저장 글 가져오기
		@RequestMapping("groomingSaveInsert.do")
		public ModelAndView groomingSaveView(ModelAndView mv, String memberNo) {
			// 임시저장된 그루밍 글번호 가져오자!
			String groomingNo = gService.getGroomingNo(memberNo);
			
			ArrayList<Tag> tlist = tagService.selectGtagList(groomingNo);
//			System.out.println("나 tlist야" +tlist);
			Grooming grooming = gService.selectGrooming(groomingNo);
			Mentor m = gService.selectMentor(memberNo);
			// 해쉬태그값을 안적었을 수도 있다.
			String str = "";
			if(tlist != null) {
				for (int i = 0; i < tlist.size(); i++) {
					str += tlist.get(i).getTagName();
					if ((i + 1) < tlist.size()) {
						str += ',';
					}
				}
			}
			if (grooming != null ) {
				mv.addObject("grooming", grooming).addObject("tlist", str).addObject("m", m).setViewName("grooming/groomingSaveForm");
			} else {
				throw new GroomingException("수정 게시글 불러오기 실패!");
			}

			return mv;
		}

		// 임시저장 페이지 등록
		@RequestMapping("gSaveUpdate.do")
		public ModelAndView groomingSaveUpdate(HttpServletRequest request, String tagName, ModelAndView mv, String groomingNo,String memberNo,
				Grooming g, @RequestParam(value = "uploadFile", required = false) MultipartFile file) {

			String renameFileName = "";
			// 기존의 파일이 input hidden으로 와서 매개변수의 Board 객체에 담김
			// 그럼 그걸 가지고 기존의 파일을 삭제하자
			System.out.println(g.getGroomingImg());
			if (!file.getOriginalFilename().equals("")) { // 새로 올린 파일이 있는냐
				if (g.getGroomingImg() != null) { // 기존의 파일이 있느냐
					deleteFile(g.getGroomingImg(), request);
					// deleteFile메소드는 NoticeController에 만들었으니 아래에 복붙해서
					// 폴더명만 수정하자
				}
				renameFileName = saveFile(file, request);

				// Grooming 객체에 새로 올린 파일명을 담고(원본 및 변경한 것 둘다) DB를 다녀오자(update)
				if (!renameFileName.equals("")) {

					g.setGroomingImg(renameFileName);
				}

			} else {
				g.setGroomingImg(gService.selectGimg(groomingNo));
			}

			g.setGroomingNo(groomingNo);
			System.out.println("수정controller" + g);

			int result = gService.updateSaveGrooming(g);

			int result1 = 0;

			// 기존에 GTAG에 존재해있던 값을 지우자
			int result2 = gService.deleteGtag(groomingNo);

			if (tagName.length() != 0) {
				String[] tag = tagName.split(",");
				String[] tagNo = new String[tag.length];

				for (int i = 0; i < tag.length; i++) {
					// TAG 테이블에 값넣기
					String tagTemp = tag[i];
					result = tagService.mergeTags(tagTemp);
					// GTAG 테이블에 값넣기
					tagNo[i] = gService.findTagNo(tagTemp);
					String GtagNo = tagNo[i];

					Map map = new HashMap();
					map.put("GtagNo", GtagNo);
					map.put("groomingNo", groomingNo);

					// db 갔다 오기
					result1 = gService.insertGtag(map);

				}
			}
			
			System.out.println("나 등록 됬어요~" + result +result1+ result2);
			if (result > 0 && result1 > 0) {
				mv.setViewName("redirect:groomingMain.do");

			} else {
				throw new GroomingException("게시글 등록 실패!");
			}
			return mv;
		}
	
		// 글내역확인
		@RequestMapping("groomingDecide.do")
		@ResponseBody
		public String groomingDecide(String memberNo) {
			
			// 글쓴 내역이 있는가
			Grooming selectG = gService.select(memberNo);
			
			// 임시저장 글 내역이 있는가
			Grooming selectS = gService.selectSave(memberNo);
			
			if(selectG != null) {
				return "success";
			}else if(selectS != null) {
				return "false";
			}
			
			return "else";
			
		}
		
		// 그룹페이지 출석부로 이동
		@RequestMapping("calendar.do")
		public ModelAndView calendar(ModelAndView mv, String groomingNo,String memberNo) throws ParseException {

			Grooming grooming = gService.selectGrooming(groomingNo);
			System.out.println("groomingNo:" + groomingNo);
		
			
			ArrayList<Member> member = mService.GroupMList(groomingNo);
		
			  String str = ""; 
			  for(int i=0; i<member.size(); i++) {
				  str += member.get(i).getMemberNickName();
				  if((i+1)<member.size()) { str +=','; }
			  }
			  System.out.println("memberNo: " + memberNo);
			  String checkLate = "";
			  int checkY = 0;
			  int checkL = 0;
			  int checkN = 0;
			  int difDay = 0;
			  difDay = gService.getDifDate(groomingNo);
			  System.out.println("difDay : " + difDay);
			
			  
			  String memberNickName = gService.getMemberNickName(memberNo) ;
		
			    Map map  = new HashMap();
				map.put("groomingNo",groomingNo);
				map.put("memberNickName",memberNickName );
				
				String gMemberNo = gService.getGMemberNo(map);
				
				Map hashmap  = new HashMap();
				hashmap.put("groomingNo",groomingNo);
				hashmap.put("gMemberNo", gMemberNo);
			  
				 checkY = gService.getCheckY(hashmap);
				 checkL = gService.getCheckL(hashmap);
				 checkN = gService.getCheckN(hashmap);
				 checkLate = String.format("%.2f", (double)((checkY+checkL -(checkL/2.0))/difDay) * 100); 
				 System.out.println("checkLate: " + checkLate);
				 checkN = checkN + checkL/2;
				 checkL = checkL%2;
//			  for(int i=0; i<member.size(); i++) {
//				 
//				    Map map  = new HashMap();
//					map.put("groomingNo",groomingNo);
//					map.put("memberNickName", member.get(i).getMemberNickName());
//					
//					String gMemberNo = gService.getGMemberNo(map);
//					
//					Map hashmap  = new HashMap();
//					hashmap.put("groomingNo",groomingNo);
//					hashmap.put("gMemberNo", gMemberNo);
//				  
//					 checkY = gService.getCheckY(hashmap);
//					 checkL = gService.getCheckL(hashmap);
//					System.out.println("checkY :" +checkY);
//					System.out.println("checkL :" +checkL);
//					System.out.println("difDay :" +difDay);
//					checkLate[i] = String.format("%.2f", ((checkY+checkL -(int)(checkL/2.0))/difDay) * 100); 
//					System.out.println("checkLate["+i+"] : " + checkLate[i] );
//					memberNick[i] = member.get(i).getMemberNickName();
//				  
//			  }
//			  ArrayList<String[]> list = new ArrayList<String[]>();
//		
//			  for(int i=0; i<member.size(); i++) {
//				  list.add(checkLate);
//				  list.add(memberNick);
//			  }
//			  System.out.println("나 list야 : " +list.forEach(checkLate));
			  mv.addObject("grooming", grooming).addObject("str",str).addObject("member",member).addObject("checkLate",checkLate).addObject("memberNickName",memberNickName)
			  .addObject("grooming",grooming).addObject("checkY",checkY).addObject("checkL",checkL).addObject("checkN",checkN).setViewName("grooming/groupCalendar");

			return mv;
		}
		
		// 그룹페이지 출석 현황
		@RequestMapping("checkList.do")
		@ResponseBody
		public void checkList(HttpServletResponse response,String groomingNo, String memberNickName) throws JsonIOException, IOException {
			response.setContentType("application/json; charset=utf-8");
		/*	for(int i=0; i<memberNickName.length; i++) {*/
			Map map  = new HashMap();
			map.put("groomingNo",groomingNo);
			map.put("memberNickName", memberNickName);
			
			String gMemberNo = gService.getGMemberNo(map);
			
			Map hashmap  = new HashMap();
			hashmap.put("groomingNo",groomingNo);
			hashmap.put("gMemberNo", gMemberNo);
			 
			ArrayList<GCheck> gCheck = gService.checkList(hashmap);
		 
			Gson gson = new GsonBuilder().setDateFormat("yyyy MM-dd").create();
			gson.toJson(gCheck, response.getWriter());
			
		}
		
		// 출석 저장
		@RequestMapping("insertCheck.do")
		@ResponseBody
		public ModelAndView insertCheck(ModelAndView mv,GCheck g,String groomingNo, String memberNickName,String gCheckStatus)  {

			Grooming grooming = gService.selectGrooming(groomingNo);
			System.out.println("groomingNo:" + groomingNo);
		
			
			ArrayList<Member> member = mService.GroupMList(groomingNo);
			

		
			  String str = ""; 
			  for(int i=0; i<member.size(); i++) {
				  str += member.get(i).getMemberNickName();
				  if((i+1)<member.size()) { str +=','; }
			  }
			
			String[] nickname = memberNickName.split(",");
			String[] status = gCheckStatus.split(",");
			String gMemberNo = null;
			int result = 0;
			int result1 = 0;
			for(int i=0; i<nickname.length; i++) {
				
				Map map  = new HashMap();
				map.put("groomingNo",groomingNo);
				map.put("memberNickName", nickname[i]);
				
				gMemberNo = gService.getGMemberNo(map);
				
				g.setgMemberNo(gMemberNo);
				g.setgCheckStatus(status[i]);
				result = gService.insertCheck(g);
				
				Map map1  = new HashMap();
				map1.put("status",status[i]);
				map1.put("memberNickName", nickname[i]);
				
				
				result1 = mService.addExp(map1);
			}
	
			
			System.out.println("나 memberNickName : " + memberNickName);
			System.out.println("나 groomingNo : " + groomingNo);
			System.out.println("나 gCheckStatus : " + gCheckStatus);
			
			
			if (result > 0) {
				
				mv.addObject("grooming", grooming).addObject("str",str).addObject("member",member).setViewName("grooming/groupCalendar");
				
			} else {
				throw new GroomingException("출석 체크 실패!");
			}
			return mv;
		}
		
		// 출석 가능한 날짜 확인
		@RequestMapping("confirmCheck.do")
		@ResponseBody
		public String confirmCheck(String gCheckDate, String groomingNo) throws ParseException {

			

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			Date to = sdf.parse(gCheckDate);
			
			Map map = new HashMap(); 
			map.put("gCheckDate", to);
			map.put("groomingNo", groomingNo);
		 
			
			ArrayList<GCheck> g = gService.confirmCheck(map); 
			System.out.println("나 check확인하는 g야" + g); 
		
			if(!g.isEmpty()) {
				return "success"; 
			}else {
				return "false"; 
			}
		 
		}
		// 출석 수정
		@RequestMapping("updateCheck.do")
		@ResponseBody
		public ModelAndView updateCheck(ModelAndView mv,GCheck g,String groomingNo, String memberNickName,String gCheckStatus) {
			
			Grooming grooming = gService.selectGrooming(groomingNo);
			System.out.println("groomingNo:" + groomingNo);
		
			
			ArrayList<Member> member = mService.GroupMList(groomingNo);
			

		
			  String str = ""; 
			  for(int i=0; i<member.size(); i++) {
				  str += member.get(i).getMemberNickName();
				  if((i+1)<member.size()) { str +=','; }
			  }
			
			String[] nickname = memberNickName.split(",");
			String[] status = gCheckStatus.split(",");
			String gMemberNo = null;
			int result = 0;
			for(int i=0; i<nickname.length; i++) {
				
				Map map  = new HashMap();
				map.put("groomingNo",groomingNo);
				map.put("memberNickName", nickname[i]);
				
				gMemberNo = gService.getGMemberNo(map);
				
				g.setgMemberNo(gMemberNo);
				g.setgCheckStatus(status[i]);
				result = gService.updateCheck(g);
			}
	
			
//			System.out.println("나 memberNickName : " + memberNickName);
//			System.out.println("나 groomingNo : " + groomingNo);
//			System.out.println("나 gCheckStatus : " + gCheckStatus);
			
			
			if (result > 0) {
				
				mv.addObject("grooming", grooming).addObject("str",str).addObject("member",member).addObject("grooming",grooming).setViewName("grooming/groupCalendar");
				
			} else {
				throw new GroomingException("출석 수정 실패!");
			}
			return mv;
		
			
		}
		
		// 출석률 및 현황 리스트
		@RequestMapping("checkLate.do")
		@ResponseBody
		public void checkLate(HttpServletResponse response, String memberNo, String groomingNo) throws JsonIOException, IOException {
			response.setContentType("application/json; charset=utf-8");

				 
			  String checkLate = "";
			  int checkY = 0;
			  int checkL = 0;
			  int checkN = 0;
			  int difDay = 0;
			  difDay = gService.getDifDate(groomingNo);
			  System.out.println("difDay : " + difDay);
			
			  
			  String memberNickName = gService.getMemberNickName(memberNo) ;
		
			    Map map  = new HashMap();
				map.put("groomingNo",groomingNo);
				map.put("memberNickName",memberNickName );
				
				String gMemberNo = gService.getGMemberNo(map);
				
				Map hashmap  = new HashMap();
				hashmap.put("groomingNo",groomingNo);
				hashmap.put("gMemberNo", gMemberNo);
			  
				 checkY = gService.getCheckY(hashmap);
				 checkL = gService.getCheckL(hashmap);
				 checkN = gService.getCheckN(hashmap);
				 checkLate = String.format("%.2f", (double)((checkY+checkL -(checkL/2.0))/difDay) * 100); 
				 System.out.println("checkLate: " + checkLate);
				 checkN = checkN + checkL/2;
				 checkL = checkL%2;
				 GCheck g = new GCheck(memberNickName,checkLate,checkL,checkN,checkY,difDay);
				 g.setCheckLate(checkLate);
				 g.setCheckL(checkL);
				 g.setCheckN(checkN);
				 g.setCheckY(checkY);
				 g.setDifDay(difDay);
				 
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				gson.toJson(g, response.getWriter());
	}
  
		
		
		@RequestMapping("checkPeople.do")
		@ResponseBody
		public void checkPeople(HttpServletResponse response, String groomingNo) throws JsonIOException, IOException {

			response.setContentType("application/json; charset=utf-8");
			Grooming grooming = gService.selectGrooming(groomingNo);
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(grooming, response.getWriter());

		}	
		
		@RequestMapping("checkGPoint.do")
		@ResponseBody
		public void checkGPoint(HttpServletResponse response, String applyNo) throws JsonIOException, IOException {
			
			response.setContentType("application/json; charset=utf-8");
			
			ArrayList<MyPagePoint> mp = gService.selectGpointList(applyNo);
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(mp, response.getWriter());
			
		}	
		
		@RequestMapping("LimitCheck.do")
		@ResponseBody
		public String LimitCheck(String groomingNo) {
			Grooming g = gService.limitCheck(groomingNo);
			
			if(g != null) {
				return "success";
			}else {
				return "false";
			}
			
		}	
		
		@RequestMapping("findHeart.do")
		@ResponseBody
		public String findHeart(String groomingNo, String memberNo) {
			Map info = new HashMap();
			info.put("groomingNo", groomingNo);
			info.put("memberNo", memberNo);
			GroomingHeart heart = gService.selectHeartMember(info);
			
			if(heart != null) {
				return "success";
			}else {
				return "false";
			}
			
		}	
}
