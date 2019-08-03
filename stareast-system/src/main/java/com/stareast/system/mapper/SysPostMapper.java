package com.stareast.system.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.stareast.system.domain.SysPost;

/**
 * 岗位信息 数据层
 *
 * @author stareast
 */
public interface SysPostMapper extends BaseMapper<SysPost> {
    /**
     * 根据用户ID查询岗位
     *
     * @param userId 用户ID
     * @return 岗位列表
     */
    List<SysPost> selectPostsByUserId(Long userId);

}
