package com.dao;

import com.model.Product_comment;
import org.apache.ibatis.annotations.Param;

public interface Product_commentDao {
    //根据id查询评论
    Product_comment get(@Param(value = "id")Integer id);
    //查询所有评论
    Product_comment[] all();
    //根据id删除评论
    int del(@Param(value = "id")Integer id);
    //添加
    int add(Product_comment product_comment);
    //编辑
    int set(Product_comment product_comment);
}
