package com.tpy.p2p.chesdai.util;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import com.cddgg.commons.normal.Validate;
import com.tpy.p2p.chesdai.model.CreditorModel;
import com.tpy.p2p.chesdai.model.CreditorModel;

/**
 * 债权匹配工具
 * 
 * @author ldd
 * 
 */
public class ProductPickUtil {

    /**
     * 求和
     * 
     * @param creditors
     *            债权数组
     * @param indexs
     *            匹配下标
     * @param val
     *            匹配金额
     * @param num
     *            最大匹配个数
     * @return 和的值,和的个数
     */
    private static Object[] sum(Object[][] creditors, int[] indexs, double val,
            int num) {

        int valid = 0;
        double sum = 0d;

        for (int i = 0; i < indexs.length && sum < val
                && (num == -1 || valid < num); i++) {
            if (indexs[i] == 1) {
                sum += ((BigDecimal) creditors[i][2]).doubleValue();
                valid++;
            }
        }

        return new Object[] { sum, valid };
    }

    /**
     * 得到匹配的债权
     * 
     * @param creditors
     *            债权数组
     * @param indexs
     *            匹配下标
     * @param num
     *            最大匹配个数
     * @return 债权Po数组
     */
    private static CreditorModel[] getMatchCreditor(Object[][] creditors,
            int[] indexs, int num) {

        List<CreditorModel> list = new LinkedList<>();
        int j = 0;

        for (int i = 0; i < indexs.length; i++) {
            if (indexs[i] == 1) {
                list.add(new CreditorModel(
                        ((BigInteger) creditors[i][0]).longValue(),
                        ((BigInteger) creditors[i][1]).longValue(),
                        ((BigDecimal) creditors[i][2]).doubleValue(),
                        (String) creditors[i][3]));
                
                j++;
                if (num!=-1 && j >= num) {
                    break;
                }
            }
        }

        CreditorModel[] creditorModels = list.toArray(new CreditorModel[0]);
        
        Arrays.sort(creditorModels);

        return creditorModels;
    }

    /**
     * 
     * @param creditors
     *            待计算数组
     * @param val
     *            期望匹配值
     * @param num
     *            匹配长度
     * @param size
     *            最大返回条数
     * @return 匹配的id
     */
    private static List<CreditorModel[]> pickBastMatchCreditor(
            Object[][] creditors, double val, int num, int size) {

        int[] indexs = new int[creditors.length];
        for (int i = 0; i < creditors.length; i++) {
            indexs[i] = -1;
        }

        int k = 0;
        Object[] sum;

        List<CreditorModel[]> list = new BastCreditorModelList();

        while (k >= 0) {

            while (indexs[k] <= 0) {

                indexs[k]++;

                sum = sum(creditors, indexs, val, num);

                if (((Double) sum[0] == val) && (k <= indexs.length - 1)
                        && (num == -1 || (Integer) sum[1] == num)) {

                    list.add(getMatchCreditor(creditors, indexs, num));

                    if (size != -1 && list.size() >= size) {
                        return list;
                    }

                } else if (((Double) sum[0] < val) && (k < indexs.length - 1)
                        && (num == -1 || (Integer) sum[1] < num)) {

                    k++;
                }
            }

            indexs[k] = -1;
            k--;
        }
        return list;
    }

    /**
     * 强制匹配
     * 
     * @param listDay
     *            一天的债权数组集合
     * @param val
     *            最佳金额
     * @return 债权模型集合
     */
    private static List<CreditorModel> compelPickMatchCreditor(
            List<Object[]> listDay, double val) {

        double sum = 0;

        List<CreditorModel> list = new LinkedList<CreditorModel>();

        for (Iterator<Object[]> iterator = listDay.iterator(); iterator
                .hasNext();) {

            Object[] objects = iterator.next();

            sum += ((BigDecimal) objects[2]).doubleValue();

            if (sum < val) {

                list.add(new CreditorModel(((BigInteger) objects[0])
                        .longValue(), ((BigInteger) objects[1]).longValue(),
                        ((BigDecimal) objects[2]).doubleValue(),
                        (String) objects[3]));

            } else if (sum == val) {// 刚好等于

                list.add(new CreditorModel(((BigInteger) objects[0])
                        .longValue(), ((BigInteger) objects[1]).longValue(),
                        ((BigDecimal) objects[2]).doubleValue(),
                        (String) objects[3]));

                return list;

            } else {// 大于，超出

                list.add(new CreditorModel(((BigInteger) objects[0])
                        .longValue(), ((BigInteger) objects[1]).longValue(),
                        val - (sum - ((BigDecimal) objects[2]).doubleValue()),
                        (String) objects[3]));

                return list;
            }
        }

        return null;
    }

