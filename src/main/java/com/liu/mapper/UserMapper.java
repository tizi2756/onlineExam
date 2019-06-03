package com.liu.mapper;

import com.liu.entity.user.Permission;
import com.liu.entity.user.Role;
import com.liu.entity.user.User;
import org.apache.ibatis.annotations.Param;

import java.util.Set;

/**
 * @Auther: Administrator
 * @Date: 2019/5/25 17:34
 * @Description:
 */
public interface UserMapper {
    public int createUser(User user);
    public void updateUser(User user);
    public void deleteUser(Long id);

    public int correlationRoles(@Param("userId") Long userId, @Param("roleIds") Long... roleIds);
    public void uncorrelationRoles(@Param("userId") Long userId, @Param("roleIds") Long... roleIds);

    User findOne(Long id);

    User findByUsername(String username);

    Set<String> findRoles(String username);

    Set<String> findPermissions(String username);

    //角色
    public int createRole(Role role);
    public void deleteRole(Long roleId);

    public int correlationPermissions(@Param("roleId") Long roleId, @Param("permissionIds") Long... permissionIds);
    public void uncorrelationPermissions(@Param("roleId") Long roleId, @Param("permissionIds") Long... permissionIds);

    //权限
    public int createPermission(Permission permission);

    public void deletePermission(Long permissionId);
}
