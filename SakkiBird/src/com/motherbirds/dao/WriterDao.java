package com.motherbirds.dao;

import java.util.List;
import com.motherbirds.model.WriterModel;
public interface WriterDao {
	public List<WriterModel> getList();
	public List<WriterModel> getList(int page);
	public List<WriterModel> getList(int page,String query);
	int add(WriterModel write);
	WriterModel getWriteModel(int num);
	
	int getSize(String query);
}
