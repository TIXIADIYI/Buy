package com.bean;

import com.dao.Product_commentDao;
import com.model.Product_comment;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Service
public class Product_commentBean {
    @Resource
    private Product_commentDao product_commentdao;

    //查询所有评论
    public Product_comment[] all(){
        return product_commentdao.all();
    }
}
