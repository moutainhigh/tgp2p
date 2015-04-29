package com.tpy.base.util;

import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 
 * @author  wdai_admin
 *
 */
public class CommonUtils {

	/**
	 * 
	 */
	public static final String UTF8 = "UTF-8" ;
	
	@SuppressWarnings("rawtypes")
	public static final List EMPTY_LIST = new ArrayList();
	
	@SuppressWarnings("rawtypes")
	public static final Map EMPTY_MAP = new HashMap();
	
	/**
	 * 
	 * @param input
	 * @return
	 */
	public static boolean isEmpty(String input) {
		return input==null || input.trim().isEmpty() ;
	}
	
	/**
	 * 
	 * @param input
	 * @return
	 */
	public static String emptyIfNull(String input) {
		return input==null ? "" : input.trim() ;
	}
	
	public static String emptyIfNull(Object input){
		return input==null ? "" : input.toString().trim() ;
	}
	
	/**
	 * 
	 * @param input
	 * @param def
	 * @return
	 */
	public static String emptyIfNull(String input, String def) {
		input = emptyIfNull(input) ;
		return input.isEmpty() ? def : input ;
	}
	
	
	public static int parseInt(Object data, int def) {
		if(data!=null)
		{
			try
			{
				return (data instanceof Integer) ? ((Integer)data).intValue() : Integer.valueOf(String.valueOf(data)) ;
			} catch(Exception e){} ;
		}
		return def ;
	}

	
	public static long parseLong(Object data, long def) {
		if(data!=null)
		{
			try
			{
				return (data instanceof Long) ? ((Long)data).longValue() : Long.valueOf(String.valueOf(data)) ;
			} catch(Exception e){} ;
		}
		return def ;
	}
	
	public static double parseDouble(Object data, double def) {
		if(data!=null)
		{
			try
			{
				double value = def ;
				if(data!=null) {
					if(data instanceof BigDecimal){
						value = ((BigDecimal) data).doubleValue() ;
					} else if(data instanceof Double) {
						value = ((Double) data).doubleValue() ;
					}else{
						value = Double.valueOf(String.valueOf(data));
					}
				}
				return value==0 ? 0 : MathUtils.roundHalfUp(value) ;
			} catch(Exception e){} ;
		}
		return def ;
	}
	
	/**
	 * 
	 * @param array
	 * @return
	 */
	public static boolean isEmpty(Object[] array) {
		return array==null || array.length==0 ;
	}
	
	
	/**
	 * 
	 * @param c
	 * @return
	 */
	public static boolean isEmpty(Collection<?> c) {
		return c==null || c.isEmpty() ;
	}
	
	/**
	 * 
	 * @return
	 */
    @SuppressWarnings("unchecked")
	public static <T> List<T> emptyList() {
    	return (List<T>) EMPTY_LIST;
    }
    
    
    /**
     * 
     * @param list
     * @return
     */
    @SuppressWarnings("unchecked")
	public static <T> List<T> emptyList(List<T> list) {
    	return (List<T>) (list==null ? emptyList() : list) ;
    }
    
    
    /**
     * 
     * @param map
     * @return
     */
    public static boolean isEmpty(Map<?,?> map) {
    	return map==null || map.isEmpty() ;
    }

    /**
     * 
     * @return
     */
    @SuppressWarnings("unchecked")
	public static <K,V> Map<K,V> emptyMap() {
	return (Map<K,V>) EMPTY_MAP;
    }

    /**
     * 
     * @param map
     * @return
     */
    @SuppressWarnings("unchecked")
	public static <K,V> Map<K,V> emptyMap(Map<K,V> map) {
    	return map == null ? EMPTY_MAP : map ;
    }
    
	public static <K,V> Map<K,V> stableMap(int size) {
    	return new HashMap<K, V>(size, 1.0f) ;
    }
    
	
	@SuppressWarnings("unchecked")
	public static <T> T getValue(Map<String, ?> dataMap, String key) {
		Object value = dataMap.get(key) ;
		return value==null ? null : (T)value ;
	}
    
	/**
	 * 
	 * @param t
	 * @return
	 */
	public static IllegalStateException illegalStateException(Throwable t) {
		return new IllegalStateException(t) ;
	}
	
	/**
	 * 
	 * @param message
	 * @return
	 */
	public static IllegalStateException illegalStateException(String message) {
		return new IllegalStateException(message) ;
	}
	
