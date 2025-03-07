package com.filmlog.common.scheduler;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletContext;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.filmlog.reviewboard.model.service.ReviewBoardService;
import com.filmlog.reviewboard.model.vo.ReviewBoard;

public class RegularEventScheduler implements Job{

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
	    try {
//	        LocalDate date = LocalDate.now().minusDays(1);
	    	LocalDate date = LocalDate.now();
	        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        String yesterday = dtf.format(date);

	        System.out.println("현재시간 : " + yesterday);

	        List<ReviewBoard> popularReviewTop4 = null;
	        try {
	            popularReviewTop4 = new ReviewBoardService().selectReviewBoardTop4(yesterday);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        if (popularReviewTop4 != null) {
	            for (ReviewBoard b : popularReviewTop4) {
	                System.out.println(b.getReviewBoardTitle());
	            }
	        } else {
	            System.out.println("어제의 리뷰게시글이 없습니다.");
	        }

	        // ServletContext 가져오기
	        Object contextObj = arg0.getJobDetail().getJobDataMap().get("servletContext");

	        if (contextObj instanceof ServletContext) {
	            ServletContext servletContext = (ServletContext) contextObj;
	            servletContext.setAttribute("popularReviewTop4", popularReviewTop4);
	        } else {
	            System.out.println("ServletContext를 가져올 수 없습니다.");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}