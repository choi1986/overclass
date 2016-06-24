package kr.co.overclass.dto;

public class ReportDTO {
	private int dno;
	private String writer;
	private String content;
	private String tag;
	private String image;
	private String mapXY;
	private String mapLoc;
	private int goodcnt;
	private String user_image;
	private int reportno;
	private String report_content;
	private String reporter;
	private String reportdate;
	private int report_stack;
	
	public ReportDTO() {
		image = "";
	}
	
	@Override
	public String toString() {
		return "[�۹�ȣ: "+dno
				+", �ۼ���: "+writer
				+", �۳���: "+content
				+", �±�: "+tag
				+", ����: "+image
				+", ���ƿ䰳��: "+goodcnt
				+", �����ʻ���: "+user_image
				+", �Ű��ȣ: "+reportno
				+", �Ű����: "+report_content
				+", �Ű���: "+reporter
				+", �Ű�ó������: "+reportdate
				+", �Ű���Ƚ��: "+report_content
				+"]";
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	public String getMapXY() {
		return mapXY;
	}

	public void setMapXY(String mapXY) {
		this.mapXY = mapXY;
	}

	public String getMapLoc() {
		return mapLoc;
	}

	public void setMapLoc(String mapLoc) {
		this.mapLoc = mapLoc;
	}

	public int getGoodcnt() {
		return goodcnt;
	}

	public void setGoodcnt(int goodcnt) {
		this.goodcnt = goodcnt;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public int getReportno() {
		return reportno;
	}

	public void setReportno(int reportno) {
		this.reportno = reportno;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getReportdate() {
		return reportdate;
	}

	public void setReportdate(String reportdate) {
		this.reportdate = reportdate;
	}
	
	public int getReport_stack() {
		return report_stack;
	}

	public void setReport_stack(int report_stack) {
		this.report_stack = report_stack;
	}
}
