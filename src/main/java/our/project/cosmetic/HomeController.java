package our.project.cosmetic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;


@SessionAttributes("signupVO")
@Controller
public class HomeController {
	
	@Autowired
	CosmeticServiceImpl cosmeticservice;
	
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
		int result = cosmeticservice.checkLogin(new SignUpVO(mid,mpw));
		//System.out.println(result);
		if(result == 0){
			model.addAttribute("msg", "아이디를 잘못 입력하셨습니다.");
			return "cocomlogin";
		}else if(result == 1){
			model.addAttribute("msg", "비밀번호를 확인해주세요.");
			return "cocomlogin";
		}else{
			model.addAttribute("signupVO", cosmeticservice.getSingUpVO(mid, mpw));
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
	public String insertSignUp(SignUpVO sv){
		System.out.println(sv);
		cosmeticservice.insertSignUp(sv);
		return "redirect:/";
	}
	
	@RequestMapping("search.cosmetic")
	public @ResponseBody List<CosmeticDTO> goSearch(String sel_condition,String search_val){
		return cosmeticservice.getMongoList(sel_condition, search_val);
	}
		
	@RequestMapping("board.cosmetic")
	public ModelAndView Community(@RequestParam(value="pageNum", required=false,
			defaultValue="1") int pageNum, @RequestParam(value="recordPerPage", required=false,
			defaultValue="5") int recordPerPage, BoardVO vo) {
		//List<BoardVO> list = cosmeticservice.getAllBoard();
		PageVO pv = new PageVO(pageNum, recordPerPage);
		ArrayList<PageVO> plist = new ArrayList<PageVO>();
		plist.add(pv);
		List<BoardVO> list = cosmeticservice.pageBoard(pv);
		int boardcount = cosmeticservice.countBoard();
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
		cosmeticservice.insertBoard(vo);
		return "redirect:/board.cosmetic";
	}
	
	@RequestMapping("detail.cosmetic")
	public ModelAndView detailBoard(int seq) {
		cosmeticservice.increaseViewcount(seq);
		BoardVO vo = cosmeticservice.getOneBoard(seq);
		SignUpVO sv = cosmeticservice.getSingUpVO(vo.getBwriter());
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
		BoardVO vo = cosmeticservice.getOneBoard(bvo.getBseq());
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
		cosmeticservice.updateBoard(vo);
		mav.addObject("board", vo);
		mav.setViewName("detailboard");
		return mav;
	}
	
	@RequestMapping("delete.cosmetic")
	public String deleteBoard(int seq) {
		cosmeticservice.deleteBoard(seq);
		return "redirect:/board.cosmetic";
	}
	
	
	@RequestMapping(value="insert.reply")
	public @ResponseBody void insertReply(@ModelAttribute ReplyVO rv,int bseq,HttpSession session) {
		SignUpVO mid = (SignUpVO)session.getAttribute("signupVO");
		rv.setRid(mid.getMid());	
		rv.setBseq(bseq);
		System.out.println(rv);
		cosmeticservice.insertReply(rv);
	}

    // 댓글 목록(veiw(화면)를 리턴)
    @RequestMapping("list.reply")
    public @ResponseBody List<ReplyVO> list(int seq){
        List<ReplyVO> list = cosmeticservice.getOneReply(seq);
        return list;
    }
    
    @RequestMapping("delete.reply")
    public @ResponseBody List<ReplyVO> deleteReply(int rnum, int seq){
    	System.out.println("rnum:seq"+rnum+":::"+seq);
    	List<ReplyVO> list = cosmeticservice.deleteReply(rnum, seq);
        return list;
    }
    
    @RequestMapping("sale.cosmetic")
	public ModelAndView SaleBoard(@RequestParam(value="pageNum", required=false,
			defaultValue="1") int pageNum, @RequestParam(value="recordPerPage", required=false,
			defaultValue="5") int recordPerPage, SaleVO svo) {
		//List<BoardVO> list = cosmeticservice.getAllBoard();
		PageVO pv = new PageVO(pageNum, recordPerPage);
		ArrayList<PageVO> plist = new ArrayList<PageVO>();
		plist.add(pv);
		List<SaleVO> list = cosmeticservice.pageSale(pv);
		int salecount = cosmeticservice.countSale();
		mav.addObject("saleList", list);
		mav.addObject("totcount", list.size());
		mav.addObject("salecount", salecount);
		mav.setViewName("saleboard");
		return mav;
	}
    
    @RequestMapping(value="salewrite.cosmetic", method=RequestMethod.GET)
	public String salewriteBoard(HttpSession session) {
		if(session.getAttribute("signupVO") == null){
			return "redirect:/";
		}
		return "salewrite";
	}
	
	@RequestMapping(value="salewrite.cosmetic", method=RequestMethod.POST)
	public String salesubmitBoard(SaleVO sv) {
		cosmeticservice.insertSale(sv);
		return "redirect:/sale.cosmetic";
	}
	
	@RequestMapping("detailsale.cosmetic")
	public ModelAndView detailsaleBoard(int seq) {
		cosmeticservice.increaseSaleViewcount(seq);
		SaleVO svo = cosmeticservice.getOneSale(seq);
		SignUpVO sv = cosmeticservice.getSingUpVO(svo.getSwriter());
		mav.addObject("sale", svo);
		mav.addObject("writer", sv);
		mav.setViewName("saledetail");
		return mav;
	}

}
