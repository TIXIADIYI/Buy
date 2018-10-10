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


}
