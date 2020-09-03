package com.kh.groomingProject.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;
import static com.kh.groomingProject.common.CommunityPagination.getPageInfo;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.groomingProject.common.CommunityPageInfo;
import com.kh.groomingProject.community.model.exception.CommunityException;
import com.kh.groomingProject.community.model.service.CommunityService;
import com.kh.groomingProject.community.model.vo.Bimages;
import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.community.model.vo.PageInfo;
import com.kh.groomingProject.community.model.vo.Reply;
import com.kh.groomingProject.member.model.vo.Member;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService cService;

	@RequestMapping("communityMain.do")
	public ModelAndView communityMain(HttpServletRequest request, ModelAndView mav, 
							@RequestParam(value="bCategoryNo", required=false) String bCategoryNo,
							@RequestParam(value="page", required=false) Integer page) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = cService.getListCount(); // 총 게시물 갯수
		
		CommunityPageInfo pi = getPageInfo(currentPage, listCount);	
//		System.out.println("pi : " + pi);
		
		String bCate = request.getParameter("bCategoryNo");
		
//		System.out.println("파라미터 되니? : " + bCate);
		ArrayList<Board> list = cService.selectList(null, pi);
		mav.addObject("list", list);
		System.out.println("list" + pi);
		
		ArrayList<Board> nlist = cService.selectList("BC00001", pi);
		mav.addObject("nlist", nlist);
		System.out.println("nlist" + pi);
		
		ArrayList<Board> flist = cService.selectList("BC00002", pi);
		mav.addObject("flist", flist);
		System.out.println("flist" + pi);
		
		ArrayList<Board> plist = cService.selectList("BC00003", pi);
		mav.addObject("plist", plist);
		System.out.println("plist" + pi);
		
		ArrayList<Board> qlist = cService.selectList("BC00005", pi);
		mav.addObject("qlist", qlist);
		System.out.println("qlist" + pi);
		
		mav.setViewName("community/communityMain");
		mav.addObject("bCategoryNo", bCate);
		mav.addObject("pi", pi);
		
		return mav;
	}
	
	// -------------------------------------------------------------------------------------
	
	@RequestMapping("communityDetailView.do")
	public String communityDetailView(Model model, String boardNo) {
		Board b = cService.selectOne(boardNo); 
		ArrayList<Reply> replyList = cService.replySelectList(boardNo);
		
		int result = cService.addViewCount(boardNo);
		
		if(b != null) { 
			model.addAttribute("board", b); 
			model.addAttribute("replyList", replyList);
			
		}else { 
			throw new CommunityException("게시물 상세 보기 실패!"); 
		} 
			return "community/communityDetailView";
		}	
	
	// -------------------------------------------------------------------------------------
		
	@RequestMapping("communityInsertView.do") 
	public String communityInsertView(String bCategoryNo, Model model) {
		if(bCategoryNo != null) {
			model.addAttribute("bCategoryNo", bCategoryNo);
		}	
		return "community/communityInsertView"; 
	}
		 
	@RequestMapping(value="communityInsert.do", method=RequestMethod.POST) 
	public String communityInsert(HttpServletRequest request, Board b, Model model,
			@RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		Bimages imgFile = new Bimages();
		Member member = (Member)request.getSession().getAttribute("loginUser");
		
		if(!file.getOriginalFilename().contentEquals("")) {
			String savePath = saveFile(file, request);
//			System.out.println("최종 저장될 파일명을 포함한 경로 : " + savePath);
			if(savePath != null) { // 파일이 잘 저장되어 경로가 반환 된다면
				imgFile.setImgName(file.getOriginalFilename());
			}
		}

		
		int savefile = cService.communityFileInsert(imgFile);
		int result = cService.communityInsert(b, member);
		System.out.println(b);
		System.out.println("imgFile : " + imgFile);
		
		if(result > 0) { 
			return "redirect:communityMain.do?bCategoryNo="+b.getbCategoryNo(); 
		}else { 
			throw new CommunityException("게시물 등록 실패!"); 
		} 
	}
	
	// -------------------------------------------------------------------------------------	
		
	@RequestMapping(value="replyInsert.do", method=RequestMethod.POST) 
	public String replyInsert(HttpServletRequest request, Board b, Reply reply, Model model) { 
		Member member = (Member)request.getSession().getAttribute("loginUser");
		
		System.out.println("댓글" + reply);
		int result = cService.replyInsert(reply, member);
		
		if(result > 0) { 
			return "redirect:communityMain.do?bCategoryNo="+b.getbCategoryNo(); 
		}else { 
			throw new CommunityException("댓글 등록 실패!"); 
		} 
	}
	
	// -------------------------------------------------------------------------------------
	
	@RequestMapping("communityUpdateView.do") 
	public String communityUpdateView(String boardNo, Model model, String bCategoryNo) { 
		model.addAttribute("board", cService.selectOne(boardNo));
		return "community/communityUpdateView"; 
	}
		
	@RequestMapping(value="communityUpdate.do", method=RequestMethod.POST)
	public String communityUpdate(HttpServletRequest request, Board b) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		System.out.println("1 " + b);
		int result = cService.communityUpdate(b, member);
		System.out.println("2 " + b);
		if(result > 0) { 
			return "redirect:communityMain.do?bCategoryNo="+b.getbCategoryNo();  
		}else { 
			throw new CommunityException("게시물 수정 실패!"); 
		} 
	}

	// -------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	// -------------------------------------------------------------------------------------
	
	@RequestMapping("communityDelete.do")
	public String communityDelete(String boardNo, HttpServletRequest request) { 
		Board b = cService.selectOne(boardNo);
	
		int result = cService.communityDelete(boardNo);
			 
		if(result > 0) { 
			return "redirect:communityMain.do?bCategoryNo="+b.getbCategoryNo(); 
		}else { 
			throw new CommunityException("게시물 삭제 실패!"); 
		} 
	}
		
	// -------------------------------------------------------------------------------------	
	
	// 파일이 저장 될 경로를 설정하는 메소드
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources"); // webapp -> resources
		
		String savePath = root + "\\buploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) { 	// webapp 아래에 있는 resources 폴더 아래에 nuploadFiles가 없어서 File객체를 찾을수 없다면
			folder.mkdirs();
		}
		
		String filePath = folder + "\\" + file.getOriginalFilename();
		// 실제 저장 될 파일의 경로 + 파일명
		
		try {
			file.transferTo(new File(filePath));
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return filePath;
	}
	
}
