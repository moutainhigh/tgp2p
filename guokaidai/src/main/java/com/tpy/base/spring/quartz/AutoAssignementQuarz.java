package com.tpy.base.spring.quartz;


import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.spring.service.AutoAssignmentService;
import com.tpy.p2p.chesdai.entity.Loansign;

/**
 * 自动处理债权转让
 * @author liukaili
 *
 */
public class AutoAssignementQuarz {
	
	
	@Resource
	private AutoAssignmentService autoAssignment;
	
	/**
	 * 定时启动方法
	 */
	public void run(){
		List<Loansign> records=autoAssignment.getAutoLoansignList();
		for(int i=0;i<records.size();i++){
			autoAssignment.setLoansign(records.get(i));
			new Thread(new Runnable() {
				@Override
				public void run() {
				   autoAssignment.uptLoansign();
				}
			}).start();
		}
	} 
	
	
}
