package com.motherbirds.dao;

import java.util.List;

import com.motherbirds.model.BoardWriteFile;

public interface BoardWriteFileDao {

	List<BoardWriteFile> getList(String boardCode);
	
	int add(BoardWriteFile file);
	int add(String src, String boardCode);
	
}
