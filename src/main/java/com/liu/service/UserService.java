package com.liu.service;

import com.liu.entity.user.User;

import java.util.Set;

/**
 * @Auther: Administrator
 * @Date: 2019/5/26 20:28
 * @Description:
 */
public interface UserService {
    int createUser(User user);

    void changePassword(Long userId, String newPassword);

    int correlationRoles(Long userId, Long... roleIds);

    void uncorrelationRoles(Long userId, Long... roleIds);

    User findByUsername(String username);

    Set<String> findRoles(String username);

    Set<String> findPermissions(String username);
}
