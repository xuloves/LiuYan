package com.shixin.controller;

import com.shixin.entity.Msg;
import com.shixin.entity.Reply;
import com.shixin.entity.Result;
import com.shixin.entity.User;
import com.shixin.exception.SysException;
import com.shixin.service.MsgService;
import com.shixin.service.ReplyService;
import com.shixin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author 今何许
 * @date 2020/6/9 19:38
 */
@Controller
@RequestMapping("/msg")
public class MsgController {
    @Autowired
    private UserService userService;
    @Autowired
    private MsgService msgService;
    @Autowired
    private ReplyService replyService;
    @Autowired
    HttpSession session;

    @RequestMapping("/add")
    private String addmsg(ModelMap modelMap) {
        User user = (User) session.getAttribute("user");
        List<User> users = userService.findAll(user.getUsername());
        modelMap.addAttribute("users", users);
        return "view/add";
    }

    @RequestMapping("/add.json")
    @ResponseBody
    public Result add(Msg msg) throws SysException {
        User user = (User) session.getAttribute("user");
        msg.setSender(user.getUsername());
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String d = format.format(date);
        msg.setDate(d);
        int i = msgService.addMsg(msg);
        if (i == 0) {
            throw new SysException("留言失败");
        }
        return Result.success("留言成功！");
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") Integer id) throws SysException {
        int i = msgService.deleteMsgById(id);
        if (i == 0) {
            throw new SysException("删除失败！");
        }
        return "redirect:/index";
    }

    @RequestMapping("/read")
    public String read(ModelMap modelMap,
                       @RequestParam("id") Integer id) throws SysException {
        List<Reply> replies = replyService.findAllReplyById(id);
        Msg msg = msgService.findMsgById(id);
        modelMap.addAttribute("msg", msg);
        modelMap.addAttribute("replys", replies);
        return "view/read";
    }

    @RequestMapping("/reply.json")
    @ResponseBody
    public Result reply(Reply reply, HttpServletRequest request) throws SysException {
        User user = (User) session.getAttribute("user");
        String mid = request.getParameter("mid");
        reply.setCommentator(user.getUsername());
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String d = format.format(date);
        reply.setDate(d);
        int i = replyService.addReply(reply);
        if (i == 0) {
            throw new SysException("回复失败");
        }
        return Result.success("回复成功！");
    }

}
