package model;


public class Log {
	private int num;
	private String s_name;
	private String g_name;
	private int pnum;
	private String r_date;
	
	public Log() {}
	public Log(int num, String s_name, String g_name, int pnum, String r_date) {
		super();
		this.num = num;
		this.s_name = s_name;
		this.g_name = g_name;
		this.pnum = pnum;
		this.r_date = r_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	@Override
	public String toString() {
		return "Log [num=" + num + ", s_name=" + s_name + ", g_name=" + g_name + ", pnum=" + pnum + ", r_date=" + r_date
				+ "]";
	}
	

}
