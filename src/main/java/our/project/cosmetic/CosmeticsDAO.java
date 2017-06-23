package our.project.cosmetic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;


@Repository("cosmeticsDAO")
public class CosmeticsDAO<seq> {
	
	@Autowired
	SqlSession session;
	@Autowired
	MongoTemplate mongoTemplate;
	
	public void insertSignup(SignUpVO sv){
		session.insert("signup.insertSignup", sv);
	}
	
	public int checkLogin(SignUpVO sv){
		String checkId = session.selectOne("signup.checkId",sv.getMid());
		if(checkId != null){
			HashMap<String, String> para = new HashMap<String,String>();
			para.put("id", sv.getMid());
			para.put("pw", sv.getMpw());
			String checkPw = session.selectOne("signup.checkPw", para);
			if(checkPw != null){
				return 2; // 로그인
			}else {
				return 1; // ID와 PW가 모두 틀림.
			}
		}else{
			return 0; // ID가 틀림
		}
	}

	public SignUpVO getSingUpVO(String mid, String mpw) {
		return session.selectOne("signup.getSignupvo", new SignUpVO(mid,mpw));
	}
	
	public SignUpVO getSingUpVO(String mid) {
		return session.selectOne("signup.getSignupvo", mid);
	}
	
	//검색 출력값 
	//.regex("*"+search_val+"*")) -> sql like 와 같음 
	//.is() -> 검색결과만 확인 
	public List<CosmeticDTO> getMongoList(String sel_condition, String search_val){
		System.out.println(sel_condition);
		if(sel_condition.equals("브랜드")){
			sel_condition = "company";
		}else if(sel_condition.equals("제품명")){
			sel_condition = "cosname";
		}
//		else if(sel_condition.equals("종류")){
//			sel_condition = "category";
//		}
//		String val = "/"+search_val+"/";
		List<CosmeticDTO> test = mongoTemplate.find(new Query(Criteria.where(sel_condition).is(search_val)), CosmeticDTO.class, "cosmetics");
		for(CosmeticDTO a : test){
			System.out.println(a.getCosname());
		}
		
		return test;
	}

	
	public List<BoardVO> getAllBoard(){
		return session.selectList("board.allBoard");
	}
	
	public void insertBoard(BoardVO vo){
		session.insert("board.insertBoard", vo);
	}
	
	public BoardVO getOneBoard(int seq) {
		BoardVO vo = session.selectOne("board.oneBoard", seq);
		return vo;
	}
	
	public int getViewcount(int seq) {
		return session.selectOne("board.countBoard", seq);
	}

	public void increaseViewcount(int seq) {
		session.update("board.updateViewcount", seq);
	}
	
	public List<BoardVO> boardPage(PageVO pv) {
		int pageNum = pv.getPageNum()*pv.getRecordPerPage()-pv.getRecordPerPage()+1;
		int recordPerPage = pv.getPageNum()*pv.getRecordPerPage();
		PageVO pv1 = new PageVO(pageNum, recordPerPage);
		return session.selectList("board.pageBoard", pv1);
	}
	
	public int countBoard() {
		return session.selectOne("board.count");
	}
	
	public BoardVO updateBoard(BoardVO vo) {
		return session.selectOne("board.updateBoard", vo);
	}

	public void deleteBoard(int seq) {
		session.selectOne("board.deleteBoard", seq);
	}
	
	public void insertReply(ReplyVO rv) {
		session.insert("reply.insertReply", rv);
	}
	
	public List<ReplyVO> getOneReply(int seq) {
		return session.selectList("reply.oneReply", seq);
	}
	
	public List<ReplyVO> deleteReply(int rnum, int seq) {
		session.delete("reply.deleteReply", rnum);
		return session.selectList("reply.oneReply", seq);
	}
	
	public List<SaleVO> getallSale() {
		return session.selectList("sale.allSale");
	}
	
	public List<SaleVO> salePage(PageVO pv) {
		int pageNum = pv.getPageNum()*pv.getRecordPerPage()-pv.getRecordPerPage()+1;
		int recordPerPage = pv.getPageNum()*pv.getRecordPerPage();
		PageVO pv1 = new PageVO(pageNum, recordPerPage);
		return session.selectList("sale.pageSale", pv1);
	}
	
	public int countSale() {
		return session.selectOne("sale.count");
	}
	
	public void insertSale(SaleVO sv) {
		session.insert("sale.insertSale", sv);
	}
	
	public SaleVO getOneSale(int seq) {
		SaleVO sv = session.selectOne("sale.oneSale", seq);
		return sv;
	}
	
	public void increaseSaleViewcount(int seq) {
		session.update("sale.updateViewcount", seq);
	}
}