package com.dao;

import com.model.Recommend;

public interface RecommendDao {
        //获取所有推荐
    Recommend[] all();
        //根据id查询
    Recommend get(Integer id);
      //根据id删除
    int del(Integer id);
    //添加
    int add(Recommend recommend);
    //编辑
    int set(Recommend recommend);
}
