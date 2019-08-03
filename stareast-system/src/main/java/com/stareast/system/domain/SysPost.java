package com.stareast.system.domain;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.stareast.common.annotation.Excel;
import com.stareast.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * 岗位表 sys_post
 *
 * @author stareast
 */
@EqualsAndHashCode(callSuper = true)
@ToString
@Data
public class SysPost extends BaseEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 岗位序号
     */
    @Excel(name = "岗位序号")
    @TableId
    private Long postId;

    /**
     * 岗位编码
     */
    @Excel(name = "岗位编码")
    private String postCode;

    /**
     * 岗位名称
     */
    @Excel(name = "岗位名称")
    private String postName;

    /**
     * 岗位排序
     */
    @Excel(name = "岗位排序")
    private String postSort;

    /**
     * 状态（0正常 1停用）
     */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /**
     * 用户是否存在此岗位标识 默认不存在
     */
    @TableField(exist=false)
    private boolean flag = false;
}
