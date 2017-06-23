package our.project.cosmetic;

import java.util.List;

import our.project.cosmetic.BoardVO;

public interface CosmeticService {

	public void insertSignUp(SignUpVO sv);
	public int checkLogin(SignUpVO sv);
	public SignUpVO getSingUpVO(String mid,String mpw);
	public SignUpVO getSingUpVO(String mid);
	public List<CosmeticDTO> getMongoList(String sel_condition, String search_val);
	public List<BoardVO> getAllBoard();
	public void insertBoard(BoardVO vo);
	public BoardVO getOneBoard(int seq);
	public void increaseViewcount(int seq);
	public List<BoardVO> pageBoard(PageVO pv);
	public int countBoard();
	public BoardVO updateBoard(BoardVO vo);
	public void deleteBoard(int seq);
	public void insertReply(ReplyVO rv);
	public List<ReplyVO> getOneReply(int seq);
	public List<ReplyVO> deleteReply(int rnum, int seq);
	public List<SaleVO> getAllSale();
	public List<SaleVO> pageSale(PageVO pv);
	public int countSale();
	public void insertSale(SaleVO sv);
	public SaleVO getOneSale(int seq);
	public void increaseSaleViewcount(int seq);

}