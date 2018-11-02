package com.web.shop;

import com.bean.ProductBean;
import com.bean.Product_typeBean;
import com.bean.RecommendBean;
import com.bean.User_collectionBean;
import com.model.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ShopIndex {
    @Resource
    private ProductBean productbean;
    @Resource
    private Product_typeBean product_typeBean;
    @Resource
    private RecommendBean recommendbean;
    @Resource
    private User_collectionBean user_collectionBean;


    /*
   * 跳转到前台主页
   */
    @RequestMapping(value = "/shop")
    public String shop(HttpServletRequest request){
        return "shop/shop_index.jsp";
    }

    @RequestMapping(value = "/shop/index")
    public String shops(HttpServletRequest request, HttpSession session){

        //获取所有分类
        Product_type[] product_type=product_typeBean.all();
        request.setAttribute("product_type",product_type);

        //获取随机推荐
        Recommend recommend=recommendbean.one();
        request.setAttribute("recommend",recommend);

        //获取热门分类
        Product_type[] product_type_top=product_typeBean.product_type_hot();
        request.setAttribute("product_type_top",product_type_top);

        //获取新上架商品
        Product[] product_new=productbean.product_new();
        request.setAttribute("product_new",product_new);

        //获取最热门商品
        Product[] product_hot=productbean.product_hot();
        request.setAttribute("product_hot",product_hot);

        //获取用户收藏
        User user=(User)(session.getAttribute("user"));
        if(user!=null) {
            //新品收藏
            boolean[] product_new_collection=new boolean[product_new.length];
            //热门收藏
            boolean[] product_hot_collection=new boolean[product_hot.length];
            User_collection user_collection=new User_collection();
            user_collection.setUser_id(user);
            for(int i=0;i<product_new.length;i++){
                user_collection.setProduct_id(product_new[i]);
                if(user_collectionBean.rep(user_collection)!=null){
                    product_new_collection[i]=true;
                }
                user_collection.setProduct_id(product_hot[i]);
                if(user_collectionBean.rep(user_collection)!=null){
                    product_hot_collection[i]=true;
                }
            }
            request.setAttribute("product_new_collection",product_new_collection);
            request.setAttribute("product_hot_collection",product_hot_collection);
        }

        //获取大图分类的最热门商品
        Product[] product_image=new Product[3];
        for(int i=0;i<product_image.length;i++){
            product_image[i]=productbean.product_type_get_hot(product_type_top[i].getId());
        }
        request.setAttribute("product_image",product_image);

        //获取底部小分类商品
        Product[][] product_top_hot=new Product[3][];
        for(int i=0;i<product_top_hot.length;i++){
            product_top_hot[i]=productbean.product_type_get(product_type_top[i].getId());
        }
        request.setAttribute("product_top_hot",product_top_hot);
        //跳转
        return "shop/shop_indexs.jsp";
    }



}
