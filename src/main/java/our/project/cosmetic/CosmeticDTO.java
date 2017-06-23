package our.project.cosmetic;

import java.util.ArrayList;

public class CosmeticDTO {
	
	private String cosname;
	private int cosno;
	private String company;
	private String category;
	private ArrayList<String> ingredient;
	
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public ArrayList<String> getIngredient() {
		return ingredient;
	}
	public void setIngredient(ArrayList<String> ingredient) {
		this.ingredient = ingredient;
	}
	public String getCosname() {
		return cosname;
	}
	public void setCosname(String cosname) {
		this.cosname = cosname;
	}
	public int getCosno() {
		return cosno;
	}
	public void setCosno(int cosno) {
		this.cosno = cosno;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
	

}
