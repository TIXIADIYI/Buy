package com.bean;


import com.dao.UserDao;
import com.model.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserBean {
    @Resource
    private UserDao userdao;

    //用户登录功能
    public User login(String user,String pass){
        User users=userdao.login(user, pass);
        return  users;
    }

    //注册功能
    public int zhuce(String user,String pass){
        return userdao.zhuce(user,pass);
    }

    //同名查询
    public User zhuce_tm(String user){
        return  userdao.zhuce_tm(user);
    }

    //获取所有用户
    public User[] all(){
        return userdao.all();
    }

}
