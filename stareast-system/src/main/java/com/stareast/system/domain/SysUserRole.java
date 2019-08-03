package com.stareast.system.domain;

import lombok.Data;
import lombok.ToString;

/**
 * 用户和角色关联 sys_user_role
 *
 * @author stareast
 */
@ToString
@Data
public class SysUserRole {
    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 角色ID
     */
    private Long roleId;
}
