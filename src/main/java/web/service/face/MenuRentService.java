package web.service.face;

import web.util.Paging;

public interface MenuRentService {

	public Paging getPaging(Paging param);

	public void list(Paging param);

}
