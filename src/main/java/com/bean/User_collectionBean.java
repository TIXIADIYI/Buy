package com.bean;

import com.dao.User_collectionDao;
import com.model.User_collection;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class User_collectionBean {
    @Resource
  private User_collectionDao user_collectiondao;

    //查询所有
    public User_collection[] all(){
        return user_collectiondao.all();
    }
    //get
    public User_collection get(Integer id){
        return  user_collectiondao.get(id);
    }
    //根据id删除
    public int del(Integer id){
        return  user_collectiondao.del(id);
    }
    //添加
    public int add(User_collection collection){
        return user_collectiondao.add(collection);
    }
    //编辑
    public int set(User_collection collection){
        return  user_collectiondao.set(collection);
    }
}
