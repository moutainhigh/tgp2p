package com.tpy.p2p.chesdai.spring.service;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.admin.spring.service.SystemConfigService;
import com.tpy.p2p.chesdai.entity.Elite;
import com.tpy.p2p.chesdai.entity.SysConfig;
import com.tpy.p2p.chesdai.entity.UserBank;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/4/2.
 */
@Service
public class EliteService {

    /**
     * 数据库接口
     */
    @Resource
    private HibernateSupport commonDao;

    @Resource
    private SystemConfigService systemConfigService;

    @Resource
    private UserBaseInfoService userBaseInfoService;

    private static final Logger LOGGER = Logger.getLogger(EliteService.class);

    /**
     *
     * @return 返回所有配置参数信息
     */
    public Map<String,String> getMyEliteConfig(){
        String sql = "select id,key,value from sysconfig";
        List<SysConfig> list = commonDao.findBySql(sql);
        Map<String,String> sysConfigMap = new HashMap<String,String>();

        for(SysConfig sc:list){
            sysConfigMap.put(sc.getKey(), sc.getValue());
        }
        return sysConfigMap;
    }

    /**
     * 获取用户体验金信息
     * @param userId
     * @return
     */
    public Elite getMyEliteEarnings(Long userId){
        String hql = "from Elite where userid=?";

        List<Elite> list = commonDao.find(hql,userId);
        if(list.size() > 0){
            return list.get(0);
        }
        return null;
    }

    /**
     * 发放用户体验金
     * @param userId
     */
    public void provideElite(Long userId){
        Map<String,String> map = getSysConfig();
        Elite elite = new Elite();
        if(map.get("is_elite_open")!=null &&map.get("is_elite_open").equals("1")){
            elite.setPrincipal(new BigDecimal( map.get("elite_money")).setScale(2,BigDecimal.ROUND_HALF_UP));
            elite.setProvide_time(System.currentTimeMillis() / 1000);

            long earningFailureTime = (System.currentTimeMillis() +  Long.parseLong(map.get("elite_bonus_period")) * 30 * 24*60 *60*1000)/1000;
            long principalFailureTime = (System.currentTimeMillis() +  Long.parseLong(map.get("elite_expiry_periods")) * 30 * 24*60 *60*1000)/1000;

            elite.setEarning_failure_time(earningFailureTime);
            elite.setPrincipal_failure_time(principalFailureTime);
            elite.setEffect(1);
            elite.setDay_earning(new BigDecimal(0));
            elite.setTotal_earning(new BigDecimal(0));
            elite.setUserid(userId);
            commonDao.save(elite);

        }else{
            LOGGER.info("理财体验金机制未开启");
        }
    }

    /**
     * 回收体验金
     */
    public void regainElite(Long userId){
        Elite elite = getMyEliteEarnings(userId);
        elite.setEffect(0); //置为失效
        commonDao.update(elite);
    }

    /**
     * 领取收益
     * @param userId
     */
    public void getEarnings(Long userId){
        Elite elite = getMyEliteEarnings(userId);
        Userbasicsinfo user = userBaseInfoService.queryUserById(userId);
        user.getUserfundinfo().setCashBalance(user.getUserfundinfo().getCashBalance() + elite.getTotal_earning().doubleValue());
        user.getUserfundinfo().setMoney(user.getUserfundinfo().getMoney() + elite.getTotal_earning().doubleValue());
        commonDao.update(user);

        //elite.setEffect(0); //置为失效
        elite.setTotal_earning(new BigDecimal(0));
        commonDao.update(elite);
    }

    public Map<String,String> getSysConfig(){
        //系统配置表里的四个参数
        //是否开启,本金,收益率，本金有效期,收益有效期
        String[] params = { "is_elite_open","elite_money","elite_fee","elite_bonus_period", "elite_expiry_periods"};

        Map<String,String> map = systemConfigService.getSysConfig(params);
        return map;
    }


    /**
     * 计算每天的收益
     * @param userId
     */
    public void calEarnings(Long userId){
        Map<String,String> map = getSysConfig();
        Elite elite = getMyEliteEarnings(userId);
        int isEliteOpen = Integer.parseInt(map.get("is_elite_open"));
        BigDecimal eliteFee = new BigDecimal(map.get("elite_fee")+"00000");
        BigDecimal eliteMoney = elite.getPrincipal();   //本金
        boolean flag = false;
        if(isEliteOpen==1){
            if(System.currentTimeMillis()/1000<elite.getPrincipal_failure_time()){
                if(System.currentTimeMillis()/1000<elite.getEarning_failure_time()) {
                    BigDecimal dayEarningRate = eliteFee.multiply(new BigDecimal(12)).divide(new BigDecimal(100), 6).divide(new BigDecimal(365),6);
                    LOGGER.info(eliteFee);
                    LOGGER.info(dayEarningRate);
                    BigDecimal dayEarning = eliteMoney.multiply(dayEarningRate);
                    BigDecimal totalEarning = elite.getTotal_earning().add(dayEarning);
                    elite.setDay_earning(dayEarning);
                    elite.setTotal_earning(totalEarning);
                    elite.setEffect(1);
                    commonDao.update(elite);
                }else{
                    elite.setEffect(0);
                    commonDao.update(elite);
                }
            }else{
                elite.setEffect(0);
                commonDao.update(elite);
                LOGGER.info("您的体验金己过收益期");
            }
        }
    }

    /**
     *
     * @return
     */
    public List<Elite> getEarningList(){
        String hql = "from Elite where effect=1";
        List<Elite> list = commonDao.find(hql);

        return list;
    }
}
