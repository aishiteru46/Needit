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
	 * 30분마다 예약정보 확인
	 * 
	 * @param book
	 * @return
	 */
	public List<Booking> selectBookList(Booking book);

	public List<Booking> selectBookList();

}
