package com.kh.groomingProject.grooming.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.groomingProject.grooming.model.exception.GroomingException;
import com.kh.groomingProject.grooming.model.service.GroomingService;
import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.grooming.model.vo.GroomingSpec;
import com.kh.groomingProject.grooming.model.vo.GroomingTag;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.tag.model.service.TagService;

@Controller
public class GroomingController<memberNo> {

	@Autowired
	private GroomingService gService;
	
	@Autowired
	private TagService tagService;
	
//	메인으로 가기
	@RequestMapping("groomingMain.do")
	public ModelAndView groomingList(ModelAndView mv) {
		
		ArrayList<Grooming> glist = gService.selectList();
		
		
		if(glist != null) {
			mv.addObject("glist",glist);
			mv.setViewName("grooming/groomingMain");
		}else {
			throw new GroomingException("리스트 불러오기 실패!");
		}
		return mv;
	}
	
// 멘토 필터 적용
	@RequestMapping("groomingMe.do")
	public void groomingMentorList(HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		ArrayList<Grooming> glist = gService.selectMentorList();
		
	
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(glist,response.getWriter());
	}
	
// 예치금 필터 적용
	@RequestMapping("groomingMo.do")
	public void groomingMoneyList(HttpServletResponse response)throws JsonIOException, IOException {
	
		response.setContentType("application/json; charset=utf-8");

		ArrayList<Grooming> glist = gService.selectMoneyList();
		
	
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(glist,response.getWriter());
	}

	// 검색
	@RequestMapping("search.do")	
	public void gSearchWriter(HttpServletResponse response, String search, String keyword) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		ArrayList<Grooming> glist =  new ArrayList<>();
		if(search.equals("title")) {
			ArrayList<Grooming> list = gService.gSearchTitle(keyword);
			glist = list;
		}else if(search.equals("writer")) {
			ArrayList<Grooming> list = gService.gSearchWriter(keyword);
			glist = list;
		}else {
			ArrayList<Grooming> list = gService.gSearchContent(keyword);
			glist = list;
		}

		System.out.println("gSearchWriter // search : " + search);
		System.out.println("gSearchWriter // keyword : " + keyword);
		System.out.println("gSearchWriter // glist : " + glist);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(glist,response.getWriter());
	}
	
	
	
	@RequestMapping("groupPage.do")	
	public String groupPage() {
		return "grooming/groupPage";
	}
	
	
	
	@RequestMapping("groupBoardInsertForm.do")	
	public String groupBoardInsertForm() {
		return "grooming/groupBoardInsertForm";
	}
	
	
	@RequestMapping("groupdetail.do")	
	public String groupBoardDetailView() {
		return "grooming/groupBoardDetailView";
	}
	
	@RequestMapping("groomingInsert.do")	
	public String groomingInsert() {
		return "grooming/groomingInsertForm";
	}
	
	
	@RequestMapping("groomingInsertForm.do")	
	public String boardInsert(HttpServletRequest request,String memberNo, Grooming g, String tagName,
			@RequestParam(value="uploadFile", required=true)  MultipartFile file) {
//		 Map<Object, String> map = new HashMap<> ();
//		 map.put(g, "g");
//		g.setMemberNo(memberNo);
		if(!file.getOriginalFilename().equals("")) {
			String savePath = saveFile(file,request);
			
			if(savePath != null) {	// 파일이 잘 저장되어 경로가 반환 된다면..
				g.setGroomingImg(file.getOriginalFilename());
			}
			
		}
		
		System.out.println(g);
		int result = gService.insertGrooming(g);
		
		if(tagName.length() != 0 ) {
			String[] tag = tagName.split(",");
	
			for(int i = 0 ; i < tag.length; i++) {
				String tagTemp = tag[i];
				result = tagService.mergeTags(tagTemp);
			}
		}
		
		if(result > 0) {
			return "redirect:groomingMain.do";
		}else {
			throw new GroomingException("게시글 등록 실패!");
		}
	}
	// 파일이 저장 될 경로를 설정하는 메소드
		private String saveFile(MultipartFile file, HttpServletRequest request) {
				
				String root = request.getSession().getServletContext().getRealPath("resources");
				
				String savePath = root + "\\upGroomingFiles";
				
				File folder = new File(savePath);
				
				if(!folder.exists()) {	// webapp아래에 있는 resources 폴더 아래에
										// nuploadFiles가 없어서 File객체를 찾을 수 없다면
					folder.mkdirs();
					
				}
				
				// 공지글은 파일명 중복 제거는 신경쓰지 않고 했지만
				// 게시판에서는 파일명을 날짜(업로드 시간)로 rename 해보자
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String originFileName = file.getOriginalFilename();
				String renameFileName
					= sdf.format(new java.sql.Date(System.currentTimeMillis()))
					 + "." + originFileName.substring(originFileName.lastIndexOf(".")+1);
				
				
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
	public ModelAndView groomingDetailView(ModelAndView mv, String groomingNo) {
		
		int result = gService.addReadCount(groomingNo);
		System.out.println(result);
		if(result >0) {
			Grooming grooming = gService.selectGrooming(groomingNo);

			ArrayList<GroomingTag> tag = gService.selectTag(groomingNo);
			ArrayList<GroomingSpec> spec = gService.selectSpec(groomingNo);
			Member member = gService.selectMember(groomingNo);
			System.out.println(member);
			if(grooming != null && tag != null && spec != null && member != null) {
				mv.addObject("grooming",grooming)
				.addObject("tag",tag)
				.addObject("spec",spec)
				.addObject("member",member)
				.setViewName("grooming/groomingDetailView");
			}else {
				throw new GroomingException("조회실패!");
			}
			
			
			
			
		}else {
			throw new GroomingException("게시글 조회수 증가 실패!");
		}
		
		
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

