package com.dao;

import com.model.Product;
import org.apache.ibatis.annotations.Param;

public interface ProductDao {
    //查询所有商品(默认排序）
    Product[] all();
    //根据id查询商品
    Product get(@Param(value = "id") Integer id);
    //根据分类查询商品
    Product[] product_type_get(@Param(value = "product_type_id")Integer product_type_id);
    //根据时间从新到旧排序商品
    Product[] product_new();
     //根据热门程度排序商品-->
    Product[] product_hot();
    //根据ID上架商品
    int display_t(@Param(value = "id") Integer id);
    //根据ID下架商品
    int display_f(@Param(value = "id") Integer id);
    //根据id删除商品
    int del(@Param(value = "id") Integer id);
    //添加商品
    int in(Product product);
    //修改商品
    int set(Product product);
}
