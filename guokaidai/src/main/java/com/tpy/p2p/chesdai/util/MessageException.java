package com.tpy.p2p.chesdai.util;


/**
 * 用于传递消息的异常
 * 
 * @author  wdai_admin
 *
 */
public class MessageException extends RuntimeException {
	private static final long serialVersionUID = -102324565904130269L;
	
	
    public MessageException(String message) {
    	super(message);
    }
	
    public MessageException(Throwable cause) {
        super(cause);
    }
    
    
    /**
	 * 
	 * @param message
	 * @return
	 */
	public static MessageException newMessageException(String message) {
		return new MessageException(message) ;
	}
}
