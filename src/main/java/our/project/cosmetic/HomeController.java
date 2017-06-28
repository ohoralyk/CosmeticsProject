package our.project.cosmetic;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@SessionAttributes("signupVO")
@Controller
public class HomeController {
	
	@Autowired
	CosmeticServiceImpl cosmeticserviceimpl;
	
	@Autowired
	CosmeticService cosmeticservice;
	
	@Autowired
	ModelAndView mav;
	
	@RequestMapping("/")
	public ModelAndView getMainList() {
		mav.setViewName("cocommain");
		return mav;
	}
	
	@RequestMapping(value="login.cosmetic")
	public String Login() {
		//System.out.println("===LoginFormController");
		return "cocomlogin";
	}
	
	@RequestMapping(value="login.cosmetic", method=RequestMethod.POST)
	public String successLogin(Model model,String mid,String mpw,SignUpVO vo){
		int result = cosmeticserviceimpl.checkLogin(new SignUpVO(mid,mpw));
		//System.out.println(result);
		if(result == 0){
			model.addAttribute("msg", "아이디를 잘못 입력하셨습니다.");
			return "cocomlogin";
		}else if(result == 1){
			model.addAttribute("msg", "비밀번호를 확인해주세요.");
			return "cocomlogin";
		}else{
			model.addAttribute("signupVO", cosmeticserviceimpl.getSingUpVO(mid, mpw));
			return "cocommain";
		}
	
	}
	
	@RequestMapping("logout.cosmetic")
	public String logout(SessionStatus st) {
		st.setComplete();//세션삭제
		return "redirect:/";
	}
	
	@RequestMapping(value = "signup.cosmetic", method=RequestMethod.GET)
	public ModelAndView SignUp(){
		mav.setViewName("cocom_signup");
		return mav;
	}
	
	@RequestMapping(value = "signup.cosmetic" , method=RequestMethod.POST)
	public ModelAndView insertSignUp(Model model, SignUpVO sv){
		System.out.println(sv);
		
		int rtn = cosmeticservice.insertSignUp(sv);
		
		if(rtn == 1) {
			mav.setViewName("cocommain");
			
		} else {
			model.addAttribute("msg", "이미 동일한 ID가 등록되어있습니다.");
			
			mav.setViewName("cocom_signup");
		}
		
		return mav;
	}
	
	@RequestMapping("search.cosmetic")
	public @ResponseBody HashMap<String, List<? extends Object>> goSearch(String sel_condition,String search_val){
		return cosmeticserviceimpl.getMongoList(sel_condition, search_val);
	}
		
	@RequestMapping("board.cosmetic")
	public ModelAndView Community(@RequestParam(value="pageNum", required=false,
			defaultValue="1") int pageNum, @RequestParam(value="recordPerPage", required=false,
			defaultValue="5") int recordPerPage, BoardVO vo) {
		//List<BoardVO> list = cosmeticserviceimpl.getAllBoard();
		PageVO pv = new PageVO(pageNum, recordPerPage);
		ArrayList<PageVO> plist = new ArrayList<PageVO>();
		plist.add(pv);
		List<BoardVO> list = cosmeticserviceimpl.pageBoard(pv);
		int boardcount = cosmeticserviceimpl.countBoard();
		mav.addObject("boardList", list);
		mav.addObject("totcount", list.size());
		mav.addObject("boardcount", boardcount);
		mav.setViewName("cocomboard");
		return mav;
	}
	
	@RequestMapping(value="write.cosmetic", method=RequestMethod.GET)
	public String writeBoard(HttpSession session) {
		if(session.getAttribute("signupVO") == null){
			return "redirect:/";
		}
		return "cocomboard_write";
	}
	
	@RequestMapping(value="write.cosmetic", method=RequestMethod.POST)
	public String submitBoard(BoardVO vo) {
		cosmeticserviceimpl.insertBoard(vo);
		return "redirect:/board.cosmetic";
	}
	
	@RequestMapping("detail.cosmetic")
	public ModelAndView detailBoard(int seq) {
		cosmeticserviceimpl.increaseViewcount(seq);
		BoardVO vo = cosmeticserviceimpl.getOneBoard(seq);
		SignUpVO sv = cosmeticserviceimpl.getSingUpVO(vo.getBwriter());
		mav.addObject("board", vo);
		mav.addObject("writer", sv);
		mav.setViewName("detailboard");
		return mav;
	}
	
