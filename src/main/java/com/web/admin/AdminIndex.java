package com.web.admin;

import com.bean.AdminBean;
import com.model.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/admin")
public class AdminIndex {

    //跳转至后台主页
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String adminlogin(){
        return "admin/admin_index.jsp";
    }

    //退出登录
    @RequestMapping(value = "/exit", method = RequestMethod.GET)
    public String adminexit(HttpSession session){
        session.removeAttribute("admin");
        return  "admin/login";
    }
}
