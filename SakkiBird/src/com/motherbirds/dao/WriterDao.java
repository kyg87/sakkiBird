package com.motherbirds.dao;

import java.util.List;
import com.motherbirds.model.WriterModel;
public interface WriterDao {
	
	String lastcode();	
	
	public List<WriterModel> getList();
	public List<WriterModel> getList(int page);
	public List<WriterModel> getList(int page,String query);
	
	int update(int vote, String code);
	int voteAdd(String code,String userName);
	Boolean isVote(String articleNum,String userName);
	int add(WriterModel write);
	WriterModel getWriteModel(String num);
	
	int getSize(String query);
	int hit(String code);
	
	int add(String title,String writer, String content,int selectCount,String[] selects,String fileName);
}
