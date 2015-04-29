package com.tpy.p2p.chesdai.constant;

import com.tpy.p2p.pay.util.ParameterIps;

/**
 * 常量
 * @author frank
 *
 */
public interface Constant extends com.tpy.base.constant.Constant {

    /**
     * URL_SUCCESS_LOGIN
     */
    String URL_SUCCESS_LOGIN = "/user/member_index/member_center";
    
    /**
     * URL_ERROR_500
     */
    String URL_ERROR_500 = "/error-500.jsp";
    
    /**
     * URL_ERROR_500_MSG
     */
    String URL_ERROR_500_MSG = "msg";
    
    /**
     * URL_ERROR_500_MSG_VAL_0
     */
    String URL_ERROR_500_MSG_VAL_0 = "您请求的方式非法！";
    
    /**
     * URL_SUCCESS_REGIST
     */
    String URL_SUCCESS_REGIST = "/member_index/member_center";

    /**URL_LOGIN*/
    String URL_LOGIN = "/visitor/to-login";
    
    /**
     * PATH_MARKER_MODEL
     */
    String PATH_MARKER_MODEL = "config/marker/html/";
    
    /**
     * PATH_DYNAMIC_VIEW
     */
    String PATH_DYNAMIC_VIEW = "views/framework/";
    
    /**
     * DEFAULT_TIME_FORMAT
     */
    String DEFAULT_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
    
    /**
     * DEFAULT_DATE_FORMAT
     */
    String DEFAULT_DATE_FORMAT = "yyyy-MM-dd";

    /**
     * 产品认购信息
     */
    String ATTRIBUTE_PRODUCT_PAY_INFO = "attribute_product_pay_info";
    
    
    /**
     * ATTRIBUTE_UPDATE_HEADER_TIME
     */
    String ATTRIBUTE_UPDATE_HEADER_TIME = "update_header_time";

    /**
     * ATTRIBUTE_ROOT_PATH
     */
    String ATTRIBUTE_ROOT_PATH = "root_path";

    /**
     * ATTRIBUTE_MSG
     */
    String ATTRIBUTE_MSG = "msg";
    
    /**
     * ATTRIBUTE_USER
     */
    String ATTRIBUTE_USER = "session_user";

    /**
     * ATTRIBUTE_REGIST_CHECK_CODE
     */
    String ATTRIBUTE_REGIST_CHECK_CODE = "regist_check_code";
    
    /**
     * ATTRIBUTE_LOGIN_CHECK_CODE
     */
    String ATTRIBUTE_LOGIN_CHECK_CODE = "login_check_code";

    /**
     * ATTRIBUTE_TOPIC
     */
    String ATTRIBUTE_TOPIC = "topics";
    
    /**
     * ATTRIBUTE_ACTIVE_TOPIC
     */
    String ATTRIBUTE_ACTIVE_TOPIC = "activetopic";

    /**
     * PROPERTIES_MSG_TITLE_WELCOME_REGIST
     */
    String PROPERTIES_MSG_TITLE_WELCOME_REGIST = "msg_title_welcome_regist";
    
    /**
     * PROPERTIES_MSG_CONTEXT_WELCOME_REGIST
     */
    String PROPERTIES_MSG_CONTEXT_WELCOME_REGIST = "msg_context_welcome_regist";

    /**
     * PROPERTIES_EMAIL_SUBJECT_ACCOUNT_ACTIVATE
     */
    String PROPERTIES_EMAIL_SUBJECT_ACCOUNT_ACTIVATE = "msg_subject_account_activate";
    
    /**
     * PROPERTIES_EMAIL_CONTEXT_ACCOUNT_ACTIVATE
     */
    String PROPERTIES_EMAIL_CONTEXT_ACCOUNT_ACTIVATE = "msg_context_account_activate";

    /**
     * NUMBER_MAX_ERROR_LOGIN
     */
    int NUMBER_MAX_ERROR_LOGIN = 5;

    /** 后台会员登录成功 */
    String ADMINLOGIN_SUCCESS = "adminuser";

    /** 前台会员登录成功 */
    String SESSION_USER = "session_user";

    /** 返回http状态码 请求成功 */
    String HTTP_STATUSCODE_SUCCESS = "200";

    /** 返回http状态码 请求错误 */
    String HTTP_STATUSCODE_ERROR = "300";

    /** 返回http状态码 session失效 */
    String HTTP_STATUSCODE_TIME_OUT = "301";

    /**
     * 有关平台的一些状态定义
     * 0*/
    Integer STATUES_ZERO = 0;
    
    /**
     * 有关平台的一些状态定义
     *  1*/
    Integer STATUES_ONE = 1;
    
    /**
     * 有关平台的一些状态定义
     *  2*/
    Integer STATUES_TWO = 2;
    
    /**
     * 有关平台的一些状态定义
     *  3*/
    Integer STATUES_THERE = 3;
   
    /**
     * 有关平台的一些状态定义
     * 4
     */
    Integer STATUES_FOUR = 4;
    
    /**
     * 有关平台的一些状态定义
     * 5
     */
    Integer STATUES_FIVE = 5;
    /**有关平台的一些状态定义
     * 6
     */
    Integer STATUES_SIX = 6;
    /**有关平台的一些状态定义
     * 7*/
    Integer STATUES_SEVEN = 7;
    /**有关平台的一些状态定义
     * 8
     * */
    Integer STATUES_EIGHT = 8;
    /**有关平台的一些状态定义
     * 9
     * */
    Integer STATUES_NINE = 9;
    /**有关平台的一些状态定义
     * 10
     * */
    Integer SRSRUES_TEN = 10;
    /**有关平台的一些状态定义
     * 11
     * */
    Integer SRSRUES_ELEVEN = 11;


