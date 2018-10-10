package com.dao;

import com.model.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {
    //管理员登录功能
    Admin login(@Param(value = "name") String name, @Param(value = "pass") String pass);
}
