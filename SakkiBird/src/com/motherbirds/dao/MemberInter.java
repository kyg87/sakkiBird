package com.motherbirds.dao;

import java.util.List;

import com.motherbirds.model.MemberModel;

public interface MemberInter {
	public List<MemberModel> getList();
	public void ADD(MemberModel member);
	public int add(String email,String pw,String user);
	public MemberModel get(String email,String pw);
	
	
}
