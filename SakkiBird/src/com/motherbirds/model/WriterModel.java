package com.motherbirds.model;

import java.util.Date;

public class WriterModel {
	private int Num;
	private String Title;
	private String Writer;
	private Date RegDate;
	private Date EndDate;
	private String Content;
	private String Content_first_choice;
	private int Content_voterate1;
	private String Content_second_choice;
	private int Content_voterate2;
	private String Content_third_choice;
	private int Content_voterate3;
	private String Content_fourth_choice;
	private int Content_voterate4;
	private String Content_fifth_choice;
	private int Content_voterate5;
	private int Hit;
	private String Content_vote;
	private String Content_img;
	
	public String getContent_vote() {
		return Content_vote;
	}
	public void setContent_vote(String Content_vote) {
		Content_vote = Content_vote;
	}
	public String getContent_img() {
		return Content_img;
	}
	public void setContent_img(String Content_img) {
		Content_img = Content_img;
	}
	public String getContent_first_choice() {
		return Content_first_choice;
	}
	public void setContent_first_choice(String Content_first_choice) {
		Content_first_choice = Content_first_choice;
	}
	public String getContent_second_choice() {
		return Content_second_choice;
	}
	public void setContent_second_choice(String Content_second_choice) {
		Content_second_choice = Content_second_choice;
	}
	public String getContent_third_choice() {
		return Content_third_choice;
	}
	public void setContent_third_choice(String Content_third_choice) {
		Content_third_choice = Content_third_choice;
	}
	public String getContent_fourth_choice() {
		return Content_fourth_choice;
	}
	public void setContent_fourth_choice(String Content_fourth_choice) {
		Content_fourth_choice = Content_fourth_choice;
	}
	public String getContent_fifth_choice() {
		return Content_fifth_choice;
	}
	public void setContent_fifth_choice(String Content_fifth_choice) {
		Content_fifth_choice = Content_fifth_choice;
	}
	
	public int getContent_voterate1() {
		return Content_voterate1;
	}
	public void setContent_voterate1(int Content_voterate1) {
		Content_voterate1 = Content_voterate1;
	}
	public int getContent_voterate2() {
		return Content_voterate2;
	}
	public void setContent_voterate2(int Content_voterate2) {
		Content_voterate2 = Content_voterate2;
	}
	public int getContent_voterate3() {
		return Content_voterate3;
	}
	public void setContent_voterate3(int Content_voterate3) {
		Content_voterate3 = Content_voterate3;
	}
	public int getContent_voterate4() {
		return Content_voterate4;
	}
	public void setContent_voterate4(int Content_voterate4) {
		Content_voterate4 = Content_voterate4;
	}
	public int getContent_voterate5() {
		return Content_voterate5;
	}
	public void setContent_voterate5(int Content_voterate5) {
		Content_voterate5 = Content_voterate5;
	}

	
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
	public String getContent() {
		return Content;
	}
	public void setContent(String Content) {
		Content = Content;
	}

	public int getHit() {
		return Hit;
	}
	public void setHit(int hit) {
		Hit = hit;
	}
	
}
