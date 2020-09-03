package com.kh.groomingProject.grooming.controller;

import static com.kh.groomingProject.common.GroupPagination.getPageInfo;
import static com.kh.groomingProject.common.GroomingPagination.getPageInfoG;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.kh.groomingProject.member.model.service.MemberService;
import com.kh.groomingProject.member.model.vo.Member;
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

//	메인으로 가기
	@RequestMapping("groomingMain.do")
	public ModelAndView groomingList(ModelAndView mv, String memberNo,@RequestParam(value="page", required=false) Integer page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = gService.getGroomingListCount();
		
		GroomingPageInfo pi = getPageInfoG(currentPage, listCount);
		
		ArrayList<Grooming> glist = gService.selectList(pi);
	
		System.out.println("나 glist야 " +glist);
//		int result = 0;
//		for (int i = 0; i < glist.size(); i++) {
//
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//			String endDate = sdf.format(glist.get(i).getGroomingEd());
//			String nowDate = sdf.format(glist.get(i).getGroomingNd());
//
//			System.out.println("나 endDate야 " + endDate);
//			System.out.println("나 nowDate야 " + nowDate);
//
//			if (endDate.compareTo(nowDate) < 0) {
//				String groomingNo = glist.get(i).getGroomingNo();
//				result = gService.statusUpdate(groomingNo);
//			}
//
//		}
//		System.out.println("나 result" + result);
		if (glist != null) {
			mv.addObject("glist", glist).addObject("pi", pi).setViewName("grooming/groomingMain");
		} else {
			throw new GroomingException("리스트 불러오기 실패!");
		}
		return mv;
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

	@RequestMapping("groomingInsert.do")
	public String groomingInsert() {
		return "grooming/groomingInsertForm";
	}

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
			Declaration declaration = declarationService.selectGroomingDeclare(info);
			GroomingApplicant memberNoList = gService.selectAppMemberNo(info);
			GroomingHeart heart = gService.selectHeartMember(info);
//			System.out.println("나 tag야 " +tag);

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

	@RequestMapping("gacceptList.do")
	@ResponseBody
	public void groomingAppAccept(HttpServletResponse response, String groomingNo) throws JsonIOException, IOException {

		response.setContentType("application/json; charset=utf-8");
		ArrayList<GroomingAppList> appList = gService.selectAppContent(groomingNo);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(appList, response.getWriter());

	}

	@RequestMapping("gaccept.do")
	@ResponseBody
	public String groomingAccept(String applyNo, String groomingNo) {
		System.out.println(applyNo);
		int result = gService.selectApplyOne(applyNo);
		int result1 = gService.addGroomingP(groomingNo);

		String memberNo = gService.findAppMemberNo(applyNo);
		Map map = new HashMap();
		map.put("memberNo", memberNo);
		map.put("groomingNo", groomingNo);

		int result2 = gService.addGroomingMember(map);

		if (result > 0 && result1 > 0 && result2 > 0) {
			return "success";
		} else {
			return "false";
		}

	}

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

	@RequestMapping("groomingUpdate.do")
	public ModelAndView groomingUpdateView(ModelAndView mv, String groomingNo,@RequestParam("page") Integer page) {
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
		if (grooming != null && tlist != null) {
			mv.addObject("grooming", grooming).addObject("tlist", str).addObject("currentPage",page).setViewName("grooming/groomingUpdateForm");
		} else {
			throw new GroomingException("수정 게시글 불러오기 실패!");
		}

		return mv;
	}

	@RequestMapping("gUpdate.do")
	public ModelAndView groomingUpdate(HttpServletRequest request, String tagName, ModelAndView mv, String groomingNo,
			Grooming g, @RequestParam(value = "uploadFile", required = false) MultipartFile file,@RequestParam("page") Integer page) {

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
		if (result > 0 && result1 > 0 && result2 > 0) {
			mv.addObject("page",page).setViewName("redirect:groomingMain.do");

		} else {
			throw new GroomingException("게시글 수정 실패!");
		}
		return mv;
	}

	private void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\upGroomingFiles";

		File f = new File(savePath + "\\" + fileName);
		if (f.exists()) {
			f.delete();
		}
	}

	@RequestMapping("groomingDelete.do")
	public String groomingDelete(String groomingNo) {

		int result = gService.groomingDelete(groomingNo);

		if (result > 0) {
			return "redirect:groomingMain.do";
		} else {
			throw new GroomingException("게시글 삭제 실패!");
		}
	}

	@RequestMapping("groomingLimit.do")
	public String groomingLimit(String groomingNo) {

		int result = gService.statusUpdate(groomingNo);

		if (result > 0) {
			return "redirect:groomingMain.do";
		} else {
			throw new GroomingException("게시글 마감 실패!");
		}
	}

	@RequestMapping("applyContent.do")
	public String applyContent(GroomingApplicant ga,String money) {
		System.out.println("나 ga" + ga);
		int result = gService.applyContent(ga);
		/*
		 * if(money != "") { int result1 = gService.minusMoney() }
		 */
		if (result > 0) {
			return "redirect:groomingMain.do";
		} else {
			throw new GroomingException("게시글 신청 실패!");
		}
	}

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
	public ModelAndView addHeart(ModelAndView mv, String groomingNo, String memberNo) {

		Map info = new HashMap();
		info.put("groomingNo", groomingNo);
		info.put("memberNo", memberNo);

		int result = gService.addHeart(info);
		if (result > 0) {
			Grooming grooming = gService.selectGrooming(groomingNo);

			ArrayList<GroomingTag> tag = gService.selectTag(groomingNo);
			ArrayList<GroomingSpec> spec = gService.selectSpec(groomingNo);
			Member member = gService.selectMember(groomingNo);
			ArrayList<Member> galist = gService.selectAppMember(groomingNo);

			ArrayList<GroomingAppList> appList = gService.selectAppContent(groomingNo);

			GroomingApplicant memberNoList = gService.selectAppMemberNo(info);
			GroomingHeart heart = gService.selectHeartMember(info);

			if (grooming != null && tag != null && spec != null && member != null) {
				mv.addObject("grooming", grooming).addObject("tag", tag).addObject("spec", spec)
						.addObject("member", member).addObject("appList", appList)
						.addObject("memberNoList", memberNoList).addObject("heart", heart)
						.setViewName("grooming/groomingDetailView");
			} else {
				throw new GroomingException("조회실패!");
			}
		} else {
			throw new GroomingException("찜하기 실패!");
		}

		return mv;
	}

	@RequestMapping("cancelHeart.do")
	public ModelAndView cancelHeart(ModelAndView mv, String groomingNo, String memberNo) {

		Map info = new HashMap();
		info.put("groomingNo", groomingNo);
		info.put("memberNo", memberNo);

		int result = gService.cancelHeart(info);
		if (result > 0) {
			Grooming grooming = gService.selectGrooming(groomingNo);

			ArrayList<GroomingTag> tag = gService.selectTag(groomingNo);
			ArrayList<GroomingSpec> spec = gService.selectSpec(groomingNo);
			Member member = gService.selectMember(groomingNo);
			ArrayList<Member> galist = gService.selectAppMember(groomingNo);

			ArrayList<GroomingAppList> appList = gService.selectAppContent(groomingNo);

			GroomingApplicant memberNoList = gService.selectAppMemberNo(info);
			GroomingHeart heart = gService.selectHeartMember(info);

			if (grooming != null && tag != null && spec != null && member != null) {
				mv.addObject("grooming", grooming).addObject("tag", tag).addObject("spec", spec)
						.addObject("member", member).addObject("appList", appList)
						.addObject("memberNoList", memberNoList).addObject("heart", heart)
						.setViewName("grooming/groomingDetailView");
			} else {
				throw new GroomingException("조회실패!");
			}
		} else {
			throw new GroomingException("찜하기 실패!");
		}

		return mv;
	}

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
	 
	  @RequestMapping("groupBoardUpdate.do")
	  public ModelAndView groupBoardUpdate(ModelAndView mv,String groomingNo, String gBoardNo,
			  @RequestParam(value = "page", required = false) Integer page) {
		  
		  GroupBoard g = gService.selectGBoard(gBoardNo);
		  
		  Grooming grooming = gService.selectGrooming(groomingNo); 
		  mv.addObject("g",g).addObject("page",page).addObject("grooming",grooming).setViewName("grooming/groupBoardUpdateForm");
		  
		  return mv;
	  }
	 
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
	  
		@RequestMapping("groupReply.do")
		public void groupReply(HttpServletResponse response,String gBoardNo) throws JsonIOException, IOException {
			response.setContentType("application/json; charset=utf-8");

			ArrayList<GReply> rlist = gService.selectReplyList(gBoardNo);

			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(rlist, response.getWriter());
		}

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
	  
	  
		@RequestMapping("groomingSaveInsert.do")
		public ModelAndView groomingSaveView(ModelAndView mv, String memberNo) {
			// 임시저장된 그루밍 글번호 가져오자!
			String groomingNo = gService.getGroomingNo(memberNo);
			
			ArrayList<Tag> tlist = tagService.selectGtagList(groomingNo);
//			System.out.println("나 tlist야" +tlist);
			Grooming grooming = gService.selectGrooming(groomingNo);
			
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
				mv.addObject("grooming", grooming).addObject("tlist", str).setViewName("grooming/groomingSaveForm");
			} else {
				throw new GroomingException("수정 게시글 불러오기 실패!");
			}

			return mv;
		}

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
			
			System.out.println("나 수정 됬어요~" + result +result1+ result2);
			if (result > 0 && result1 > 0) {
				mv.setViewName("redirect:groomingMain.do");

			} else {
				throw new GroomingException("게시글 수정 실패!");
			}
			return mv;
		}
	
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
		
		@RequestMapping("calendar.do")
		public ModelAndView calendar(ModelAndView mv, String groomingNo) {

			Grooming grooming = gService.selectGrooming(groomingNo);
			
		
		
		 
			ArrayList<Member> member = mService.GroupMList(groomingNo);
			

		
			  String str = ""; 
			  for(int i=0; i<member.size(); i++) {
				  str += member.get(i).getMemberNickName();
				  if((i+1)<member.size()) { str +=','; }
			  }

			  
			  mv.addObject("grooming", grooming).addObject("str",str).addObject("member",member).addObject("grooming",grooming).setViewName("grooming/groupCalendar");

			return mv;
		}
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
	  
}
