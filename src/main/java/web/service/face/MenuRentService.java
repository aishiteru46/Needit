package web.service.face;

import java.util.List;

import web.dto.Board;
import web.util.Paging;

public interface MenuRentService {
	
	public Paging getPaging(Paging param);

	public List<Board> list(Paging paging);

	public Board view(Board board);

}
