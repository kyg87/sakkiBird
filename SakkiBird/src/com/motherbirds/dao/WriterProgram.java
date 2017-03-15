package com.motherbirds.dao;

import java.util.List;

import com.motherbirds.model.WriterModel;

public class WriterProgram {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		WriterDao writer= new MYSQLWriter();
		List<WriterModel> list = writer.getList("");
		
		for (WriterModel w : list){
			System.out.println(w.getTitle());
			System.out.println(w.getRegDate());
			
		}
	}

}
