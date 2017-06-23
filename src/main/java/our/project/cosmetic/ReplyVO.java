package our.project.cosmetic;

public class ReplyVO {
	private int bseq;
	private int rnum;
	private String rcontents;
	private String rid;
	private String rdate;

	@Override
	public String toString() {
		return "ReplyVO [bseq=" + bseq + ", rnum=" + rnum + ", rcontents=" + rcontents + ", rid=" + rid + ", rdate="
				+ rdate + "]";
	}

	public ReplyVO() {
	}

	public ReplyVO(int bseq, int rnum, String rcontents, String rid, String rdate) {
		this.bseq = bseq;
		this.rnum = rnum;
		this.rcontents = rcontents;
		this.rid = rid;
		this.rdate = rdate;
	}

	public int getBseq() {
		return bseq;
	}

	public void setBseq(int bseq) {
		this.bseq = bseq;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getRcontents() {
		return rcontents;
	}

	public void setRcontents(String rcontents) {
		this.rcontents = rcontents;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

}
