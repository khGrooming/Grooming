package com.kh.groomingProject.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.community.model.vo.PageInfo;
import com.kh.groomingProject.community.model.vo.Reply;
import com.kh.groomingProject.declaration.model.service.DeclarationService;
import com.kh.groomingProject.declaration.model.vo.Declaration;
import com.kh.groomingProject.grooming.model.exception.GroomingException;
import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.grooming.model.vo.GroomingAppList;
import com.kh.groomingProject.grooming.model.vo.GroomingApplicant;
import com.kh.groomingProject.grooming.model.vo.GroomingHeart;
import com.kh.groomingProject.grooming.model.vo.GroomingSearch;
import com.kh.groomingProject.grooming.model.vo.GroomingSpec;
import com.kh.groomingProject.grooming.model.vo.GroomingTag;
import com.kh.groomingProject.member.model.vo.Member;

@Controller
public class CommunityController {
   
   @Autowired
   private CommunityService cService;
   
   @Autowired
   private DeclarationService declarationService;   

   // 전체 게시판 조회
   @RequestMapping("communityMain.do")
   public ModelAndView communityMain(HttpServletRequest request, ModelAndView mav, 
                     @RequestParam(value="bCategoryNo", required=false) String bCategoryNo,
                     @RequestParam(value="page", required=false) Integer page) {
      
      int cp = 1;      // 커뮤니티 글 현재 페이지
      int ncp = 1;   // 공지사항 글 현재 페이지
      int fcp = 1;   // 자유게시판 글 현재 페이지
      int pcp = 1;   // 홍보게시판 글 현재 페이지
      int qcp = 1;   // qna 게시판 글 현재 페이지
      
      if(page == null) {
         page = 1;
         
      }else {
         switch(bCategoryNo) {
         case "BC00001": ncp = page; break; // 공지사항
         case "BC00002": fcp = page; break; // 자유
         case "BC00003": pcp = page; break; // 홍보
         case "BC00005": qcp = page; break; // qna
         default: cp = page; break;
         }
      }
      
      //////////////////////////////////// 각 게시판 현재 페이지 세팅 /////////////////////////////
      
      int listCount = cService.getListCount(null);    // 총 게시물 갯수(보드 전체의 게시글 갯수)
      int listCount4N = cService.getListCount("BC00001");    // 총 게시물 갯수(보드 전체의 게시글 갯수)
      int listCount4F = cService.getListCount("BC00002");    // 총 게시물 갯수(보드 전체의 게시글 갯수)
      int listCount4P = cService.getListCount("BC00003");    // 총 게시물 갯수(보드 전체의 게시글 갯수)
      int listCount4C = cService.getListCount("BC00004");    // 총 게시물 갯수(보드 전체의 게시글 갯수)
      int listCount4Q = cService.getListCount("BC00005");    // 총 게시물 갯수(보드 전체의 게시글 갯수)
      
      CommunityPageInfo pi = getPageInfo(cp, listCount);   
      CommunityPageInfo npi = getPageInfo(ncp, listCount4N);   
      CommunityPageInfo fpi = getPageInfo(fcp, listCount4F);   
      CommunityPageInfo ppi = getPageInfo(pcp, listCount4P);   
      int cpi = listCount4C;   
      CommunityPageInfo qpi = getPageInfo(qcp, listCount4Q);   
      
      String bCate = request.getParameter("bCategoryNo");
      
      ArrayList<Board> list = cService.selectList(null, pi);
      mav.addObject("list", list);

      ArrayList<Board> nlist = cService.selectList("BC00001", npi);
      mav.addObject("nlist", nlist);
      
      ArrayList<Board> flist = cService.selectList("BC00002", fpi);
      mav.addObject("flist", flist);
      
      ArrayList<Board> plist = cService.selectList("BC00003", ppi);
      mav.addObject("plist", plist);
      
      ArrayList<Board> clist = cService.selectListC("BC00004", cpi);
      mav.addObject("clist", clist);
      
      
      ArrayList<Board> qlist = cService.selectList("BC00005", qpi);
      mav.addObject("qlist", qlist);
      
      mav.setViewName("community/communityMain");
      mav.addObject("bCategoryNo", bCate);
      mav.addObject("pi", pi);
      mav.addObject("npi", npi);
      mav.addObject("fpi", fpi);
      mav.addObject("ppi", ppi);
      mav.addObject("cpi", cpi);
      mav.addObject("qpi", qpi);
      
      return mav;
   }
   
   
   // 게시판 상세 조회
   @RequestMapping("communityDetailView.do")
   public String communityDetailView(HttpServletRequest request, Model model, String boardNo) {
      Member member = (Member)request.getSession().getAttribute("loginUser");
      
      String memberNo = null;
      if(member != null) {
         memberNo = member.getMemberNo();
      }
      
      Board b = cService.selectOne(boardNo, memberNo); 
      
      ArrayList<Reply> replyList = cService.replySelectList(boardNo); // 댓글목록
   
      int result = cService.addViewCount(boardNo); // 조회수 증가

      if(b != null) { 
         model.addAttribute("board", b); 
         model.addAttribute("replyList", replyList);
         
      }else { 
         throw new CommunityException("게시물 상세 보기 실패!"); 
      } 
         return "community/communityDetailView";
      }   
   
   
   // 게시물 올리기
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
      
