package com.tpy.p2p.core.service;

import java.util.Comparator;

import com.tpy.p2p.chesdai.entity.Repaymentrecord;
public class RepaymentSortService implements Comparator {
	@Override
	public int compare(Object o1, Object o2) {
		Repaymentrecord r1=(Repaymentrecord) o1;
		Repaymentrecord r2=(Repaymentrecord) o2;
		return r1.getPeriods().compareTo(r2.getPeriods());
	}

}
