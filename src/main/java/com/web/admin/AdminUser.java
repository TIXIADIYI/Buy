package com.web.admin;

import com.bean.UserBean;
import com.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/admin/index")
public class AdminUser {
    @Resource
    UserBean userbean;

    //跳转至用户表
    @RequestMapping(value = "/recommend", method = RequestMethod.GET)
    public String admin_user(HttpServletRequest request){
        User[] user=userbean.all();
        request.setAttribute("user",user);
        return "admin/user_list.jsp";
    }
}
