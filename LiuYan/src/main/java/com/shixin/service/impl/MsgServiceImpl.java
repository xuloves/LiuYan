package com.shixin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.shixin.dao.MsgDao;
import com.shixin.entity.Msg;
import com.shixin.entity.User;
import com.shixin.service.MsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 今何许
 * @date 2020/6/9 21:15
 */
@Service
public class MsgServiceImpl implements MsgService {
    @Autowired
    private MsgDao msgDao;

    /**
     * 根据登录用户查找有关留言
     */
    @Override
    public List<Msg> findAllByUser(User user) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("sender", user.getUsername());
        wrapper.or();
        wrapper.eq("receiver", user.getUsername());

        wrapper.orderByDesc("date");
        return msgDao.selectList(wrapper);
    }

    /**
     * 增加留言
     */
    @Override
    public int addMsg(Msg msg) {
        return msgDao.insert(msg);
    }

    /**
     * 根据id删除留言
     */
    @Override
    public int deleteMsgById(Integer id) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("id", id);
        return msgDao.delete(wrapper);
    }

    /**
     * 根据id查找留言
     */
    @Override
    public Msg findMsgById(Integer id) {
        return msgDao.selectById(id);
    }

    /**
     * 根据所有留言
     */
    @Override
    public List<Msg> findMsgs() {
        return msgDao.selectList(null);
    }

    /**
     * 更新留言回复
     */
    @Override
    public void updateMsg(String mid) {
        Msg msg = msgDao.selectById(mid);
        int count = msg.getCount() + 1;
        msg.setCount(count);
        msgDao.updateById(msg);
    }
}
