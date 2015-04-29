package com.tpy.base.util;

import java.io.File;
import java.util.*;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;

import com.jubaopen.commons.LOG;

public class EmailUtils{
	public static final String contentType = "text/html;charset=UTF-8";
    public EmailUtils()
    {
    }

    public static void sendEmail(Session session, Date date, String address_from, String subject, String context, String type, BodyPart bodyParts[], Address address_tos[])
    {
        MimeMessage message = new MimeMessage(session);
        try
        {
            message.setSubject(subject);
            message.setSentDate(date);
            message.setFrom(new InternetAddress(address_from));
            message.addRecipients(javax.mail.Message.RecipientType.TO, address_tos);
            if(bodyParts == null || bodyParts.length == 0)
            {
                message.setContent(context, type);
            } else
            {
                Multipart multipart = new MimeMultipart();
                BodyPart content = new MimeBodyPart();
                content.setContent(context, type);
                multipart.addBodyPart(content);
                BodyPart abodypart[];
                int j = (abodypart = bodyParts).length;
                for(int i = 0; i < j; i++)
                {
                    BodyPart bodyPart = abodypart[i];
                    multipart.addBodyPart(bodyPart);
                }

                message.setContent(multipart);
            }
            Transport.send(message);
        }
        catch(AuthenticationFailedException e)
        {
            LOG.error("用户名或密码错误！", e);
        }
        catch(MessagingException e)
        {
            LOG.error("设置邮件内容失败！", e);
        }
        catch(Exception e)
        {
            LOG.error("发送邮件失败！", e);
        }
    }

    public static void sendEmail(Session session, Date date, String address_from, String subject, String context, String type, Collection names, Collection filePathNames, String address[]){
        BodyPart bodyParts[] = null;
        if(names != null && filePathNames != null && names.size() > 0 && filePathNames.size() > 0)
        {
            bodyParts = new MimeBodyPart[names.size()];
            int i = 0;
            Iterator iterator_names = names.iterator();
            Iterator iterator_filePathNames = filePathNames.iterator();
            try
            {
                while(iterator_names.hasNext() && iterator_filePathNames.hasNext()) 
                {
                    bodyParts[i] = new MimeBodyPart();
                    bodyParts[i].setFileName((String)iterator_names.next());
                    bodyParts[i].setDataHandler(new DataHandler(new FileDataSource(new File((String)iterator_filePathNames.next()))));
                }
            }
            catch(Exception e)
            {
                LOG.error("文件路径错误，指定文件未找到！", e);
            }
        }
        Address address_tos[] = new Address[address.length];
        try
        {
            for(int i = 0; i < address.length; i++)
                address_tos[i] = new InternetAddress(address[i]);

        }
        catch(AddressException e)
        {
            LOG.error("邮箱地址不存在！", e);
        }
        sendEmail(session, date, address_from, subject, context, type, bodyParts, address_tos);
    }

   
}