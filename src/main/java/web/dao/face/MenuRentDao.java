package web.dao.face;

import java.util.List;

import web.dto.Board;
import web.util.Paging;

public interface MenuRentDao {

	public int selectCntAll(Paging param);

	public List<Board> selectAll(Paging paging);

	public void updateHit(Board board);

	public Board selectByBoardNo(Board board);

}
