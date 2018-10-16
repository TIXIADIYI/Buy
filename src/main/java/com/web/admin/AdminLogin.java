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
public class AdminLogin {

    @Resource
    private AdminBean adminbean;

    //跳转到登录页面
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String adminlogin(){
        return "admin/login.jsp";
    }

    //管理员登录提交
    @ResponseBody
    @RequestMapping(value = "/login/post", method = RequestMethod.POST)
    public Integer adminlogin_post(String name, String pass, HttpSession session){
        if(name==null||pass==null||name.equals("")||pass.equals("")){
            return 2;
        }else{
            Admin admin=adminbean.login(name,pass);
            if(admin!=null){
                session.setAttribute("admin", admin);
                return 1;
            }else{
                return 0;
            }
        }
    }
}
