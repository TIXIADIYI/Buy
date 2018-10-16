package com.dao;

import com.model.Product_type;
import org.apache.ibatis.annotations.Param;

public interface Product_typeDao {
    //查询所有分类
    Product_type[] all();
    //根据id查询分类
    Product_type get(@Param(value = "id")String id);
}
