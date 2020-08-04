package model;

import java.sql.Date;

public class Queue {
	private int num;
	private String s_name;
	private String g_name;
	private int pnum;
	private Date r_date;
	
	public Queue() {}
	public Queue(int num, String s_name, String g_name, int pnum, Date r_date) {
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
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	@Override
	public String toString() {
		return "Queue [num=" + num + ", s_name=" + s_name + ", g_name=" + g_name + ", pnum=" + pnum + ", r_date="
				+ r_date + "]";
	}
	
	
}
