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
    //管理员修改
    public int set(Admin admin){
        return admindao.set(admin);
    }
    //查询所有管理员
    public Admin[] all(){
        return  admindao.all();
    }
    //删除
    public int del(Integer id){
        return admindao.del(id);
    }
    //根据id查询管理
    public Admin get(Integer id){
        return  admindao.get(id);
    }
    //天机
    public int add(Admin admin){
        return admindao.add(admin);
    }
}
