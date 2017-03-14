package com.motherbirds.model;

import java.util.Date;

public class WriterModel {
	private int Num;
	private String Title;
	private String Writer;
	private Date RegDate;
	private Date EndDate;
	private String Context;
	private String Context_vote1;
	private String Context_vote2;
	private String Context_vote3;
	private String Context_vote4;
	private String Context_vote5;
	private int Hit;
	
	public int getNum() {
		return Num;
	}
	public void setNum(int num) {
		Num = num;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getWriter() {
		return Writer;
	}
	public void setWriter(String writer) {
		Writer = writer;
	}
	public Date getRegDate() {
		return RegDate;
	}
	public void setRegDate(Date regdate) {
		RegDate = regdate;
	}
	public Date getEndDate() {
		return EndDate;
	}
	public void setEndDate(Date enddate) {
		EndDate = enddate;
	}
	public String getContext() {
		return Context;
	}
	public void setContext(String context) {
		Context = context;
	}
	public String getContext_vote1() {
		return Context_vote1;
	}
	public void setContext_vote1(String context_vote1) {
		Context_vote1 = context_vote1;
	}
	public String getContext_vote2() {
		return Context_vote2;
	}
	public void setContext_vote2(String context_vote2) {
		Context_vote2 = context_vote2;
	}
	public String getContext_vote3() {
		return Context_vote3;
	}
	public void setContext_vote3(String context_vote3) {
		Context_vote3 = context_vote3;
	}
	public String getContext_vote4() {
		return Context_vote4;
	}
	public void setContext_vote4(String context_vote4) {
		Context_vote4 = context_vote4;
	}
	public String getContext_vote5() {
		return Context_vote5;
	}
	public void setContext_vote5(String context_vote5) {
		Context_vote5 = context_vote5;
	}
	public int getHit() {
		return Hit;
	}
	public void setHit(int hit) {
		Hit = hit;
	}
	
}
