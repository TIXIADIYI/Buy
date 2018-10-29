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
    //根据价格
    public Product[]   product_max(){
        return productdao.product_max();
    }
    public Product[] product_mix(){
        return productdao.product_mix();
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
    //添加商品
    public int in(Product product){
        return  productdao.in(product);
    }
    //修改商品
    public int set(Product product){
        return productdao.set(product);
    }
    //根据分类和热门排序
    public Product[] product_type_get_hot(Integer product_type_id){
        return productdao.product_type_get_hot(product_type_id);
    }
    //根据分类和新品排序
    public Product[] product_type_get_new(Integer product_type_id){
        return productdao.product_type_get_new(product_type_id);
    }
    //根据分类和价格排序
    public  Product[] product_type_get_mix(Integer product_type_id){
        return  product_type_get_mix(product_type_id);
    }
    public Product[] product_type_get_max(Integer product_type_id){
        return product_type_get_max(product_type_id);
    }
}
