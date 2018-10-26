package com.dao;

import com.model.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {
    //管理员登录功能
    Admin login(@Param(value = "name") String name, @Param(value = "pass") String pass);
    //根据id查询管理员
    Admin get(@Param(value="id")Integer id);
    //修改
    int set(Admin admin);
    //查询所有
    Admin[] all();
    //删除
    int del(Integer id);
    //添加
    int add(Admin admin);
}
