package com.tpy.p2p.chesdai.admin.spring.service;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.SysConfig;
import com.tpy.p2p.chesdai.entity.SystemConfig;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hsq on 2015/3/4.
 */
@Service
public class SystemConfigService {

    /**
     * 数据库接口
     */
    @Resource
    private HibernateSupport dao;



    /**
     * 保存配置
     * @param key
     * @param value
     * @return
     */
    public int saveSetting(String key,String value){

        SystemConfig config = new SystemConfig();
        config.setName(key);
        config.setValue(value);
        int count = 0;
        try {
            if(existKey(key)){
                count =updateConfig(config);
            }else{
                count =addConfig(config);
            }
            return count;
        } catch (Exception e) {

            e.printStackTrace();
            return 0;
        }
    }

    /**
     * 取得所有的系统配置参数
     *
     * @return 返回所有配置参数信息
     */
    public Map<String,String> getSysConfig(){

        String sql = "select id,name,value from system_config";// where name in ('RecommendCalculateDate','recommendee_fee','recommender_fee','isRecommendOpen','bonus_period')";  //
        List<SystemConfig> list = dao.findBySql(sql,SystemConfig.class);
        Map<String,String> sysConfigMap = new HashMap<String,String>();

        for(SystemConfig sc:list){
            sysConfigMap.put(sc.getName(), sc.getValue());
        }
        return sysConfigMap;
    }

    /**
     * 读取N个参数
     * @param paras
     * @return
     */
    public Map<String,String> getSysConfig(String ...paras){

        StringBuffer sql = new StringBuffer("select id,name,value from system_config where 1=1 ");// where name in ('RecommendCalculateDate','recommendee_fee','recommender_fee','isRecommendOpen','bonus_period')";  //
        StringBuffer condition = new StringBuffer();
        int i=0;
        for(String para:paras) {
            ++i;
            condition.append("'").append(para).append("'");
            if(paras.length>1 &&  i<paras.length){
                condition.append(",");
            }

        }
        if(paras.length>0){
            sql.append(" and name in (").append(condition.toString()).append(")");
        }

        List<SystemConfig> list = dao.findBySql(sql.toString(),SystemConfig.class);
        Map<String,String> sysConfigMap = new HashMap<String,String>();

        for(SystemConfig sc:list){
            sysConfigMap.put(sc.getName(), sc.getValue());
        }
        return sysConfigMap;
    }

    /**
     * 判断是否存在当前配置项
     * @param key
     * @return
     */
    public boolean existKey(String key){
        String sql = "select count(1) from system_config where name='" + key+"'";
        Object obj = dao.findObjectBySql(sql.toString());
        if (Integer.parseInt(obj.toString()) > 0) {
            return true;
        }
        return false;
    }

    /**
     * 更新配置项
     * @param config
     */
    public int updateConfig(SystemConfig config){
        String sql = "update system_config set updated_at=now() ,value='" + config.getValue() +"' where name='"+config.getName()+"'";
        int count = 0;
        try {
            count = dao.executeSql(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    /**
     * 添加配置项
     * @param config
     */
    public int addConfig(SystemConfig config){
        String sql = "insert into system_config (name,value,created_at) value  ('"+config.getName()+"','"+config.getValue()+"',now())";
        int count = 0 ;
        try {
            count = dao.executeSql(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }


}