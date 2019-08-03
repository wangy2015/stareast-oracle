package com.stareast.web.controller.system;

import java.util.List;
import java.util.Map;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.stareast.common.annotation.Log;
import com.stareast.common.base.Result;
import com.stareast.common.enums.BusinessType;
import com.stareast.common.utils.StringUtils;
import com.stareast.framework.web.base.BaseController;
import com.stareast.system.domain.SysDept;
import com.stareast.system.domain.SysRole;
import com.stareast.system.service.ISysDeptService;

/**
 * 部门信息
 *
 * @author stareast
 */
@Controller
@RequestMapping("/system/dept")
public class SysDeptController extends BaseController {
    private String prefix = "system/dept";

    private final ISysDeptService deptService;

    @Autowired
    public SysDeptController(ISysDeptService deptService) {
        this.deptService = deptService;
    }

    /**
     * 部门列表页面
     * @return
     */
    @RequiresPermissions("system:dept:view")
    @GetMapping()
    public String dept() {
        return prefix + "/dept";
    }

    /**
     * 新增部门页面
     */
    @GetMapping("/add/{parentId}")
    public String add(@PathVariable("parentId") Long parentId, ModelMap mmap) {
        mmap.put("dept", deptService.getById(parentId));
        return prefix + "/add";
    }

    /**
     * 修改部门页面
     */
    @GetMapping("/edit/{deptId}")
    public String edit(@PathVariable("deptId") Long deptId, ModelMap mmap) {
        SysDept dept = deptService.getById(deptId);
        if (StringUtils.isNotNull(dept) && 100L == deptId) {
            dept.setParentName("无");
        }
        mmap.put("dept", dept);
        return prefix + "/edit";
    }

    /**
     * 选择部门树页面
     */
    @GetMapping("/selectDeptTree/{deptId}")
    public String selectDeptTree(@PathVariable("deptId") Long deptId, ModelMap mmap) {
        mmap.put("dept", deptService.getById(deptId));
        return prefix + "/tree";
    }

    @RequiresPermissions("system:dept:list")
    @GetMapping("/list")
    @ResponseBody
    public List<SysDept> list(SysDept dept) {
        List<SysDept> deptList = deptService.list(dept);
        return deptList;
    }

    /**
     * 新增保存部门
     */
    @Log(title = "部门管理", businessType = BusinessType.INSERT)
    @RequiresPermissions("system:dept:add")
    @PostMapping("/add")
    @ResponseBody
    public Result addSave(SysDept dept) {
        deptService.save(dept);
        return Result.success();
    }

    /**
     * 保存
     */
    @Log(title = "部门管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("system:dept:edit")
    @PostMapping("/edit")
    @ResponseBody
    public Result editSave(SysDept dept) {
        deptService.updateById(dept);
        return Result.success();
    }

    /**
     * 删除
     */
    @Log(title = "部门管理", businessType = BusinessType.DELETE)
    @RequiresPermissions("system:dept:remove")
    @PostMapping("/remove/{deptId}")
    @ResponseBody
    public Result remove(@PathVariable("deptId") Long deptId) {
        if (deptService.selectDeptCount(deptId) > 0) {
            return Result.failed("存在下级部门,不允许删除");
        }
        if (deptService.checkDeptExistUser(deptId)) {
            return Result.failed("存在下级部门,不允许删除");
        }
        deptService.deleteDeptById(deptId);
        return Result.success();
    }

    /**
     * 校验部门名称
     */
    @PostMapping("/checkDeptNameUnique")
    @ResponseBody
    public Result checkDeptNameUnique(SysDept dept) {
        return deptService.checkDeptNameUnique(dept)? Result.success():Result.failed();
    }

    /**
     * 加载部门列表树
     */
    @GetMapping("/treeData")
    @ResponseBody
    public List<Map<String, Object>> treeData() {
        List<Map<String, Object>> tree = deptService.selectDeptTree(new SysDept());
        return tree;
    }

    /**
     * 加载角色部门（数据权限）列表树
     */
    @GetMapping("/roleDeptTreeData")
    @ResponseBody
    public List<Map<String, Object>> deptTreeData(SysRole role) {
        List<Map<String, Object>> tree = deptService.roleDeptTreeData(role);
        return tree;
    }
}
