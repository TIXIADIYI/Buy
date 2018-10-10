package com.web.admin;

import com.bean.AdminBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

@Controller
@RequestMapping(value = "/admin")
public class AdminLogin {

    @Resource
    private AdminBean adminbean;

    //跳转到登录页面
//    @RequestMapping(value = "/login", method = RequestMethod.GET)
//    public String adminlogin(){
//
//    }
}
