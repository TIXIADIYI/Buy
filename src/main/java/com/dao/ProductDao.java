package com.dao;

import com.model.Product;
import org.apache.ibatis.annotations.Param;

public interface ProductDao {
    //查询所有商品
    Product[] all();
    //根据id查询商品
    Product get(@Param(value = "id") String id);
}
