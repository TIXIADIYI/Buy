package com.dao;

import com.model.User;
import org.apache.ibatis.annotations.Param;


/*
 * 该接口用来与mybatis的对应映射文件对接
 */
public interface UserDao {

	//登录功能
	User login(@Param(value = "user") String user, @Param(value = "pass") String pass);


}

