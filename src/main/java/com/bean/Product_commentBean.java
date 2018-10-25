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
    //根据id删评论
    public int del(Integer id){
        return  product_commentdao.del(id);
    }
    //根据id查询评论
    public Product_comment get(Integer id){
        return  product_commentdao.get(id);
    }
    //添加
    public int add(Product_comment product_comment){
        return  product_commentdao.add(product_comment);
    }
    //编辑
    public int set(Product_comment product_comment){
        return  product_commentdao.set(product_comment);
    }
}
