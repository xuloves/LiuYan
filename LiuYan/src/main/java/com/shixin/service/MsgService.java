package com.shixin.service;

import com.shixin.entity.Msg;
import com.shixin.entity.User;

import java.util.List;

/**
 * @author 今何许
 * @date 2020/6/9 21:15
 */
public interface MsgService {
    List<Msg> findAllByUser(User user);

    int addMsg(Msg msg);

    int deleteMsgById(Integer id);

    Msg findMsgById(Integer id);

    List<Msg> findMsgs();

    void updateMsg(String mid);
}
