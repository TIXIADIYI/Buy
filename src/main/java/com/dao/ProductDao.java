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
    //根据用户id查询
    Product[] user_id_get(@Param(value = "user_id")Integer user_id);
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
    //查询关键字
    Product[] sel(String Key);
    //根据id增加一点点击数
    int click(Integer id);
     //根据分类id查询该分类中最热门的商品
     Product product_type_get_hot(Integer product_type_id);
}
