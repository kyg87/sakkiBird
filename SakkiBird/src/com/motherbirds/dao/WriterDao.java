package com.motherbirds.dao;

import java.util.List;
import com.motherbirds.model.WriterModel;
public interface WriterDao {
	public List<WriterModel> getList(String query);
	int add(WriterModel write);
}
