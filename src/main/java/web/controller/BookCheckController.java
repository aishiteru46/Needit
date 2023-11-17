package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import web.service.face.MenuShareFace;

@Component
@Configuration
@EnableScheduling
@Scope(value = "request", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class BookCheckController {

    private final MenuShareFace menuShareFace;

    @Autowired
    public BookCheckController(MenuShareFace menuShareFace) {
        this.menuShareFace = menuShareFace;
    }

    @Scheduled(cron = "0/5 * * * * *")
    public void bookStatus() {
        // BookService의 메소드 호출
    	menuShareFace.bookStatus();
    }
}