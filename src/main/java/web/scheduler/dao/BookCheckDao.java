package web.scheduler.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import web.dto.Booking;

@Service
@Mapper
public interface BookCheckDao {
	
	
	
	/**
	 * 30분 마다 book_status가 1인 예약정보
	 * 0으로 update
	 * @return 
	 * 
	 */
	public int update();

}
