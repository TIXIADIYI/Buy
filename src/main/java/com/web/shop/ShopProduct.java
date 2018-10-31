package com.web.shop;

import com.bean.*;
import com.model.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.Date;

@Controller
@RequestMapping(value = "/shop")
public class ShopProduct {
    @Resource
    private ProductBean productbean;
    @Resource
    private Product_typeBean product_typeBean;
    @Resource
    private RecommendBean recommendbean;
    @Resource
    private Product_commentBean product_commentbean;
    @Resource
    private User_collectionBean user_collectionbean;

    //主页头部使用分类数组、7个分类
    private Product_type[] product_type_top=new Product_type[7];
    private int[] product_type_top_int=new int[7];

    //评论分页 页显示数
    private Integer comment_pages=3;

    //跳转至商品页面
    @RequestMapping(value = "/product/edit", method = RequestMethod.GET)
    public String shop_product_edit(HttpServletRequest request,Integer id,Integer comment_page){
        //获取所有分类
        Product_type[] product_type = product_typeBean.all();
        request.setAttribute("product_type", product_type);
        //获取随机推荐
        Recommend[] recommends = recommendbean.all();
        Recommend recommend = recommends[(int) (Math.random() * recommends.length)];
        request.setAttribute("recommend", recommend);

        //获取相关商品，并增加点击数
        Product product=productbean.get(id);
        request.setAttribute("product", product);
        request.setAttribute("id", id);
        product.setClick(product.getClick()+1);
        productbean.set(product);

        //获取热门商品并取该分类（同类推荐）
        Product[] product_all=productbean.all();
        product_all=product_hot(product_all);
        product_all=product_type(product_all,product.getProduct_type_id().getId());
        request.setAttribute("product_all", product_all);

        //获取该商品评论
        Product_comment[] product_comment=product_commentbean.product_id_get(id);

        //评论分页
        if(comment_page==null||comment_page<=0){
            comment_page=0;
        }
        int comment_pagemax=1;
        if(product_comment.length%comment_pages==0){
            comment_pagemax=product_comment.length/comment_pages;
        }else{
            comment_pagemax=product_comment.length/comment_pages+1;
        }
        if(comment_page>comment_pagemax){
            comment_page=comment_pagemax;
        }
        product_comment=product_comment(product_comment,comment_page);

        request.setAttribute("comment_page", comment_page);
        if(comment_pagemax<=0){
            request.setAttribute("comment_pagemax", 0);
        }else{
            request.setAttribute("comment_pagemax", comment_pagemax-1);
        }
        request.setAttribute("product_comment", product_comment);

        return "shop/product.jsp";
    }



    //以下操作均为登录后可使用


    //跳转至发布二货
    @RequestMapping(value = "/login/index/product/add", method = RequestMethod.GET)
    public String shop_login_product_add(HttpServletRequest request){
        //获取分类
        Product_type[] product_type = product_typeBean.all();
        request.setAttribute("product_type", product_type);
        return "shop/fabu.jsp";
    }
    //提交二货
    @ResponseBody
    @RequestMapping(value = "/login/index/product/add/post", method = RequestMethod.POST)
    public Integer shop_login_product_add_post(Product product, HttpSession session){
        Date myDate = new Date();
        product.setTime(myDate);
        User user=(User)session.getAttribute("user");
        product.setUser_id(user);
        return productbean.in(product);
    }
    //发布评论
    @ResponseBody
    @RequestMapping(value = "/login/index/product_comment/post", method = RequestMethod.POST)
    public Integer shop_product_comment_post(Product_comment product_comment, HttpSession session){
        Date myDate = new Date();
        product_comment.setTime(myDate);
        User user=(User)session.getAttribute("user");
        product_comment.setUser_id(user);
        return  product_commentbean.add(product_comment);
    }

    //添加收藏
    @ResponseBody
    @RequestMapping(value = "/login/index/collection/get", method = RequestMethod.GET)
    public Integer shop_login_collection_get(Integer id,HttpSession session){
        User user=(User)session.getAttribute("user");
        User_collection user_collection=new User_collection();
        user_collection.setProduct_id(productbean.get(id));
        user_collection.setUser_id(user);
        Integer i=0;
        if(user_collectionbean.rep(user_collection)==null){
            if(user_collectionbean.add(user_collection)!=0){
               i=1;
            }else{
                i=0;
            }
        }else{
            i=2;
        }
        return  i;
    }



    //以下是执行方法


    //商品最热门排序方法
    private Product[] product_hot(Product[] product){
        for(int i=0;i<product.length;i++){
            for(int j=i;j<product.length;j++){
                if(product[i].getClick()<product[j].getClick()){
                    Product p=product[i];
                    product[i]=product[j];
                    product[j]=p;
                }
            }
        }
        return product;
    }


    //截取同个分类的商品
    private Product[] product_type(Product[] product,Integer product_type_id){
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
    private Product_comment[] product_comment(Product_comment[] product_comment,Integer comment_page){
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
}
