package kr.co.overclass.domain;

import java.util.Date;

public class ReportVO {
	private int reportno;
	private String reporter;
	private int dno;
	private String content;
	private Date reportdate;
	public ReportVO() {
		reportno = 0;
		reportdate = new Date();
	}
	
	@Override
	public String toString() {
		return "[신고번호: "+reportno+", 신고자: "+reporter+", 글번호: "+dno+", 신고내용: "+content+", 신고처리일자: "+reportdate+"]";
	}

	public int getReportno() {
		return reportno;
	}

	public void setReportno(int reportno) {
		this.reportno = reportno;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReportdate() {
		return reportdate;
	}

	public void setReportdate(Date reportdate) {
		this.reportdate = reportdate;
	}
}
