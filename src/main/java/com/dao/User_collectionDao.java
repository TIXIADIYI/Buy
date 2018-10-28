package com.dao;

import com.model.User_collection;
import org.apache.ibatis.annotations.Param;

public interface User_collectionDao {
    //查询所有
    User_collection[] all();
    //get
    User_collection get(Integer id);
    //根据id删除
    int del(@Param(value = "id") Integer id);
    //添加
    int add(User_collection user_collection);
    //编辑
    int set(User_collection user_collection);
}
