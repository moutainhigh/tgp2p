package com.tpy.p2p.chesdai.model;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.entity.Creditor;

/**
 * 债权实体
 * @author ldd
 *
 */
public class CreditorModel implements Comparable<CreditorModel> {

    /**
     * id
     */
    private long id;
    
    /**
     * creditor
     */
    private Creditor creditor;

    /**
     * 债权人姓名
     */
    private String name;            
    
    /**
     * 开始时间
     */
    private String timePayStart;    
    
    /**
     * 结束时间
     */
    private String timePayEnd;
    
    /**
     * 时间段
     */
    private int duringTime;
    
    /**
     * 金额
     */
    private double money;

    /**
     * 时间点
     */
    private Set<String> timePays;       
    
    /**
     * 资金点
     */
    private List<Double> moneys;
    
    /**
     * 债权点
     */
    private Set<Long> creditorLinkIds;

    /**
     * 构造函数
     */
    public CreditorModel() {
        super();
    }

    /**
     * 构造函数
     * @param creditorLinkId    id
     * @param creditorId        id
     * @param money             money
     * @param timePay           timePay
     */
    public CreditorModel(long creditorLinkId, long creditorId, double money,
            String timePay) {

        this.creditorLinkIds = new LinkedHashSet<>();
        this.creditorLinkIds.add(creditorLinkId);

        this.id = creditorId;

        this.moneys = new LinkedList<>();
        this.moneys.add(money);

        this.timePays = new LinkedHashSet<>();
        this.timePays.add(timePay);
    }

    /**
     * 构造函数
     * @param id                id
     * @param timePays          timePays
     * @param moneys            moneys
     * @param creditorLinkIds   creditorLinkIds
     */
    public CreditorModel(long id, Set<String> timePays, List<Double> moneys,
            Set<Long> creditorLinkIds) {
        super();
        this.id = id;
        this.timePays = timePays;
        this.moneys = moneys;
        this.creditorLinkIds = creditorLinkIds;
    }

    @Override
    public boolean equals(Object obj) {

        return this.id == ((CreditorModel) obj).id ? add((CreditorModel) obj)
                : false;
    }

    @Override
    public int compareTo(CreditorModel o) {
        return (int) (id - o.id);
    }

    /**
     * 加入债权
     * @param model 债权
     * @return  是否添加成功
     */
    public boolean add(CreditorModel model) {

        if (!model.creditorLinkIds.addAll(this.creditorLinkIds)) {
            return true;
        }
        model.moneys.add(this.moneys.get(0));
        model.timePays.addAll(this.timePays);
        return true;
    }

    /**
     * 批量移除
     * @param params    params
     */
    public void removeAll(Params params){
        
        for (Iterator<Integer> iterator = params.getIndexs().iterator(); iterator.hasNext();) {
            this.moneys.remove(iterator.next());
        }
        this.creditorLinkIds.removeAll(params.getCreditorLinkIds());
        this.timePays.removeAll(params.getTimePays());
        
    }
    
    /**
     * moneys
     * @return  moneys
     */
    public List<Double> getMoneys() {
        return moneys;
    }

    /**
     * duringTime
     * @return  duringTime
     */
    public int getDuringTime() {
        return duringTime;
    }

    /**
     * 初始化时间段
     * @throws java.text.ParseException   时间格式异常
     */
    public void initDuringTime() throws ParseException {
        this.duringTime = DateUtils.differenceDate(DateUtils.DEFAULT_DATE_FORMAT,timePayStart, timePayEnd);
    }

    /**
     * id
     * @return  id
     */
    public long getId() {
        return id;
    }

    /**
     * creditor
     * @return  creditor
     */
    public Creditor getCreditor() {
        return creditor;
    }

    /**
     * name
     * @return  name
     */
    public String getName() {
        return name;
    }

    /**
     * timePayStart
     * @return  timePayStart
     */
    public String getTimePayStart() {
        return timePayStart;
    }

    /**
     * timePayEnd
     * @return  timePayEnd
     */
    public String getTimePayEnd() {
        return timePayEnd;
    }

    /**
     * money
     * @return  money
     */
    public double getMoney() {
        return money;
    }

    /**
     * creditorLinkIds
     * @return  creditorLinkIds
     */
    public Set<Long> getCreditorLinkIds() {
        return creditorLinkIds;
    }

