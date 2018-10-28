package com.web.admin;

import com.bean.UserBean;
import com.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/admin/index")
public class AdminUser {
    @Resource
    UserBean userbean;

    //跳转至用户表
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String admin_user(HttpServletRequest request){
        User[] user=userbean.all();
        request.setAttribute("user",user);
        return "admin/user_list.jsp";
    }

    //删除
    @ResponseBody
    @RequestMapping(value = "/user/del", method = RequestMethod.GET)
    public Integer admin_user_del(Integer id){
        return userbean.del(id);
    }

    //跳转系列
    //添加
    @RequestMapping(value = "/user/add", method = RequestMethod.GET)
    public String admin_user_add(HttpServletRequest request){
        request.setAttribute("add_or_edit",true);
        return  "admin/user_add.jsp";
    }

    //编辑
    @RequestMapping(value = "/user/edit", method = RequestMethod.GET)
    public String admin_user_edit(HttpServletRequest request,Integer id){
        User user=userbean.get(id);
        request.setAttribute("user",user);
        System.out.println("啦啦");
        request.setAttribute("add_or_edit",false);
        return  "admin/user_add.jsp";
    }

    //添加提交
    @ResponseBody
    @RequestMapping(value = "/user/add/post", method = RequestMethod.POST)
    public Integer admin_user_add_post(User user){
        return userbean.add(user);
    }


    //编辑提交
    @ResponseBody
    @RequestMapping(value = "/user/edit/post", method = RequestMethod.POST)
    public Integer admin_user_edit_post(User user){
        return userbean.set(user);
    }

}
