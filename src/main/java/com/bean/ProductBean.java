package com.bean;

import com.dao.ProductDao;
import com.model.Product;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ProductBean {
    @Resource
    private ProductDao productdao;

    //查询所有商品
    public Product[] all(){
        return productdao.all();
    }
}
