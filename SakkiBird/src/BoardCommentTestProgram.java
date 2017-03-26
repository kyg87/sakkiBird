import java.util.List;

import com.motherbirds.dao.BoardCommentDAO;
import com.motherbirds.model.BoardCommentModel;

public class BoardCommentTestProgram {

	public static void main(String[] args) {
		
		BoardCommentDAO bcdao = new BoardCommentDAO();
/*		List<BoardCommentModel> list = bcdao.getList();
		
		
		System.out.printf("No.	Writer		Content		Hit		RegDate		ParentNum	ImageAddress\n");
		System.out.print("-----------------------------------------------------------------------------------"
				+ "------------------------------------\n");
		
		for(BoardCommentModel bc:list)
			
			System.out.printf("%d	%s	%s		%d		%s		%d	%s\n", bc.getCommentNum(),bc.getCommentWriter(), bc.getCommentContent(),
					bc.getCommentHit(), bc.getCommentRegdate(), bc.getCommentParent(), bc.getCommentImgAdr());*/

	}

}
