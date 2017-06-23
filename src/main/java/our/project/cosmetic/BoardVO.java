package our.project.cosmetic;

import org.springframework.stereotype.Repository;

@Repository("cocomboardVO")
public class BoardVO {
	private int bseq;
	private String btitle;
	private String bcontents;
	private String bwriter;
	private String btime;
	private int bpassword;
	private int viewcount;
	
	public BoardVO(){}
	
	
	
	public BoardVO(int bseq, String btitle, String bcontents, String bwriter, String btime, int bpassword,
			int viewcount) {
		super();
		this.bseq = bseq;
		this.btitle = btitle;
		this.bcontents = bcontents;
		this.bwriter = bwriter;
		this.btime = btime;
		this.bpassword = bpassword;
		this.viewcount = viewcount;
	}

	public int getBseq() {
		return bseq;
	}

	public void setBseq(int bseq) {
		this.bseq = bseq;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontents() {
		return bcontents;
	}

	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getBtime() {
		return btime;
	}

	public void setBtime(String btime) {
		this.btime = btime;
	}

	public int getBpassword() {
		return bpassword;
	}

	public void setBpassword(int bpassword) {
		this.bpassword = bpassword;
	}

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	@Override
	public String toString() {
		return "BoardVO [bseq=" + bseq + ", btitle=" + btitle + ", bcontents=" + bcontents + ", bwriter=" + bwriter
				+ ", btime=" + btime + ", bpassword=" + bpassword + ", viewcount=" + viewcount + "]";
	}
	
	
}
