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
    //根据分类查询商品
    public Product[] product_type_get(Integer product_type_id){
       return  productdao.product_type_get(product_type_id);
    }
    //根据时间从新到旧排序商品
    public Product[] product_new(){
        return  productdao.product_new();
    }
    //根据id查询商品
    public Product get(Integer id){
        return productdao.get(id);
    }
     //根据热门程度排序商品-->
    public Product[] product_hot(){ return  productdao.product_hot();}
    //根据id上下架商品
    public int display_tf(Integer id,boolean display){
        int i=0;
        if(display){
            i=productdao.display_t(id);
        }else {
            i=productdao.display_f(id);
        }
    return i;
    }
    //根据id删除商品
    public int del(Integer id){
        return productdao.del(id);
    }
    //添加商品
    public int in(Product product){
        return  productdao.in(product);
    }
    //修改商品
    public int set(Product product){
        return productdao.set(product);
    }
}