      // 이미지 파일 올리기
      Member member = (Member)request.getSession().getAttribute("loginUser");
      
      if(!file.getOriginalFilename().contentEquals("")) {
         String savePath = saveFile(file, request);

         if(savePath != null) { // 파일이 잘 저장되어 경로가 반환 된다면
            b.setBoardImg(file.getOriginalFilename());
         }
      }
      
      int result = cService.communityInsert(b, member);
      
      if(result > 0) { 
         return "redirect:communityMain.do?bCategoryNo="+b.getbCategoryNo(); 
      }else { 
         throw new CommunityException("게시물 등록 실패!"); 
      } 
   } 
   
   
   // 댓글 등록하기   
   @RequestMapping(value="replyInsert.do", method=RequestMethod.POST) 
   public String replyInsert(HttpServletRequest request, Board b, Reply reply, Model model) { 
      Member member = (Member)request.getSession().getAttribute("loginUser");
      
      int result = cService.replyInsert(reply, member);
      
      if(result > 0) { 
         return "redirect:communityDetailView.do?bCategoryNo="+b.getbCategoryNo() +"&boardNo="+b.getBoardNo();
      }else { 
         throw new CommunityException("댓글 등록 실패!"); 
      } 
   }
   
   
   // 게시물 수정하기
   @RequestMapping("communityUpdateView.do") 
   public String communityUpdateView(HttpServletRequest request, String boardNo, Model model, String bCategoryNo) { 
      Member member = (Member)request.getSession().getAttribute("loginUser");
      
      model.addAttribute("board", cService.selectOne(boardNo, member.getMemberNo()));
      return "community/communityUpdateView"; 
   }
   
   @RequestMapping(value="communityUpdate.do", method=RequestMethod.POST)
   public String communityUpdate(HttpServletRequest request, Board b,
         @RequestParam(value="uploadFile", required=false) MultipartFile file) {
      Member member = (Member)request.getSession().getAttribute("loginUser");
      
      
      String renameFileName = "";
      
      if(!file.getOriginalFilename().equals("")) { // 새로 올린 파일이 있으면
         if(b.getBoardImg() != null) { // 기존에 파일이 있었으면
            deleteFile(b.getBoardImg(), request);
         }
         renameFileName = saveFile(file, request);
      }
      
      b.setBoardImg(file.getOriginalFilename());   
      
      int result = cService.communityUpdate(b, member);
   
      if(result > 0) { 
         return "redirect:communityMain.do?bCategoryNo="+b.getbCategoryNo();  
      }else { 
         throw new CommunityException("게시물 수정 실패!"); 
      } 
   }

   
   // 댓글 수정하기
   @RequestMapping(value="replyUpdate.do", method=RequestMethod.POST)
   public String replyUpdate(HttpServletRequest request, Reply reply, Board b, Model model) {
      Member member = (Member)request.getSession().getAttribute("loginUser");
      
      String rUpdate = (String)request.getParameter("rUpdate");
      reply.setReplyContent(rUpdate);
      
      int result = cService.replyUpdate(reply, member);
      
      if(result > 0) {
         return "redirect:communityDetailView.do?boardNo="+b.getBoardNo();
      }else {
         throw new CommunityException("댓글 수정 실패!");
      }
   }
   
   
   // 게시물 삭제하기
   @RequestMapping("communityDelete.do")
   public String communityDelete(String boardNo, HttpServletRequest request) { 
      Member member = (Member)request.getSession().getAttribute("loginUser");
      
      Board b = cService.selectOne(boardNo, member.getMemberNo());
   
      int result = cService.communityDelete(boardNo);
          
      if(result > 0) { 
         return "redirect:communityMain.do?bCategoryNo="+b.getbCategoryNo(); 
      }else { 
         throw new CommunityException("게시물 삭제 실패!"); 
      } 
   }
   
   // 파일삭제
   private void deleteFile(String fileName, HttpServletRequest request) {
      String root = request.getSession().getServletContext().getRealPath("resources");
      
      String savePath = root + "\\buploadFiles";
      
      File f = new File(savePath + "\\" + fileName);
      
      if(f.exists()) {
         f.delete();
      }
   }
   
   
   // 댓글 삭제하기
   @RequestMapping("replyDelete.do")
   public String replyDelete(HttpServletRequest request, Reply reply, Board b, Model model) {
      Member member = (Member)request.getSession().getAttribute("loginUser");
      
      
      int result = cService.replyDelete(reply, member);
      
      if(result > 0) {
         return "redirect:communityDetailView.do?boardNo="+b.getBoardNo();
      }else {
         throw new CommunityException("댓글 삭제 실패!");
      }
   }
      
   
   // 파일이 저장 될 경로를 설정하는 메소드
   private String saveFile(MultipartFile file, HttpServletRequest request) {
      String root = request.getSession().getServletContext().getRealPath("resources"); // webapp -> resources
      
      String savePath = root + "\\buploadFiles";
      
      File folder = new File(savePath);
      
      if(!folder.exists()) {    // webapp 아래에 있는 resources 폴더 아래에 nuploadFiles가 없어서 File객체를 찾을수 없다면
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
   
   // 랭킹 리스트
   @RequestMapping("topList.do")
   public void communityTopList(HttpServletResponse response) throws JsonIOException, IOException {
      response.setContentType("appalication/json;charset=utf-8");
      
      ArrayList<Board> communityTopList = cService.communityTopList();
      
      Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
      gson.toJson(communityTopList, response.getWriter());
   }
   
   
   // 검색
   @RequestMapping("communitySearch.do")
   public void communitySearch(HttpServletResponse response, String communitySearch)
         throws JsonIOException, IOException {
      response.setContentType("application/json; charset=utf-8");

      ArrayList<Board> blist = cService.communitySearch(communitySearch);
      //System.out.println("검색해온 blist " + blist);
      Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
      gson.toJson(blist, response.getWriter());
   }

   
   // 신고하기
   @RequestMapping(value="declareB.do", method=RequestMethod.POST)
   public String declareB(Model model, Declaration d,String boardNo, String bCategoryNo, String memberNo) {
      
      int result = declarationService.declareB(d);

      if(result > 0) {
         return "redirect:communityDetailView.do?boardNo="+d.getDnNo();
      }else {
         throw new CommunityException("신고 실패!");
      }
   }

   // 검색
   @RequestMapping("communityFBSearch.do")
   public ModelAndView communityFBSearch(ModelAndView mav, String communitySearch
         , @RequestParam(value="page", required=false) Integer page)
         throws JsonIOException, IOException {
      //System.out.println(" 검색 " + communitySearch);
      
      int listCount4F = cService.getCommunityFBSearchCount(communitySearch);    // 검색 게시글 갯수
      
      //System.out.println(" 검색 페이지 " + listCount4F);
      
      // 페이지 네이션 구간
      int fcp = 1;   // qna 게시판 글 현재 페이지
      
      if(page == null) {
         page = 1;
      }else {
         fcp = page;
      }
      
      CommunityPageInfo fpi = getPageInfo(fcp, listCount4F);   
      
      // 게시글 가져오기 
      ArrayList<Board> flist = cService.getCommunityFBSearch(fpi, communitySearch);
      
      //System.out.println("검색해온 blist " + flist);
      
      mav.addObject("flist", flist);
      mav.addObject("fpi", fpi);
      mav.addObject("communitySearch", communitySearch);

      mav.setViewName("community/communityFBsearch");
      
      return mav;

   }

}