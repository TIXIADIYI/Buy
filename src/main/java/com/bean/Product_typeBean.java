package com.bean;

import com.dao.Product_typeDao;
import com.model.Product_type;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class Product_typeBean {
    @Resource
    private Product_typeDao product_typedao;

    //查询所有商品分类
    public Product_type[] all(){
        return product_typedao.all();
    }
    //根据id删除分类
    public int del(Integer id){
        return product_typedao.del(id);
    }
    //根据id查询分类
    public Product_type get(Integer id){
        return  product_typedao.get(id);
    }
    //添加分类
    public int in(Product_type product_type){
        return product_typedao.in(product_type);
    }
    //编辑分类
    public int set(Product_type product_type){
        return  product_typedao.set(product_type);
    }
}
