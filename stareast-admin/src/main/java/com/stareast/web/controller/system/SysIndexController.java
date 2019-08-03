package com.stareast.web.controller.system;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import com.stareast.common.config.Global;
import com.stareast.framework.web.base.BaseController;
import com.stareast.system.domain.SysMenu;
import com.stareast.system.domain.SysUser;
import com.stareast.system.service.ISysMenuService;

/**
 * 首页 业务处理
 *
 * @author stareast
 */
@Controller
public class SysIndexController extends BaseController {
    private final ISysMenuService menuService;

    @Autowired
    public SysIndexController(ISysMenuService menuService) {
        this.menuService = menuService;
    }

    /**
     * 系统首页
      */
    @GetMapping("/index")
    public String index(ModelMap mmap) {
        // 取身份信息
        SysUser user = getSysUser();
        if (user.getAvatar() == null) {
            user.setAvatar("");
        }
        // 根据用户id取出菜单
        List<SysMenu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("copyrightYear", Global.getCopyrightYear());
        return "index";
    }

    /**
     * 系统介绍
     */
    @GetMapping("/system/main")
    public String main(ModelMap mmap) {
        mmap.put("version", Global.getVersion());
        return "main";
    }
}
