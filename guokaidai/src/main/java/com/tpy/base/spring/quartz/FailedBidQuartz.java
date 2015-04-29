package com.tpy.base.spring.quartz;

import javax.annotation.Resource;

import com.jubaopen.commons.LOG;
import com.tpy.p2p.core.service.BaseLoansignService;

/**
 * 定时检查流标
 * 
 * @author gzm
 * 
 */
public class FailedBidQuartz {

	@Resource
	private BaseLoansignService baseLoansignService;

	/**
	 * 运行
	 */
	public void run() {
		LOG.info("start to process the failed bid");
		baseLoansignService.autoEndLoan();
		LOG.info("All failed bid have been end");
	}

}
