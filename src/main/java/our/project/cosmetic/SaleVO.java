package our.project.cosmetic;

import org.springframework.web.multipart.MultipartFile;

public class SaleVO {
	private int sseq;
	private String stitle;
	private String scontents;
	private String swriter;
	private String stime;
	private int spassword;
	private int sviewcount;
	MultipartFile imagefile;
	private String simage;
	
	public SaleVO() {}

	public SaleVO(int sseq, String stitle, String scontents, String swriter, String stime, int spassword,
			int sviewcount, String simage) {
		this.sseq = sseq;
		this.stitle = stitle;
		this.scontents = scontents;
		this.swriter = swriter;
		this.stime = stime;
		this.spassword = spassword;
		this.sviewcount = sviewcount;
		this.simage = simage;
	}
	
	public MultipartFile getImagefile() {
		return imagefile;
	}
	public void setImagefile(MultipartFile imagefile) {
		this.imagefile = imagefile;
		setSimage(imagefile.getOriginalFilename());
	}
	
	public int getSseq() {
		return sseq;
	}
	public void setSseq(int sseq) {
		this.sseq = sseq;
	}
	public String getStitle() {
		return stitle;
	}
	public void setStitle(String stitle) {
		this.stitle = stitle;
	}
	public String getScontents() {
		return scontents;
	}
	public void setScontents(String scontents) {
		this.scontents = scontents;
	}
	public String getSwriter() {
		return swriter;
	}
	public void setSwriter(String swriter) {
		this.swriter = swriter;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public int getSpassword() {
		return spassword;
	}
	public void setSpassword(int spassword) {
		this.spassword = spassword;
	}
	public int getSviewcount() {
		return sviewcount;
	}
	public void setSviewcount(int sviewcount) {
		this.sviewcount = sviewcount;
	}
	public String getSimage() {
		return simage;
	}
	public void setSimage(String simage) {
		this.simage = simage;
	}

	@Override
	public String toString() {
		return "SaleVO [sseq=" + sseq + ", stitle=" + stitle + ", scontents=" + scontents + ", swriter=" + swriter
				+ ", stime=" + stime + ", spassword=" + spassword + ", sviewcount=" + sviewcount + ", simage=" + simage
				+ "]";
	}

}
