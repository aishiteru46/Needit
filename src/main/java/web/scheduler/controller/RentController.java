package web.scheduler.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import web.scheduler.service.face.RentService;


@Controller
@Component
public class RentController {

    @Autowired
    private RentService rentService;

    @GetMapping("/cancelOverdueReservations")
    public String cancelOverdueReservations() {
        rentService.updateReservationStatus();
        return "redirect:/"; // 적절한 리다이렉션 URL로 변경해주세요.
    }
}