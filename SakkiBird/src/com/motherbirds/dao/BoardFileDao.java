package com.motherbirds.dao;

import java.util.List;

import com.motherbirds.model.BoardFile;

public interface BoardFileDao {

	List<BoardFile> getList(String boardCode);
	
	int add(BoardFile file);
	int add(String src, String boardCode);
	
}
