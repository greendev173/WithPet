package withPet.admin.model.vo;

import java.util.List;

import semi_withPet.model.vo.Member;

public class SearchMemberAjaxPack {
	private List<Member> list;
	private int cPage;
	private int numPerPage;
	private String pageBar;
	
	public SearchMemberAjaxPack() {
		// TODO Auto-generated constructor stub
	}

	public SearchMemberAjaxPack(List<Member> list, int cPage, int numPerPage, String pageBar) {
		super();
		this.list = list;
		this.cPage = cPage;
		this.numPerPage = numPerPage;
		this.pageBar = pageBar;
	}

	public List<Member> getList() {
		return list;
	}

	public void setList(List<Member> list) {
		this.list = list;
	}

	public int getcPage() {
		return cPage;
	}

	public void setcPage(int cPage) {
		this.cPage = cPage;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public String getPageBar() {
		return pageBar;
	}

	public void setPageBar(String pageBar) {
		this.pageBar = pageBar;
	}
	
	
}
