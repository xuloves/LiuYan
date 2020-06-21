package com.shixin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.shixin.dao.UserDao;
import com.shixin.entity.User;
import com.shixin.service.UserService;
import com.shixin.utils.Consts;
import com.shixin.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 今何许
 * @date 2020/6/9 21:14
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    /**
     * 注册查询判断是否已注册
     */
    @Override
    public User isExist(String username) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("username", username);
        return userDao.selectOne(wrapper);
    }

    /**
     * 注册
     */
    @Override
    public void addUser(String username, String password, String email) {
        User user = new User(username, password, 0, email);
        userDao.insert(user);
    }


    /**
     * 根据账号密码查询，登录
     */
    @Override
    public User findUser(String username, String password) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("username", username);
        wrapper.eq("password", password);
        return userDao.selectOne(wrapper);
    }

    /**
     * 查询所有，除username以外的
     */
    @Override
    public List<User> findAll(String username) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.ne("username", username);
        return userDao.selectList(wrapper);
    }

    /**
     * 查询所有
     */
    @Override
    public List<User> findUserInfo() {
        return userDao.selectList(null);
    }

    /**
     * 升级权限
     */
    @Override
    public int updatePrivilege(String username) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("username", username);
        User user = new User();
        user.setPrivilege(1);
        return userDao.update(user, wrapper);
    }

    /**
     * 更新密码
     */
    @Override
    public void updatePwd(User user) {
        userDao.updateById(user);
    }
}
