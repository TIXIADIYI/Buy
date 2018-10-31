package com.dao;

import com.model.Product_type;
import org.apache.ibatis.annotations.Param;

public interface Product_typeDao {
    //查询所有分类
    Product_type[] all();
    //根据id查询分类
    Product_type get(@Param(value = "id")Integer id);
    //根据id删除分类
    int del(@Param(value = "id")Integer id);
    //添加分类
    int in(Product_type product_type);
    //编辑分类
    int set(Product_type product_type);
    //热门分类排序
    Product_type[] product_type_hot();
}