    /** 逾期利息(该逾期利息由平台定义)*/
    Double OVERDUE_INTEREST = 0.02;


    /**产品的计算公式*/
    String FORMULA = "((投资金额*客户年化收益率)/365)*期限(天)";

    /**宝付返回成功码*/

   String BF_SUCCESS = "CSD000";
    /**操作成功*/
    String SUCCESS = "MG00000F";
    /***/
    String FAILURE = "MG00008F";
    /**标的新增*/
    String ADD_LOANSIGN="MG02500F";
    /**转账受理*/
    String Transfer_Accepted="MG00008F";
    /**转账成功*/
    String Transfer_Success="MG00000F";
    /**标的募集中*/
    String OP_LOANSIGN="MG02501F";
    
    /**标的失败*/
    String FAIL_LOANSIGN="MG02504F";
    
    /**标的结束，处理中*/
    String ENDING_LOANSIGN="MG02503F";
    /**标的结束，处理中*/
    String ENDED_LOANSIGN="MG02505F";
    
    /**短信失效毫秒数*/
    Long MILLISECONDS = 2 * 60 * 1000l;
    
//    WebService请求
    /**转账*/
    String TRANSFER="Transfer";
    /**银行列表*/
    String GET_BANK_LIST="GetBankList";
    /**账户余额查询*/
    String QUERY_FOR_ACCBALANCE="QueryForAccBalance";
    /**解冻保证金*/
    String GUARANTEE_UNFREEZE="GuaranteeUnfreeze";
    /**查询托管用户信息**/
    String QUERY_MER_USER_INFO="QueryMerUserInfo";
    /**
     * 前台环讯返回地址
     */
    String WEB_URL = ParameterIps.getWeburl();
    /**充值*/
    String RECHARGEURL = WEB_URL+"return/recharge.htm";
    String ASYNCHRONISMRECHARGE = WEB_URL+ "return/asynchronismRecharge.htm";
    /**用户注册*/
    String REGISTRATION = WEB_URL+"return/registration.htm";
    String ASYNCHRONISMREGISTRATION = WEB_URL+"return/asynchronismRegistration.htm";
    /**提现*/
    String WITHDRAWAL = WEB_URL+"return/withdrawal.htm";
    String WITHDRAWASYNCHRONOUS = WEB_URL+"return/withdrawAsynchronous.htm";
    /**还款*/
    String REPAYMENT = WEB_URL+"return/repayment.htm";
    String REPAYMENTASYNCHRONOUS=WEB_URL+"return/repaymentAsynchronous.htm";
    /**投标*/
    String BID = WEB_URL+"return/returnBid.htm?orderId=";
    String ASYNCHRONISMBID = WEB_URL+"return/asynchronismBid.htm";
    /**债权转让投标*/
    String BIDASSIGNMENT=WEB_URL+"plank/returnBidAssignment.htm";
    String ASYNCHRONISMBIDASSIGNMENT = WEB_URL+"processing/asynchronismBidAssignment.htm";
    /**放款*/
    String LOANS = WEB_URL+"processing/loans.htm";
    /**债权转让放款*/
    String LOANSASSIGNMENT = WEB_URL+"processing/loansAssignment.htm";    
    /**结束*/
    String REGISTER_SUBJECT=WEB_URL+"baseLoanSign/pubback.htm";
    String REGISTER_SUBJECT_ASYNCHRONOUS=WEB_URL+"processing/pubback.htm";
    
    /**自动投标规则*/
    String AUTOMATIC=WEB_URL+"plank/returnAutomatic.htm";
    String ASYNCHRONISMAUTOMATIC = WEB_URL+"processing/asynchronismAutomatic.htm";
    /**自动还款签约*/
    String REPAYMENT_SIGN=WEB_URL+"processing/returnRepaymentSign.htm";
    String REPAYMENT_SIGN_ASYNCHRONOUS=WEB_URL+"processing/asynchronismRepaymentSign.htm";
    /**解冻保证金*/
    String GUARANTEE_UNFREEZE_ASYNCHRONOUS=WEB_URL+"processing/guaranteeUnfreezeAsynchronous";
    
    /**
     * 债权匹配锁定时间
     */
    int TIME_CREDITOR_LOCK_MATCH = 2;//分钟
    
    /**
     * 债权购买锁定时间
     */
    int TIME_CREDITOR_LOCK_PAY = 20;//分钟
    
    /**
     * WEBURL
     */
    String WEBURL = WEB_URL+"WEB-INF/operating.jsp";
    
    /**
     * PROJECT_NAME
     */
    String PROJECT_NAME = "太平洋理财";
    /**
     * SYSTEM_EXCEPTION_RECEIVE
     */
    String[] SYSTEM_EXCEPTION_RECEIVE = {"2306516759@qq.com"};
    
    /**
     * 后台环讯回调地址
     */
    /**后台债权人注册*/
    String REGISTRATIONBACKSTAGE = WEB_URL+"processing/ipsCallback.htm";
    /**后台债权人充值*/
    String RECHARGEURLBACKSTAGE = WEB_URL+"processing/rechargeProessing.htm";
    /**后台债权人提现*/
    String WITHDRAWALBACKSTAGE = WEB_URL+"processing/withdrlwalProessing.htm";
    /**
     * 用来判断是否通过安全验证
     */
    String SECURITY_VERIFIY = "security_verifiy";
    /**
     * 前台充值记录中的列表分页大小
     */
    public static final int PAGE_SIZE_RECHARGE_RECORD = 10;
    
    String NEW_BID="新标上线";
    String END_BID="标的结束";
}
