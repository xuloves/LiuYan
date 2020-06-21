package com.shixin.controller;

import com.alibaba.druid.util.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shixin.entity.Msg;
import com.shixin.entity.Result;
import com.shixin.entity.User;
import com.shixin.exception.SysException;
import com.shixin.service.MsgService;
import com.shixin.service.UserService;
import com.shixin.utils.Consts;
import com.shixin.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author 今何许
 * @date 2020/6/11 14:58
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private MsgService msgService;

    @RequestMapping("/login")
    public String login() {
        return "admin/login";
    }

    @RequestMapping("/index")
    public String index(Model model,
                        @RequestParam(value = "page", defaultValue = "1") int page) {
        PageHelper.startPage(page, 4);
        List<Msg> msgs = msgService.findMsgs();
        PageInfo<Msg> p = new PageInfo<Msg>(msgs);
        model.addAttribute("page", p);
        model.addAttribute("msgs", msgs);
        return "admin/index";
    }

    @RequestMapping("/login.json")
    @ResponseBody
    public Result adminLogin(HttpServletRequest request) throws SysException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            throw new SysException("用户名或密码不能为空");
        }
        User user = userService.findUser(username, MD5Util.md5(password, Consts.SALT));
        if (user == null) {
            throw new SysException("用户名或密码不正确");
        }
        if (user.getPrivilege() == 0) {
            throw new SysException("用户名或密码不正确");
        }
        request.getSession().setAttribute("user", user);
        return Result.success("登录成功！");
    }

    @RequestMapping("/userinfo")
    public String userinfo(Model model,
                           @RequestParam(value = "page", defaultValue = "1") int page) {
        PageHelper.startPage(page, 4);
        List<User> users = userService.findUserInfo();
        PageInfo<User> p = new PageInfo<User>(users);
        model.addAttribute("page", p);
        model.addAttribute("users", users);
        return "admin/userinfo";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") Integer id) throws SysException {
        int i = msgService.deleteMsgById(id);
        if (i == 0) {
            throw new SysException("删除失败！");
        }
        return "redirect:/admin/index";
    }

    @RequestMapping("/update")
    public String update(@RequestParam("username") String username) throws SysException {
        int i = userService.updatePrivilege(username);
        if (i == 0) {
            throw new SysException("升级失败！");
        }
        return "redirect:/admin/userinfo";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }
}
