package com.tpy.base.spring.quartz;


import com.tpy.base.spring.service.AutoAssignmentService;
import com.tpy.p2p.chesdai.entity.Elite;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.spring.service.EliteService;

import javax.annotation.Resource;
import java.util.List;

/**
 * 自动处理债权转让
 * @author liukaili
 *
 */
public class EliteEarningQuarz {
	@Resource
	public EliteService eliteService;

	/**
	 * 定时启动方法
	 */
	public void run(){
		List<Elite>  earningList = eliteService.getEarningList();
		new CalEliteEarningThread(earningList,eliteService).start();
	}
}


class CalEliteEarningThread extends Thread{
	private EliteService eliteService;

	private List<Elite> elites;

	public CalEliteEarningThread(List<Elite> elites,EliteService eliteService){
		this.elites = elites;
		this.eliteService = eliteService;
	}

	@Override
	public void run() {
		for(Elite elite:elites){
			eliteService.calEarnings(elite.getUserid());
		}
	}
}
