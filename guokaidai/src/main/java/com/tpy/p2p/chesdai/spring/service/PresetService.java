package com.tpy.p2p.chesdai.spring.service;

import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Preset;
import org.springframework.stereotype.Service;

@Service
@SuppressWarnings(value={"presetService"})
public class PresetService {
	@Resource
	private HibernateSupport presetdao;

	/**
	 * 通用方法
	 */
	@Resource
	private HibernateSupport dao;
	
	/**
	 * 保存预定
	 * @param preset
	 */
	public void save(Preset preset){
		presetdao.save(preset);
	}
	
	/**
	 * 通过id查询ps
	 * @return
	 */
	public Preset getPresetByUserId(Long userId,Long loansignId){
		StringBuffer sql=new StringBuffer("select id,loanSign_id,ucode,userbaseinfo_id,bargainMoney,loanMoney,state,payTime,presetTime,success from preset where userbaseinfo_id="+userId);
		sql.append(" AND loanSign_id="+loansignId);
		@SuppressWarnings("unchecked")
		List<Preset> list=dao.findBySql(sql.toString(), Preset.class, null);
		return list.size()>0?list.get(0):null;
	}
	
	/**
	 * 查询所有预定
	 * @param userId
	 * @param loansignId
	 * @return
	 */
	public List<Preset> getPresetListpage(Long userId,int no){
		StringBuffer sql=new StringBuffer("select * from preset where state!=0 AND userbaseinfo_id="+userId);
		sql.append(" order by id desc ");
		sql.append(" LIMIT " + no + ",10");
		@SuppressWarnings("unchecked")
		List<Preset> list=dao.findBySql(sql.toString(), Preset.class, null);
		return list;
	}
	
	public List<Preset> getPresetList(Long userId){
		StringBuffer sql=new StringBuffer("select * from preset where state!=0 AND userbaseinfo_id="+userId);
		sql.append(" order by id desc ");
		@SuppressWarnings("unchecked")
		List<Preset> list=dao.findBySql(sql.toString(), Preset.class, null);
		return list;
	}
	
	/**
	 * 修改兑换成功
	 * @param preset
	 */
	public void updateUcode(Preset preset){
		
		dao.update(preset);
	}
	
	public Double getlastMoney(Long loanId){
		
		String sql="SELECT sum(loanMoney) from preset where loanSign_id="+loanId;
		Double money=dao.queryNumberSql(sql);
		
		return money;
	}
}
