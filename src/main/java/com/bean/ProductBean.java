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
    //根据id查询商品
    public Product get(Integer id){
        return productdao.get(id);
    }
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
    //根据用户id查询
    public Product[] user_id_get(Integer user_id){
        return productdao.user_id_get(user_id);
    }
    //添加商品
    public int in(Product product){
        return  productdao.in(product);
    }
    //修改商品
    public int set(Product product){
        return productdao.set(product);
    }
    //关键字
    public Product[] sel(String Key){
        return productdao.sel(Key);
    }
    //根据id增加一点点击数
    public int click(Integer id){
        return  productdao.click(id);
    }
    //最热门10
    public Product[] product_hot(){
        return productdao.product_hot();
    }
    //最新10
    public Product[] product_new(){
        return productdao.product_new();
    }


    //根据分类id查询该分类中最热门的商品
    public Product product_type_get_hot(Integer product_type_id){
        return productdao.product_type_get_hot(product_type_id);
    }

    //终极数据库语句
    public Product[] product_type_key_order_desc(Integer product_type_id,String Key,Integer product_sort){
        return  productdao.product_type_key_order_desc(product_type_id,Key,product_sort);
    }
    //终极数据库语句(价格升序版本
    public Product[] product_type_key_order(Integer product_type_id,String Key){
        return  productdao.product_type_key_order(product_type_id,Key);
    }
}