    /**
     * 设置债权和债权人姓名
     * @param creditor creditor
     */
    public void setCreditor(Creditor creditor) {
        this.creditor = creditor;
        this.name = creditor.getUserbasicsinfo().getName();
    }

    /**
     * 格式化最佳债权
     */
    public void formatBastCreditorModel() {

        this.money = this.moneys.get(0);

        int i = 0;
        int length = this.timePays.size() - 1;

        // 格式化时间
        for (Iterator<String> iterator = this.timePays.iterator(); iterator
                .hasNext();) {

            if (i == 0) {
                this.timePayStart = iterator.next();
            } else if (i == length) {
                this.timePayEnd = iterator.next();
            } else {
                iterator.next();
            }

            i++;

        }

    }

    /**
     * 格式化强制匹配债权
     * @param list  债权集合
     * @throws java.text.ParseException   时间格式异常
     */
    public void formatCompelCreditorModel(List<CreditorModel> list)throws ParseException {

        Params params = new Params();

        int i = 0;
        int length = this.timePays.size() - 1;

        Iterator<String> iteratorTime = this.timePays.iterator();
        Iterator<Double> iteratorMoney = this.moneys.iterator();
        Iterator<Long> iteratorLinkId = this.creditorLinkIds.iterator();

        for (; iteratorTime.hasNext();) {

            //如果打开了一个新的
            if(params.isOpen()){
                
                params.setCurTime(iteratorTime.next());
                params.setCurMoney(iteratorMoney.next());
                params.setCurLinkId(iteratorLinkId.next());

                params.addSets(i);
                
            }else{
                
                if(execNormalNext(iteratorTime, iteratorMoney, iteratorLinkId,params,i)){
                    continue;
                }
                
                if (i == 0 && i == length) {// 有且仅有一个元素

                    this.timePayStart = params.getCurTime();
                    this.timePayEnd = DateUtils.add(DateUtils.DEFAULT_DATE_FORMAT,
                            this.timePayStart, Calendar.DATE, 1);
                    this.money = params.getCurMoney();

                } else if (i == 0) {// 初次

                    this.timePayStart = params.getCurTime();
                    

                }else if (length == 1) {// 该集合有且只有两个元素


                    this.timePayEnd = params.getCurTime();
                    this.money = params.getCurMoney();

                }else if (i == length) {// 最后一个,且未打开新的一个

                    this.timePayEnd = params.getCurTime();
                    this.money = params.getCurMoney();

                }
            }

            i++;

        }

        if(params.isOpen()){
            
            this.removeAll(params);
            
            list.add(new CreditorModel(id, params.getTimePays(), params.getMoneys(), params.getCreditorLinkIds()));
        }
        

    }

    /**
     * 执行普通next
     * @param iteratorTime  iteratorTime
     * @param iteratorMoney iteratorMoney
     * @param iteratorLinkId    iteratorLinkId
     * @param params    params
     * @param index     index
     * @return          是否open
     * @throws java.text.ParseException   时间格式异常
     */
    private boolean execNormalNext(Iterator<String> iteratorTime,
            Iterator<Double> iteratorMoney, Iterator<Long> iteratorLinkId,
            Params params,int index) throws ParseException {

        params.setCurTime(iteratorTime.next());
        params.setCurMoney(iteratorMoney.next());
        params.setCurLinkId(iteratorLinkId.next());

        // 判断是否需要新开一个
        if (!params.equalsTime() || !params.equalsMoney()) {

            params.open();

            params.initOpen();

            params.addSets(index);

            this.timePayEnd = params.getLastTime();
            this.money = params.getLastMoney();

            return true;
            
        } else {

            params.setLastTime(params.getCurTime());
            params.setLastMoney(params.getCurMoney());

            return false;
        }
    }

}

/**
 * 参数
 * @author ldd
 *
 */
class Params {

    /**
     * 上一次时间
     */
    private String lastTime;
    
    /**
     * 上一次金额
     */
    private Double lastMoney;
    
    /**
     * 当前时间
     */
    private String curTime;
    
    /**
     * 当前金额
     */
    private double curMoney;
    
    /**
     * 当前link
     */
    private long curLinkId;
    
    /**
     * 是否打开
     */
    private boolean isOpen;

