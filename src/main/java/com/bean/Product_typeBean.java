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
}