	@RequestMapping(value="check.cosmetic", method=RequestMethod.GET)
	public ModelAndView checkBoard(HttpSession session, int seq) {
		mav.addObject("seq", seq);
		mav.setViewName("checkpassword");
		return mav;
	}
	
	@RequestMapping(value="check.cosmetic", method=RequestMethod.POST)
	public ModelAndView checkUpdate(@ModelAttribute(value="bvo") BoardVO bvo) {;
		BoardVO vo = cosmeticserviceimpl.getOneBoard(bvo.getBseq());
		int password = vo.getBpassword();
		if(password == bvo.getBpassword()){
			mav.addObject("boardvo", vo);
			mav.setViewName("updateboard");			
		}
		else{
			mav.addObject("msg","비밀번호를 잘못 입력하셨습니다! 다시 입력해주세요.");
		}
		return mav;
	}
	
	@RequestMapping(value="update.cosmetic", method=RequestMethod.GET)
	public ModelAndView updateBoard(int seq) {
		mav.addObject("seq", seq);
		mav.setViewName("updateboard");
		return mav;
	}
	
	@RequestMapping(value="update.cosmetic", method=RequestMethod.POST)
	public ModelAndView updateSubmit(BoardVO vo) {
		cosmeticserviceimpl.updateBoard(vo);
		mav.addObject("board", vo);
		mav.setViewName("detailboard");
		return mav;
	}
	
	@RequestMapping("delete.cosmetic")
	public String deleteBoard(int seq) {
		cosmeticserviceimpl.deleteBoard(seq);
		return "redirect:/board.cosmetic";
	}
	
	
	@RequestMapping(value="insert.reply")
	public @ResponseBody void insertReply(@ModelAttribute ReplyVO rv,int bseq,HttpSession session) {
		SignUpVO mid = (SignUpVO)session.getAttribute("signupVO");
		rv.setRid(mid.getMid());	
		rv.setBseq(bseq);
		System.out.println(rv);
		cosmeticserviceimpl.insertReply(rv);
	}

    // 댓글 목록(veiw(화면)를 리턴)
    @RequestMapping("list.reply")
    public @ResponseBody List<ReplyVO> list(int seq){
        List<ReplyVO> list = cosmeticserviceimpl.getOneReply(seq);
        return list;
    }
    
    @RequestMapping("delete.reply")
    public @ResponseBody List<ReplyVO> deleteReply(int rnum, int seq){
    	System.out.println("rnum:seq"+rnum+":::"+seq);
    	List<ReplyVO> list = cosmeticserviceimpl.deleteReply(rnum, seq);
        return list;
    }
    
    @RequestMapping("sale.cosmetic")
	public ModelAndView SaleBoard(@RequestParam(value="pageNum", required=false,
			defaultValue="1") int pageNum, @RequestParam(value="recordPerPage", required=false,
			defaultValue="5") int recordPerPage, SaleVO svo) {
		//List<BoardVO> list = cosmeticserviceimpl.getAllBoard();
		PageVO pv = new PageVO(pageNum, recordPerPage);
		ArrayList<PageVO> plist = new ArrayList<PageVO>();
		plist.add(pv);
		List<SaleVO> list = cosmeticserviceimpl.pageSale(pv);
		int salecount = cosmeticserviceimpl.countSale();
		mav.addObject("saleList", list);
		mav.addObject("totcount", list.size());
		mav.addObject("salecount", salecount);
		mav.setViewName("saleboard");
		return mav;
	}
    
    //중고게시판 글쓰기
    @RequestMapping(value="salewrite.cosmetic", method=RequestMethod.GET)
	public String salewriteBoard(HttpSession session) {
		if(session.getAttribute("signupVO") == null){
			return "redirect:/";
		}
		return "salewrite";
	}
	
