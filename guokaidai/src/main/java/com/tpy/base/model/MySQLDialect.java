package com.tpy.base.model;

import java.sql.Types;

import org.hibernate.Hibernate;

/**
* <p>Title:MySQLDialect</p>
* <p>Description: mySql字典</p>
* <p>Company: 太平洋金融</p>
* @author LiNing
* <p>date 2014年2月14日</p>
*/
public class MySQLDialect extends org.hibernate.dialect.MySQLDialect {
    
	/**
	 * 构造方法
	 */
    public MySQLDialect(){
    	
//        super();   
//        registerHibernateType(Types.DECIMAL, Hibernate.BIG_DECIMAL.getName());   
//        registerHibernateType(-1, Hibernate.STRING.getName());
    	
    }

}
