package com.motherbirds.dao;

import java.util.List;
import com.motherbirds.model.WriterModel;
public interface WriterDao {
	
	String lastcode();	
	
	public List<WriterModel> getList();
	public List<WriterModel> getList(int page);
	public List<WriterModel> getList(int page,String query);
	
	int update(int vote, String code);
	
	int add(WriterModel write);
	WriterModel getWriteModel(String num);
	
	int getSize(String query);
	
	
	int add(String title,String writer, String content,int selectCount,String[] selects,String fileName);
}
