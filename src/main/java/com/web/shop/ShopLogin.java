package com.web.shop;



import com.bean.UserBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping(value = "/shop")
public class ShopLogin {

    @Resource
    private UserBean userbean;

    //跳转至登录页面
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String shoplogin(){
          return "/shop/login/login.jsp";
    }

    //登录提交验证
    @ResponseBody
    @RequestMapping(value = "/login/post", method = RequestMethod.POST)
    public Integer shoplogin_post(String user, String pass){
        if(userbean.login(user,pass)!=null){
            return 1;
        }else{
            return 0;
        }
    }


}
