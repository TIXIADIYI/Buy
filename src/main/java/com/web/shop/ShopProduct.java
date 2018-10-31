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

    private ShopMe shopMe=new ShopMe();



    //跳转至商品页面
    @RequestMapping(value = "/product/edit", method = RequestMethod.GET)
    public String shop_product_edit(HttpServletRequest request,Integer id,Integer comment_page){
        //获取所有分类
        Product_type[] product_type = product_typeBean.all();
        request.setAttribute("product_type", product_type);

        //获取随机推荐
        Recommend recommend = recommendbean.one();
        request.setAttribute("recommend", recommend);

        //获取热门分类
        Product_type[] product_type_top=product_typeBean.product_type_hot();
        request.setAttribute("product_type_top",product_type_top);


        Product product=null;
        if(id!=null) {
           product = productbean.get(id);
        }
        if(product!=null) {
            request.setAttribute("product", product);
            //增加点击数
            productbean.click(id);
            //获取热门商品并取该分类（同类推荐）
            Product[] product_all=productbean.all();
            product_all=shopMe.product_hot(product_all);
            product_all=shopMe.product_type(product_all,product.getProduct_type_id().getId());
            request.setAttribute("product_all", product_all);

            //获取该商品评论
            Product_comment[] product_comment = product_commentbean.product_id_get(id);
            //评论分页
            if(comment_page==null||comment_page<=0){
                comment_page=0;
            }
            int comment_pagemax=1;
            if(product_comment.length%shopMe.getComment_pages()==0){
                comment_pagemax=product_comment.length/shopMe.getComment_pages();
            }else{
                comment_pagemax=product_comment.length/shopMe.getComment_pages()+1;
            }
            if(comment_page>comment_pagemax){
                comment_page=comment_pagemax;
            }
            product_comment=shopMe.product_comment(product_comment,comment_page);

            request.setAttribute("comment_page", comment_page);
            if(comment_pagemax<=0){
                request.setAttribute("comment_pagemax", 0);
            }else{
                request.setAttribute("comment_pagemax", comment_pagemax-1);
            }
            request.setAttribute("product_comment", product_comment);
        }
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

}
