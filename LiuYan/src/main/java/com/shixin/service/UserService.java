package com.shixin.service;

import com.shixin.entity.User;

import java.util.List;

/**
 * @author 今何许
 * @date 2020/6/9 21:14
 */
public interface UserService {
    User isExist(String username);

    void addUser(String username, String password, String email);

    void updatePwd(User user);

    User findUser(String username, String password);

    List<User> findAll(String username);

    List<User> findUserInfo();

    int updatePrivilege(String username);
}
