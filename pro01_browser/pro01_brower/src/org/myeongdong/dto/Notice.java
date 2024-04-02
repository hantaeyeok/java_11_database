package org.myeongdong.dto;

public class Notice {
	private int no;
	private String title;
	private String content;
	private String resdate;
	private String visited;
	
	public Notice() {}
	public Notice(int no, String title, String content, String resdate, String visited) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.resdate = resdate;
		this.visited = visited;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getResdate() {
		return resdate;
	}
	public void setResdate(String resdate) {
		this.resdate = resdate;
	}
	public String getVisited() {
		return visited;
	}
	public void setVisited(String visited) {
		this.visited = visited;
	}
	@Override
	public String toString() {
		return "Notice [no=" + no + ", title=" + title + ", content=" + content + ", resdate=" + resdate + ", visited="
				+ visited + "]";
	}
	
	
}
