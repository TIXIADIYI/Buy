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
}
