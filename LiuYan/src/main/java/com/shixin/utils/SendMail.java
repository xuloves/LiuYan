package com.shixin.utils;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

/**
 * @author 今何许
 * @date 2020/6/21 20:37
 */
public class SendMail {
    public static void send(String to, String subject, String msg) throws MessagingException {
        /*
         * 初始化JavaMail会话
         */
        Properties props = System.getProperties();
        // 获得系统属性配置，用于连接邮件服务器的参数配置
        props.setProperty("mail.smtp.host", Consts.MAIL_HOST);
        // 发送邮件的主机
        props.setProperty("mail.smtp.auth", "true");

        Session session = Session.getInstance(props, null);
        // 获得Session对象
        session.setDebug(true);

        /*
         * 创建邮件消息，发送邮件
         */
        Message message = new MimeMessage(session);

        message.setFrom(new InternetAddress(Consts.FROM));


        // To: 收件人

        message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(to, false));


        message.setSubject(subject); // 邮件标题

        message.setText(msg); // 邮件内容

        // 简单发送邮件的方式
        Transport.send(message, Consts.FROM, Consts.PASSWORD);

    }

    public static String randomNum() {
        Random random = new Random();
        String result = "";
        for (int i = 0; i < 6; i++) {
            result += random.nextInt(10);
        }
       return result;
    }


}
