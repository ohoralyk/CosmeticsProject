package our.project.cosmetic;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cosmeticservice")
public class CosmeticServiceImpl implements CosmeticService{

	@Autowired
	CosmeticsDAO<?> dao;

	@Override
	public void insertSignUp(SignUpVO sv) {
		dao.insertSignup(sv);
	}

	@Override
	public int checkLogin(SignUpVO sv) {
		return dao.checkLogin(sv);
	}

	@Override
	public SignUpVO getSingUpVO(String mid, String mpw) {
		return dao.getSingUpVO(mid,mpw);
	}

	@Override
	public SignUpVO getSingUpVO(String mid) {
		return dao.getSingUpVO(mid);
	}

	@Override
	public HashMap<String, List<? extends Object>> getMongoList(String sel_condition, String search_val) {
		HashMap<String,List<? extends Object>> data = new HashMap<String,List<? extends Object>>();
		data.put("list", dao.getMongoList(sel_condition, search_val));
		data.put("checklist",dao.getMongoListCategory(search_val));
		data.put("inglist", dao.getIngredientList());
		return data;
	}	

	@Override
	public List<BoardVO> getAllBoard() {
		return dao.getAllBoard();
	}

	@Override
	public void insertBoard(BoardVO vo) {
		dao.insertBoard(vo);
	}

	@Override
	public BoardVO getOneBoard(int seq) {
		return dao.getOneBoard(seq);
	}

	@Override
	public void increaseViewcount(int seq) {
		dao.increaseViewcount(seq);
	}

	@Override
	public List<BoardVO> pageBoard(PageVO pv) {
		return dao.boardPage(pv);
	}

	@Override
	public int countBoard() {
		return dao.countBoard();
	}

	@Override
	public BoardVO updateBoard(BoardVO vo) {
		return dao.updateBoard(vo);
	}

	@Override
	public void deleteBoard(int seq) {
		dao.deleteBoard(seq);
	}

	@Override
	public void insertReply(ReplyVO rv) {
		dao.insertReply(rv);
	}

	@Override
	public List<ReplyVO> getOneReply(int seq) {
		return dao.getOneReply(seq);
	}
	
	@Override
	public List<ReplyVO> deleteReply(int rnum, int seq) {
		return dao.deleteReply(rnum, seq);
	}

	@Override
	public List<SaleVO> getAllSale() {
		return dao.getallSale();
	}

	@Override
	public List<SaleVO> pageSale(PageVO pv) {
		return dao.salePage(pv);
	}

	@Override
	public int countSale() {
		return dao.countSale();
	}

	@Override
	public void insertSale(SaleVO sv) {
		dao.insertSale(sv);
	}

	@Override
	public SaleVO getOneSale(int seq) {
		return dao.getOneSale(seq);
	}

	@Override
	public void increaseSaleViewcount(int seq) {
		dao.increaseSaleViewcount(seq);
	}
	
	@Override
	public SaleVO updateSale(SaleVO sv) {
		return dao.updateSale(sv);
	}

	@Override
	public void deleteSale(int seq) {
		dao.deleteSale(seq);
	}

	@Override
	public SaleVO updateSaleNoimage(SaleVO sv) {
		return dao.updateSaleNoimage(sv);
	}
	
}
