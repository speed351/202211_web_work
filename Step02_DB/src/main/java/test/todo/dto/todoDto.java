package test.todo.dto;

import java.sql.Date;

public class todoDto {
	private int num;
	private String content;
	private String date;
	
	public todoDto() {
	
	}
	
	public todoDto(int num, String content, String date) {
		super();
		this.num = num;
		this.content = content;
		this.date = date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}
