package com.bean;

import com.dao.RecommendDao;
import com.model.Recommend;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class RecommendBean {
    @Resource
    private RecommendDao recommenddao;

    //查询所有推荐
    public Recommend[] all(){
        return recommenddao.all();
    }
    //根据id查询
    public Recommend get(Integer id){
     return    recommenddao.get(id);
    }
    //根据id删除
    public int del(Integer id){
        return  recommenddao.del(id);
    }
    //添加
    public int add(Recommend recommend){
        return  recommenddao.add(recommend);
    }
    //编辑
    public int set(Recommend recommend){
        return  recommenddao.set(recommend);
    }
    //随机取一条
    public Recommend one(){
        return recommenddao.one();
    }
}
