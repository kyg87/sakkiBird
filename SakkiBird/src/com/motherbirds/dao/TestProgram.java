package com.motherbirds.dao;

import java.util.List;

import com.motherbirds.model.MEMBERMODEL;

public class TestProgram {

	public static void main(String[] args) {

	  MemberDAO member = new MemberDAO();
			List<MEMBERMODEL> list = member.getList();
			
			for(MEMBERMODEL M : list)
				System.out.println(M.getEMAIL());

	}

}