    //중고게시판 사진 업로드
    @RequestMapping(value="salewrite.cosmetic", method=RequestMethod.POST)
	public String salesubmitBoard(SaleVO sv, @RequestParam("imagefile") MultipartFile file) {
		
		/* file uplaod */
		if (!file.isEmpty()) {
			
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				//String rootPath = System.getProperty("catalina.home");
				File dir = new File("C:\\img"); //이미 생성되어있음.

				// 업로드파일 저장
				//File serverFile = new File(dir.getAbsolutePath());
				
				String uid = UUID.randomUUID().toString(); //물리 파일명
				String fName = file.getOriginalFilename();
				sv.setSimage(fName);
				sv.setPimage(uid);
				
				File saveFile = new File(dir + File.separator + uid);
				file.transferTo(saveFile);
				
				

				//logger.info("Server File Location="
				//		+ serverFile.getAbsolutePath());

				//return "You successfully uploaded file=" + serverFile.getAbsolutePath();
			} catch (Exception e) {
				//return "You failed to upload " + name + " => " + e.getMessage();
				//System.out.print("error");
				e.printStackTrace();
			}
		} else {
			return "You failed to upload  because the file was empty.";
		}
		
		System.out.println(sv);
		/* DB Insert  */
		cosmeticservice.insertSale(sv);
		return "redirect:/sale.cosmetic";
	}
	
    //중고게시판 상세정보
	@RequestMapping("detailsale.cosmetic")
	public ModelAndView detailsaleBoard(int seq) {
		cosmeticserviceimpl.increaseSaleViewcount(seq);
		SaleVO svo = cosmeticserviceimpl.getOneSale(seq);
		SignUpVO sv = cosmeticserviceimpl.getSingUpVO(svo.getSwriter());
		mav.addObject("sale", svo);
		mav.addObject("writer", sv);
		mav.setViewName("saledetail");
		return mav;
	}
	
	//중고게시판 수정
	@RequestMapping(value="updatesale.cosmetic", method=RequestMethod.GET)
	public ModelAndView updateSale(String seq) {
		mav.addObject("seq", seq);
		mav.setViewName("updatesale");
		return mav;
	}

	//중고게시판 수정 사진업로드
	@RequestMapping(value="updatesale.cosmetic", method=RequestMethod.POST)
	public String saleupdateSubmit(SaleVO sv, @RequestParam("updateimagefile") MultipartFile file) {
		
		/* file uplaod */
		if (!file.isEmpty()) {
			
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				//String rootPath = System.getProperty("catalina.home");
				File dir = new File("C:\\img"); //이미 생성되어있음.

				// 업로드파일 저장
				//File serverFile = new File(dir.getAbsolutePath());
				
				String uid = UUID.randomUUID().toString(); //물리 파일명
				String fName = file.getOriginalFilename();
				sv.setSimage(fName);
				sv.setPimage(uid);
				
				File saveFile = new File(dir + File.separator + uid);
				file.transferTo(saveFile);
				
				

				//logger.info("Server File Location="
				//		+ serverFile.getAbsolutePath());

				//return "You successfully uploaded file=" + serverFile.getAbsolutePath();
			} catch (Exception e) {
				//return "You failed to upload " + name + " => " + e.getMessage();
				//System.out.print("error");
				e.printStackTrace();
			}
			cosmeticservice.updateSale(sv);
		} else {
			cosmeticservice.updateSaleNoimage(sv);
		}
		
		System.out.println(sv);
		/* DB Insert  */
		return "redirect:/sale.cosmetic";
	}
	
	/*
	@RequestMapping(value="updatesale.cosmetic", method=RequestMethod.POST)
	public ModelAndView updateSubmit(SaleVO sv) {
		cosmeticservice.updateSale(sv);
		mav.addObject("sale", sv);
		mav.setViewName("saledetail");
		return mav;
	}*/
	
	
	@RequestMapping(value="checkSale.cosmetic", method=RequestMethod.GET)
	public ModelAndView checkSale(HttpSession session, int seq) {
		mav.addObject("seq", seq);
		mav.setViewName("checkSalepassword");
		return mav;
	}
	
	
	@RequestMapping(value="checkSale.cosmetic", method=RequestMethod.POST)
	public ModelAndView checkSaleUpdate(@ModelAttribute(value="svo") SaleVO svo) {;
		SaleVO sv = cosmeticservice.getOneSale(svo.getSseq());
		int password = sv.getSpassword();
		if(password == svo.getSpassword()){
			mav.addObject("salevo", sv);
			mav.setViewName("saleupdate");			
		}
		else{
			mav.addObject("msg","잘못된 비밀번호입니다.");
		}
		return mav;
	}
	
	//중고게시판 글삭제
	@RequestMapping("deletesale.cosmetic")
	public String deleteSale(int seq) {
		cosmeticservice.deleteSale(seq);
		return "redirect:/sale.cosmetic";
	}

}
