package com.hamara.kendra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


@Configuration
@EnableScheduling
public class Scheduler {
	
	
	@Scheduled(fixedRate = 180000)
	public void scheduleFixedRateTask() {
		if(MainController.otpMap!=null) {
			MainController.otpMap.clear();
		}
	}
}
