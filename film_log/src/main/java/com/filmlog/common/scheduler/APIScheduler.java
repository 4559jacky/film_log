package com.filmlog.common.scheduler;

import static org.quartz.CronScheduleBuilder.cronSchedule;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;

import org.quartz.CronTrigger;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;

public class APIScheduler extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	// Quartz 스케줄러를 위한 SchedulerFactory 및 Scheduler 객체 선언
	private SchedulerFactory schedulerFactory;  
	private Scheduler scheduler;  

	// APIScheduler의 기본 생성자
	// 스케줄러 팩토리를 생성하고, 스케줄러 팩토리의 도움을 받아 스케줄러를 생성
	public APIScheduler() {  
		try {  
			schedulerFactory = new StdSchedulerFactory();
			scheduler = schedulerFactory.getScheduler();
		}
		catch (SchedulerException e) {  
			e.printStackTrace();
		}
	}
	
	// 서블릿 초기화시 자동 실행되는 메소드
	// 웹 애플리케이션 실행될 때 스케줄러 시작
	@Override
	public void init() {
		
		try {  
			ServletContext servletContext = getServletContext();
			
			if (servletContext == null) {
	            System.out.println("ServletContext가 null입니다. 스케줄러 실행 중지.");
	            return;
	        }
			
			JobDataMap jobDataMap = new JobDataMap();
            jobDataMap.put("servletContext", servletContext);
			// 스케줄러가 실행할 Job 설정됨
			// newJob의 매개변수에 실행을 담고 있는 클래스를 넣어둠
			JobDetail job = newJob(RegularEventScheduler.class)
					.withIdentity("job1", "group1")	// Jbo의 ID 및 그룹명 설정
					.usingJobData(jobDataMap)
					.build();

			// CronTrigger를 사용하여 실행 일정 설정
			CronTrigger trigger = newTrigger()
					.withIdentity("trigger1", "group1")	// 트리거 ID 및 그룹명 설정
					.withSchedule(cronSchedule("0 0/1 * * * ?")) 
					//.withSchedule(cronSchedule("0 0 0 * * *")) 
					//.withSchedule(cronSchedule("0/10 * * * * ?")) // 10초마다 한번씩 동작
					.build();

			// 스케줄러에 Job과 Trigger 등록
			scheduler.scheduleJob(job, trigger);

			// 스케줄러 시작
			scheduler.start(); 
			// 스케줄러를 중지하려면 아래 코드 사용
			// 일반적으로 특정 조건이 충족되면 종료하는 경우 씀
//			scheduler.shutdown(true);
		}
		catch (SchedulerException e) {  
			e.printStackTrace();  
		}  
	}
	
	@Override
	public void destroy() {
	    try {
	        if (scheduler != null) {
	            scheduler.shutdown();  // 스케줄러 종료
	            System.out.println("스케줄러가 종료되었습니다.");
	        }
	    } catch (SchedulerException e) {
	        e.printStackTrace();
	    }
	}
}
