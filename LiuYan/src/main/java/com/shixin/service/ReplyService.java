package com.shixin.service;

import com.shixin.entity.Reply;

import java.util.List;

/**
 * @author 今何许
 * @date 2020/6/10 21:10
 */
public interface ReplyService {
    List<Reply> findAllReplyById(Integer id);

    int addReply(Reply reply);

}
