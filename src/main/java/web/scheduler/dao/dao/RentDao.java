package web.scheduler.dao.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

import web.dto.Rent;

@Configuration
@MapperScan(basePackages = "web.scheduler.dao.mapper")
public interface RentDao {
    public List<Rent> findOverdueReservations(long currentTime);
    public void updateReservationStatus(Rent reservation);
}