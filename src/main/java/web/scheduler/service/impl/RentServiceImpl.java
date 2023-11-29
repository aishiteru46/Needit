package web.scheduler.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dto.Rent;
import web.scheduler.dao.dao.RentDao;
import web.scheduler.service.face.RentService;

@Service
public class RentServiceImpl implements RentService {

    @Autowired
    private RentDao rentDao;

    @Override
    public void updateReservationStatus() {
        long currentTime = System.currentTimeMillis();
        List<Rent> overdueReservations = rentDao.findOverdueReservations(currentTime);

        for (Rent reservation : overdueReservations) {
            reservation.setRentStatus(0); // 취소 상태로 업데이트
            rentDao.updateReservationStatus(reservation);
            System.out.println("Reservation canceled. ID: " + reservation.getRenterId());
        }
    }
}