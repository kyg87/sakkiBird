package com.motherbirds.model;

import java.util.Date;

public class BoardCommentModel {
	
	private int commentNum;
	private int commentParent;
	private String commentWriter;
	private String commentContent;
	private Date commentRegdate;
	private int commentHit;
	private String commentImgAdr;
	private int commentArticleNum;
	private String commentCode; 
	
	
	

	public String getCommentCode() {
		return commentCode;
	}

	public void setCommentCode(String commentCode) {
		this.commentCode = commentCode;
	}

	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public int getCommentParent() {
		return commentParent;
	}
	public void setCommentParent(int commentParent) {
		this.commentParent = commentParent;
	}
	public String getCommentWriter() {
		return commentWriter;
	}
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getCommentRegdate() {
		return commentRegdate;
	}
	public void setCommentRegdate(Date commentRegdate) {
		this.commentRegdate = commentRegdate;
	}
	public int getCommentHit() {
		return commentHit;
	}
	public void setCommentHit(int commentHit) {
		this.commentHit = commentHit;
	}
	public String getCommentImgAdr() {
		return commentImgAdr;
	}
	public void setCommentImgAdr(String commentImgAdr) {
		this.commentImgAdr = commentImgAdr;
	}
	public int getCommentArticleNum() {
		return commentArticleNum;
	}
	public void setCommentArticleNum(int commentArticleNum) {
		this.commentArticleNum = commentArticleNum;
	}	
	
	
}
