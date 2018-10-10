package com.bean;

import com.dao.AdminDao;
import com.model.Admin;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service
public class AdminBean {
    @Resource
    private AdminDao admindao;

    //管理员登录功能
    public Admin login(String name, String pass){
        Admin admin=admindao.login(name,pass);
        return admin;
    }
}
