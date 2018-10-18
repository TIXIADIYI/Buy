package com.dao;

import com.model.Product;
import org.apache.ibatis.annotations.Param;

public interface ProductDao {
    //查询所有商品
    Product[] all();
    //根据id查询商品
    Product get(@Param(value = "id") String id);
    //根据分类查询商品
    Product[] product_type_get(@Param(value = "product_type_id")Integer product_type_id);
}
