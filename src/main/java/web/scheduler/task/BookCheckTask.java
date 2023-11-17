package web.scheduler.task;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.Setter;
import web.dto.Booking;
import web.scheduler.dao.BookCheckDao;

@Component // 자동생성 - servlet- context.xml에 base패키지로 정의 되야함
public class BookCheckTask {
	
	//로그 객체 
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Setter(onMethod_ = {@Autowired})
	private BookCheckDao bookCheckDao;
	
	@Scheduled(cron = "0/3 * * * * *")
	public void bookList () throws Exception {
		logger.info("book check Task Run....................");
		
		List<Booking> bookList = bookCheckDao.selectBookList();
		logger.info("{}",bookList);
		
		logger.info("======================");
	}
	

}