    /**
     * 强制匹配
     * @param listDay      一天的债权数组集合
     * @param listCommon    已经匹配的债权数组集合
     * @param val           最佳金额
     * @return              是否存在匹配
     */
    private static boolean compelPickMatchCreditor(List<Object[]> listDay,
            List<CreditorModel> listCommon, double val) {

        List<CreditorModel> listTemp = compelPickMatchCreditor(listDay, val);

        if (!Validate.emptyCollectionValidate(listTemp)) {// 存在至少一次不匹配
            return false;
        }

        listDay.clear();

        return listCommon.addAll(listTemp);

    }

    /**
     * 挑选最佳的债权
     * @param listDay       一天的债权数组集合
     * @param listCommon    已经匹配的债权数组集合
     * @param val           最佳金额
     * @param num           最佳返回个数
     * @param size          最大返回条数
     * @return              是否存在匹配
     */
    private static boolean pickBastMatchCreditor(List<Object[]> listDay,
            List<CreditorModel[]> listCommon, double val, int num, int size) {

        Object[][] tmp = new Object[0][];

        // 开始匹配
        List<CreditorModel[]> listTemp = pickBastMatchCreditor(
                listDay.toArray(tmp), val, num, size);

        if (Validate.emptyCollectionValidate(listTemp)) {// 存在至少一次不能完全匹配
            return false;
        }

        if (listCommon.size() == 0) {// 第一次

            listCommon.addAll(listTemp);
        } else {

            listCommon.retainAll(listTemp);
        }

        if (listCommon.size() == 0) {// 存在交集不存在
            return false;
        }

        listDay.clear();

        return true;
    }

    /**
     * 
     * @param list
     *            [债权关联link_id][金额][时间]
     * @param val
     *            购买金额
     * @param num
     *            最佳匹配个数
     * @param size
     *            最大返回条数
     * @return 合适的债权编号多重集合
     * @throws java.text.ParseException   时间格式化错误
     */
    @SuppressWarnings("all")
    public static CreditorModel[] pickMatchCreditor(List<Object[]> list,
            double val, int num, int size) throws ParseException {

        boolean isBast = true;

        List<Object[]> listDay = new LinkedList<Object[]>();
        List listCommon = new BastCreditorModelList();

        String tmpDate = (String) list.get(0)[3];

        for (int i = 0; i <= list.size(); i++) {

            Object[] obj = null;
            
            if(i!=list.size()){
                obj = list.get(i);
            }
            

            if (i == list.size() || (!tmpDate.equals(obj[3]) && listDay.size() != 0)) {// 校对时间是否不相同

                // 是否还可以进行最佳匹配，如果不行就进行强制匹配
                if (isBast
                        && !pickBastMatchCreditor(listDay, listCommon, val,
                                num, size)) {

                    isBast = false; // 不能存在最佳匹配

                    // 重头遍历
                    i = -1;
                    tmpDate = (String) list.get(0)[3];
                    listDay.clear();
                    // list_common.clear();
                    listCommon = new CompelCreditorModelList();

                    continue;

                } else if (!isBast
                        && !compelPickMatchCreditor(listDay, listCommon, val)) {// 无法找到满足的匹配

                    return null;

                }
                
                if(i == list.size()){
                    continue;
                }
                

                tmpDate = (String) obj[3];

            }

            listDay.add(obj);

        }

        CreditorModel[] creditorModels = null;

        
        // 是存在匹配
        if (Validate.emptyCollectionValidate(listCommon)) {

            // 本次是否为最佳匹配
            if (isBast) {

                creditorModels = (CreditorModel[]) listCommon.get(0);

                for (CreditorModel creditorModel : creditorModels) {
                    creditorModel.formatBastCreditorModel();
                }

            } else {

                creditorModels = formatCompelCreditorModel(listCommon);

            }

        }

        
            
        return creditorModels;

    }

