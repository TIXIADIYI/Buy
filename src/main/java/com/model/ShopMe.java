package com.model;

import java.util.Arrays;
import java.util.Date;

public class ShopMe {

    //评论分页 页显示数
    private Integer comment_pages=3;
    //页数显示商品
    private Integer pages=9;


    //商品最热门排序方法
    public Product[] product_hot(Product[] product){
        if(product == null || product.length < 2){
            return product;
        }
        Product[] products=product;
        Product p=null;

        int left = 0;
        int right = products.length-1;
        int tmp;

        while (left < right){
            for(tmp = left; tmp <right; tmp++){
                if(products[tmp].getClick() < products[tmp+1].getClick()){
                    p=products[tmp];
                    products[tmp]=products[tmp+1];
                    products[tmp+1]=p;
                }
            }
            right--;
            for(tmp = right; tmp > left; tmp-- ){
                if(products[tmp].getClick() > products[tmp-1].getClick()){
                    p=products[tmp];
                    products[tmp]=products[tmp-1];
                    products[tmp-1]=p;
                }
            }
            left++;
        }
        return products;
    }

    //商品新品排序
    public Product[] product_new(Product[] product){
        if(product == null || product.length < 2){
            return product;
        }
        Product[] products=product;
        Product p=null;

        int left = 0;
        int right = products.length-1;
        int tmp;

        while (left < right){
            for(tmp = left; tmp <right; tmp++){
                if(products[tmp].getTime().getTime() < products[tmp+1].getTime().getTime()){
                    p=products[tmp];
                    products[tmp]=products[tmp+1];
                    products[tmp+1]=p;
                }
            }
            right--;
            for(tmp = right; tmp > left; tmp-- ){
                if(products[tmp].getTime().getTime() > products[tmp-1].getTime().getTime()){
                    p=products[tmp];
                    products[tmp]=products[tmp-1];
                    products[tmp-1]=p;
                }
            }
            left++;
        }
        return products;
    }


    //商品价格排序方法
    public Product[] product_sort(Product[] product, boolean desc){
        if(product == null || product.length < 2){
            return product;
        }
        Product[] products=product;
        Product p=null;

        int left = 0;
        int right = products.length-1;
        int tmp;
           while (left < right) {
               for (tmp = left; tmp < right; tmp++) {
                   if(desc){
                   if (products[tmp].getPrice() > products[tmp + 1].getPrice()) {
                       p = products[tmp];
                       products[tmp] = products[tmp + 1];
                       products[tmp + 1] = p;
                   }
                   }else{
                       if (products[tmp].getPrice() < products[tmp + 1].getPrice()) {
                           p = products[tmp];
                           products[tmp] = products[tmp + 1];
                           products[tmp + 1] = p;
                       }
                   }
               }
               right--;
               for (tmp = right; tmp > left; tmp--) {
                   if(desc) {
                       if (products[tmp].getPrice() < products[tmp - 1].getPrice()) {
                           p = products[tmp];
                           products[tmp] = products[tmp - 1];
                           products[tmp - 1] = p;
                       }
                   }else{
                       if (products[tmp].getPrice() > products[tmp - 1].getPrice()) {
                           p = products[tmp];
                           products[tmp] = products[tmp - 1];
                           products[tmp - 1] = p;
                       }
                   }
               }
               left++;
           }

        return products;
    }


    //截取同个分类的商品
    public Product[] product_type(Product[] product,Integer product_type_id){
        Product[] products = new Product[0];
        for(int i=0;i<product.length;i++){
            if(product[i].getProduct_type_id()!=null){
                if(product[i].getProduct_type_id().getId()!=null){
                    if(product[i].getProduct_type_id().getId().equals(product_type_id)){
                        products = Arrays.copyOf(products, products.length+1) ;
                        products[products.length-1]=product[i];
                    }
                }
            }
        }
        return  products;
    }

    //数据截取 分页使用
    public Product_comment[] product_comment(Product_comment[] product_comment,Integer comment_page){
        int max=product_comment.length;
        if(max>comment_pages){
            if(comment_pages*comment_page+comment_pages<=max){
                max=comment_pages*comment_page+comment_pages;
            }
            product_comment=Arrays.copyOfRange(product_comment, comment_pages*comment_page, max);
            return  product_comment;
        }else{
            return  product_comment;
        }
    }


    //数据截取 分页使用
    public Product[] product_page(Product[] product,Integer page){
        int max=product.length;
        if(max>pages){
            if(pages*page+pages<=max){
                max=pages*page+pages;
            }
            product=Arrays.copyOfRange(product, pages*page, max);
            return  product;
        }else{
            return  product;
        }
    }

    public Integer getComment_pages() {
        return comment_pages;
    }

    public Integer getPages() {
        return pages;
    }
}
