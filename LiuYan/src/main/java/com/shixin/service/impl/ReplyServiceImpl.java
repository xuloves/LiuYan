package com.shixin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.shixin.dao.ReplyDao;
import com.shixin.entity.Reply;
import com.shixin.service.MsgService;
import com.shixin.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author 今何许
 * @date 2020/6/10 21:10
 */
@Service
public class ReplyServiceImpl implements ReplyService {
    @Autowired
    private ReplyDao replyDao;
    @Autowired
    private MsgService msgService;

    /**
     * 根据留言id查询有关回复
     */
    @Override
    public List<Reply> findAllReplyById(Integer id) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("mid", id);
        wrapper.orderByAsc("date");
        return replyDao.selectList(wrapper);
    }

    /**
     * 增加回复
     */
    @Override
    public int addReply(Reply reply) {
        msgService.updateMsg(reply.getMid());
        return replyDao.insert(reply);
    }

}
