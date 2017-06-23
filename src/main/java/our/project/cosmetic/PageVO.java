package our.project.cosmetic;

public class PageVO {
	int pageNum;
	int recordPerPage;
	
	public PageVO(int pageNum, int recordPerPage) {
		super();
		this.pageNum = pageNum;
		this.recordPerPage = recordPerPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getRecordPerPage() {
		return recordPerPage;
	}

	public void setRecordPerPage(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}
	
}
