package com.liu.service.impl;

import com.liu.entity.user.User;
import com.liu.mapper.UserMapper;
import com.liu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

/**
 * @Auther: Administrator
 * @Date: 2019/5/26 20:08
 * @Description:
 */
@Service(value = "userService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    PasswordHelper passwordHelper;

    @Override
    public int createUser(User user) {
        //加密密码
        passwordHelper.encryptPassword(user);
        return userMapper.createUser(user);
    }
    @Override
    public void changePassword(Long userId, String newPassword) {
        User user =userMapper.findOne(userId);
        user.setPassword(newPassword);
        passwordHelper.encryptPassword(user);
        userMapper.updateUser(user);
    }

    @Override
    public int correlationRoles(Long userId, Long... roleIds) {
        return userMapper.correlationRoles(userId, roleIds);
    }


    @Override
    public void uncorrelationRoles(Long userId, Long... roleIds) {
        userMapper.uncorrelationRoles(userId, roleIds);
    }

    @Override
    public User findByUsername(String username) {
        return userMapper.findByUsername(username);
    }

    @Override
    public Set<String> findRoles(String username) {
        return userMapper.findRoles(username);
    }

    @Override
    public Set<String> findPermissions(String username) {
        return userMapper.findPermissions(username);
    }


}
