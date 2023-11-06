package web.dto;

public class Category {
	
	private String cateNo;
	private String cateName;
	private String cateKind;

	public Category() {}

	public Category(String cateNo, String cateName, String cateKind) {
		super();
		this.cateNo = cateNo;
		this.cateName = cateName;
		this.cateKind = cateKind;
	}

	@Override
	public String toString() {
		return "Category [cateNo=" + cateNo + ", cateName=" + cateName + ", cateKind=" + cateKind + "]";
	}

	public String getCateNo() {
		return cateNo;
	}

	public void setCateNo(String cateNo) {
		this.cateNo = cateNo;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getCateKind() {
		return cateKind;
	}

	public void setCateKind(String cateKind) {
		this.cateKind = cateKind;
	}
	
	
}