    /**
     * 时间点
     */
    private Set<String> timePays;
    
    /**
     * 金额点
     */
    private List<Double> moneys;
    
    /**
     * 下标点
     */
    private Set<Integer> indexs;
    
    /**
     * link点
     */
    private Set<Long> creditorLinkIds;
    
    
    /**
     * lastTime
     * @return  lastTime
     */
    public String getLastTime() {
        return lastTime;
    }

    /**
     * lastTime
     * @param lastTime  lastTime
     */
    public void setLastTime(String lastTime) {
        this.lastTime = lastTime;
    }

    /**
     * lastMoney
     * @return  lastMoney
     */
    public double getLastMoney() {
        return lastMoney;
    }

    /**
     * lastMoney
     * @param lastMoney lastMoney
     */
    public void setLastMoney(double lastMoney) {
        this.lastMoney = lastMoney;
    }

    /**
     * timePays
     * @return  timePays
     */
    public Set<String> getTimePays() {
        return timePays;
    }

    /**
     * timePays
     * @param timePays  timePays
     */
    public void setTimePays(Set<String> timePays) {
        this.timePays = timePays;
    }

    /**
     * moneys
     * @return  moneys
     */
    public List<Double> getMoneys() {
        return moneys;
    }

    /**
     * moneys
     * @param moneys    moneys
     */
    public void setMoneys(List<Double> moneys) {
        this.moneys = moneys;
    }

    /**
     * creditorLinkIds
     * @return  creditorLinkIds
     */
    public Set<Long> getCreditorLinkIds() {
        return creditorLinkIds;
    }

    /**
     * creditorLinkIds
     * @param creditorLinkIds   creditorLinkIds
     */
    public void setCreditorLinkIds(Set<Long> creditorLinkIds) {
        this.creditorLinkIds = creditorLinkIds;
    }

    /**
     * curTime
     * @return  curTime
     */
    public String getCurTime() {
        return curTime;
    }

    /**
     * curTime
     * @param curTime   curTime
     */
    public void setCurTime(String curTime) {
        this.curTime = curTime;
    }

    /**
     * curMoney
     * @return  curMoney
     */
    public double getCurMoney() {
        return curMoney;
    }

    /**
     * curMoney
     * @param curMoney  curMoney
     */
    public void setCurMoney(double curMoney) {
        this.curMoney = curMoney;
    }

    /**
     * curLinkId
     * @return  curLinkId
     */
    public long getCurLinkId() {
        return curLinkId;
    }

    /**
     * curLinkId
     * @param curLinkId curLinkId
     */
    public void setCurLinkId(long curLinkId) {
        this.curLinkId = curLinkId;
    }

    /**
     * indexs
     * @return  indexs
     */
    public Set<Integer> getIndexs() {
        return indexs;
    }

    /**
     * indexs
     * @param indexs    indexs
     */
    public void setIndexs(Set<Integer> indexs) {
        this.indexs = indexs;
    }

    /**
     * isOpen
     * @return  isOpen
     */
    public boolean isOpen() {
        return isOpen;
    }

    /**
     * 打开
     */
    public void open() {
        this.isOpen = true;
    }

    /**
     * 比较金额是否相同
     * @return  是否相同
     */
    public boolean equalsMoney() {
        if(this.lastMoney==null){
            return true;
        }
        return this.curMoney == this.lastMoney;
    }

    /**
     * 比较时间是否相同
     * @return  是否相同
     * @throws java.text.ParseException 时间格式化异常
     */
    public boolean equalsTime() throws ParseException {
        if(this.lastTime==null){
            return true;
        }
        return this.lastTime
                .equals(DateUtils.add(DateUtils.DEFAULT_DATE_FORMAT,
                        this.curTime, Calendar.DATE, -1));
    }

    /**
     * 初始化open
     */
    public void initOpen() {
        this.timePays = new LinkedHashSet<>();
        this.moneys = new LinkedList<>();
        this.indexs = new LinkedHashSet<>();
        this.creditorLinkIds = new LinkedHashSet<>();
    }

    /**
     * 添加set
     * @param index 下标
     */
    public void addSets(Integer index) {
        
        this.timePays.add(this.curTime);
        this.moneys.add(this.curMoney);
        this.indexs.add(index);
        this.creditorLinkIds.add(this.curLinkId);
        
    }
}
