package com.shixin.controller;

import com.alibaba.druid.util.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shixin.entity.Msg;
import com.shixin.entity.Result;
import com.shixin.entity.User;
import com.shixin.exception.SysException;
import com.shixin.service.MsgService;
import com.shixin.service.ReplyService;
import com.shixin.service.UserService;
import com.shixin.utils.Consts;
import com.shixin.utils.MD5Util;
import com.shixin.utils.SendMail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author 今何许
 * @date 2020/6/9 19:38
 */
@Controller
public class UserController {
    @Autowired
    private MsgService msgService;
    @Autowired
    private UserService userService;
    @Autowired
    HttpSession session;

    @RequestMapping("/index")
    public String index(ModelMap map,
                        @RequestParam(value = "page", defaultValue = "1") int page) {
        User user = (User) session.getAttribute("user");
        PageHelper.startPage(page, 4);
        List<Msg> msgs = msgService.findAllByUser(user);
        PageInfo<Msg> p = new PageInfo<Msg>(msgs);
        map.addAttribute("page", p);
        map.addAttribute("msgs", msgs);
        return "view/index";
    }

    @RequestMapping("/login")
    public String login() {
        return "view/login";
    }

    @RequestMapping("/forget")
    public String forget() {
        return "view/forget";
    }


    @RequestMapping("/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/login";
    }

    @RequestMapping("/register")
    public String toRegister() {
        return "view/register";
    }

    @RequestMapping("/register.json")
    @ResponseBody
    public Result register(HttpServletRequest request) throws SysException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            throw new SysException("用户名或密码不能为空");
        }
        User user = userService.isExist(username);
        if (user != null) {
            throw new SysException("用户已经存在");
        }
        userService.addUser(username, MD5Util.md5(password, Consts.SALT), email);
        return Result.success("注册成功！");

    }

    @RequestMapping("/login.json")
    @ResponseBody
    public Result login(HttpServletRequest request) throws SysException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            throw new SysException("用户名或密码不能为空");
        }
        User user = userService.findUser(username, MD5Util.md5(password, Consts.SALT));
        if (user == null) {
            throw new SysException("用户名或密码不正确");
        }
        request.getSession().setAttribute("user", user);
        return Result.success("登录成功！");
    }

    @RequestMapping("/forget.json")
    @ResponseBody
    public Result forget(HttpServletRequest request) throws SysException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        System.out.println(email);
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(email)) {
            throw new SysException("用户名或邮箱不能为空");
        }
        User user = userService.isExist(username);
        System.out.println(user);
        if (user == null) {
            throw new SysException("用户名不正确");
        }
        if (!email.equals(user.getEmail())) {
            throw new SysException("邮箱不正确");
        }
        String password = SendMail.randomNum();
        try {
            SendMail.send(email, Consts.SUBJECT, Consts.TEXT + password);
        } catch (MessagingException e) {
            throw new SysException("重置失败！");
        }
        return Result.success("重置成功，请查收邮箱！");
    }

    @RequestMapping("/toadmin.json")
    @ResponseBody
    public Result ltoAdmin() throws SysException {
        User user = (User) session.getAttribute("user");
        if (user.getPrivilege() == 1) {
            return Result.success("登录成功！");
        } else {
            throw new SysException("暂无权限");
        }

    }


}
