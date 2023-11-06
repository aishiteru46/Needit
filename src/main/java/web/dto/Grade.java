package web.dto;

public class Grade {
	
	private String grade;
	private String gradeName;

	public Grade() {}

	public Grade(String grade, String gradeName) {
		super();
		this.grade = grade;
		this.gradeName = gradeName;
	}

	@Override
	public String toString() {
		return "Grade [grade=" + grade + ", gradeName=" + gradeName + "]";
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	
	
}