	/**
	 * 
	 * @param message
	 * @param t
	 * @return
	 */
	public static IllegalStateException illegalStateException(String message, Throwable t) {
		return new IllegalStateException(message, t) ;
	}
	
	
	
	/**
	 * 
	 * @param message
	 * @return
	 */
	public static IllegalArgumentException illegalArgumentException(String message) {
		return new IllegalArgumentException(message) ;
	}
	
	
	/**
	 * 
	 * @return
	 */
	public static UnsupportedOperationException unsupportedMethodException(){
		return new UnsupportedOperationException("unsupport this method");
	}
	
	
	public static Throwable foundRealThrowable(Throwable t) {
		Throwable cause = t.getCause() ;
		if(cause==null) return t ;
		return foundRealThrowable(cause) ;
	}
	/**
	 * 格式化异常
	 * @param t
	 * @return
	 */
	public static String formatThrowable(Throwable t) {
		if (t == null) return "";
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		t.printStackTrace(pw);
		pw.flush();
		sw.flush();
		return sw.toString();
	}
	
	public static String formatThrowableForHtml(Throwable t) {
		String ex = formatThrowable(t) ;
		return ex.replaceAll("\n\t", " ") ;
	}
	/**
	 * 实例化对象,注意该对象必须有无参构造函数
	 * 
	 * @param klass
	 * @return
	 */
	public static <T> T newInstance(Class<T> klass) {
		try {
			return (T) klass.newInstance();
		} catch (Exception e){ throw new IllegalArgumentException("instance class[" + klass + "] with ex:", e); }
	}

	
	
	/**
	 * 
	 * @param className
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T newInstance(String className) {
		try {
			return (T) newInstance(Class.forName(className)) ;
		} catch (Exception e){ throw new IllegalArgumentException("instance class[" + className + "] with ex:", e); }
	}
	
	
	/**
	 * 
	 * @param className
	 * @return
	 */
	public static Class<?> classForName(String className) {
		try {
			return Class.forName(className);
		} catch (Exception e){ throw new IllegalArgumentException("classForName(" + className + ")  with ex:", e); }
	}

	/**
	 * 
	 * @param input
	 * @return
	 */
	public static String urlDecodeUTF8(String input) {
		try
		{
			return input==null ? null : URLDecoder.decode(input, UTF8) ;
		}catch(Exception e){throw illegalStateException(e);}
	}
	
	
	/**
	 * 
	 * @param input
	 * @return
	 */
	public static String urlEncodeUTF8(String input) {
		try
		{
			return input==null ? null : URLEncoder.encode(input, UTF8) ;
		}catch(Exception e){throw illegalStateException(e);}
	}

	
	public static  <K,V> void putIfNotNull(Map<K,V>  map, K key, V value) {
		if(map!=null && key!=null && value !=null) map.put(key, value) ;
	}

	/**
	 * 
	 * @param list
	 * @return
	 */
	public static int sizeOfList(List<?> list) {
		return list==null ? 0 : list.size() ;
	}
	
	
	/**
	 * 
	 * @param filename
	 * @return
	 */
	public static InputStream getInputStreamFromClassPath(String filename) {
		return CommonUtils.isEmpty(filename) ? null : CommonUtils.class.getClassLoader().getResourceAsStream(filename);
	}
	
	/**
	 * 过滤html标签和部分特殊字符
	 * @param content
	 * @return
	 */
	public static String filterHtml(String content){
		if(CommonUtils.isEmpty(content))return null;
		
		Map<String,String> regs=new HashMap<String, String>();
		regs.put("<([^>]*)>", "");
		regs.put("(&nbsp;)", " ");
		regs.put("(&apos;)", "'");
		regs.put("(&quot;)", "\"");
		regs.put("(&ldquo;)", "“");
		regs.put("(&rdquo;)", "”");
		regs.put("(&lt;)", "<");
		regs.put("(&gt;)", ">");
		regs.put("(&ndash;)", "-");

		Pattern p=null;
		Matcher m=null;
		for(Map.Entry<String, String> entry:regs.entrySet()){
			p = Pattern.compile(entry.getKey(), Pattern.CASE_INSENSITIVE); //横杠
			m = p.matcher(content);
			content=m.replaceAll(entry.getValue());
		}
		
		return content;
	}
}