    /**
     * 挑选大金额的债权
     * @param list  待挑选债权
     * @return      挑选后的债权
     */
    public static List<CreditorModel> pickMatchBiggerCreditor(List<Object[]> list){
        
        List<CreditorModel> listCommon = new CompelCreditorModelList();
        List<CreditorModel> listTemp = new LinkedList<CreditorModel>();
        
        String tmpDate = (String) list.get(0)[3];
        
        for (Iterator<Object[]> iterator = list.iterator(); iterator.hasNext();) {
            
            Object[] obj = iterator.next();
            
            if (!tmpDate.equals(obj[3])) {
                
                listCommon.addAll(listTemp);
                listTemp.clear();
            }
            
            listTemp.add(new CreditorModel(((BigInteger) obj[0])
                        .longValue(), ((BigInteger) obj[1]).longValue(),
                        ((BigDecimal) obj[2]).doubleValue(),
                        (String) obj[3]));
            
        }
        
        
        
        return listCommon;
        
    }
    
    /**
     * 格式化债权
     * @param listCommon        精选的债权
     * @return                  债权数组
     * @throws java.text.ParseException   时间格式异常
     */
    public static CreditorModel[] formatCompelCreditorModel(List listCommon) throws ParseException{
     
        for (int i = 0; i < listCommon.size(); i++) {
            ((CreditorModel) listCommon.get(i))
                    .formatCompelCreditorModel(listCommon);
        }

        return (CreditorModel[]) listCommon.toArray(new CreditorModel[0]);
        
    }
    
    /**
     * 得到最佳债权个数
     * 
     * @param money
     *            购买金额
     * @return 最佳匹配个数
     */
    public static int getBestMatchCreditorNumber(Double money) {

        int num = 0;

        if (money < 10000) {
            num = 1;
        } else if (money >= 10000 && money < 50000) {
            num = 2;
        } else if (money >= 50000 && money < 100000) {
            num = 3;
        } else {
            num = 5;
        }

        return num;

    }

    /**
     * 得到最佳购买单位
     * 
     * @param money 购买金额
     * @return 最佳购买单位
     */
    public static double getBestMatchCreditorMoney(Double money) {

        double val = 0d;

        if (money >= 600000 && money < 5000000) {
            val = 100000;
        } else if (money >= 5000000 && money < 10000000) {
            val = 200000;
        } else {
            val = 300000;
        }

        return val;

    }

}

/**
 * 最佳债权集合
 * @author ldd
 *
 */
class BastCreditorModelList extends ArrayList<CreditorModel[]> {

    /**
     * 版本标示
     */
    private static final long serialVersionUID = 1L;

    @Override
    public int indexOf(Object o) {
        for (int i = 0; i < this.size(); i++) {
            if (Arrays.equals(get(i), (CreditorModel[]) o)) {
                return i;
            }
        }
        return -1;
    }
}

/**
 * 强制债权集合
 * @author ldd
 *
 */
class CompelCreditorModelList extends ArrayList<CreditorModel> {

    /**
     * 版本标示
     */
    private static final long serialVersionUID = 1L;

    @Override
    public boolean addAll(Collection<? extends CreditorModel> c) {

        if (size() == 0) {

            return super.addAll(c);

        } else {

            boolean isNew = true;
            List<CreditorModel> list = new ArrayList<>();
            List<Integer> listIndex = new ArrayList<>();
            int length = size();

            for (@SuppressWarnings("unchecked")
            Iterator<CreditorModel> iterator2 = (Iterator<CreditorModel>) c
                    .iterator(); iterator2.hasNext();) {

                CreditorModel creditorModel2 = iterator2.next();
                isNew = true;

                for (int i = 0; i < length; i++) {

                    // 判断是否已经存在
                    if (listIndex.contains(i)) {
                        continue;
                    }

                    CreditorModel creditorModel1 = get(i);

                    if (creditorModel2.equals(creditorModel1)) {
                        listIndex.add(i);
                        isNew = false;
                        break;
                    }
                }

                if (isNew) {
                    list.add(creditorModel2);
                }

            }

            if (list.size() > 0) {
                return super.addAll(list);
            } else {
                return true;
            }

        }
    }

}