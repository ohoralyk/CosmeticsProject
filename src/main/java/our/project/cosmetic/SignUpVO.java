package our.project.cosmetic;

import org.springframework.stereotype.Repository;

@Repository("signupVO")
public class SignUpVO {
	
	private String mid;
	private String mpw;
	private String mgender;
	private String mage;
	private String mtype;
	private String mdisease;
	
	@Override
	public String toString() {
		return "SignUpVO [mid=" + mid + ", mpw=" + mpw + ", mgender=" + mgender + ", mage=" + mage
				+ ", mtype=" + mtype + ", mdisease=" + mdisease + "]";
	}

	public SignUpVO() {
		super();
	}
	
	public SignUpVO(String mid, String mpw) {
		super();
		this.mid = mid;
		this.mpw = mpw;
	}
	

	public SignUpVO(String mid) {
		super();
		this.mid = mid;
	}


	public SignUpVO(String mid, String mpw, String mgender, String mage, String mtype,
			String mdisease) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mgender = mgender;
		this.mage = mage;
		this.mtype = mtype;
		this.mdisease = mdisease;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public String getMage() {
		return mage;
	}

	public void setMage(String mage) {
		this.mage = mage;
	}

	public String getMtype() {
		return mtype;
	}

	public void setMtype(String mtype) {
		this.mtype = mtype;
	}

	public String getMdisease() {
		return mdisease;
	}

	public void setMdisease(String mdisease) {
		this.mdisease = mdisease;
	}

	
}
