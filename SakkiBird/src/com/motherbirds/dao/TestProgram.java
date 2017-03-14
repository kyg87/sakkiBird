package com.motherbirds.dao;

import java.util.List;

import com.motherbirds.model.MemberModel;

public class TestProgram {

	public static void main(String[] args) {

	  MemberDAO member = new MemberDAO();
			List<MemberModel> list = member.getList();
			
			for(MemberModel M : list)
				System.out.println(M.getEMAIL());

	}

}
