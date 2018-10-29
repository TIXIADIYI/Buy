package com.web.shop;



import com.bean.UserBean;
import com.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
    public Integer shoplogin_post(String user, String pass, HttpSession session){
        if(user==null||pass==null||user.equals("")||pass.equals("")){
            return 2;
        }else{
            User users=userbean.login(user,pass);
            if(users!=null){
                session.setAttribute("user",users);
               return 1;
            }else{
                return 0;
            }
        }
    }

    //注册
    @ResponseBody
    @RequestMapping(value = "/login/zhuce", method = RequestMethod.POST)
    public Integer shoplogin_zhuce(String user,String pass,String pass2){
        if(user==null||pass==null||pass2==null||user.equals("")||pass.equals("")||pass2.equals("")){
            return 2;
        }else if(!pass.equals(pass2)){
            return 4;
        } else if(userbean.zhuce_tm(user)==null){
            if(userbean.zhuce(user,pass)!=0){
                return 1;
            }else{
                return 0;
            }
        }else{
            return 3;
        }
    }

    //退出登录
    @RequestMapping(value = "/login/exit", method = RequestMethod.GET)
    public String shoplogin_exit(HttpSession session){
        session.removeAttribute("user");
        return "/shop/index";
    }

}
