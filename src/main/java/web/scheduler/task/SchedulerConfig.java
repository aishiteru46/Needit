package web.scheduler.task;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

@Configuration
public class SchedulerConfig {
	
	@Bean
    public ThreadPoolTaskScheduler taskScheduler() {
        ThreadPoolTaskScheduler taskScheduler = new ThreadPoolTaskScheduler();
        taskScheduler.setPoolSize(10); // 스레드 풀 크기 설정
        taskScheduler.setThreadNamePrefix("MyScheduler-"); // 스레드 이름 접두사 설정
        return taskScheduler;
    }

}
