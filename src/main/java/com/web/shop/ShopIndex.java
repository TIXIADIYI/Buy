package com.web.shop;

import com.bean.ProductBean;
import com.bean.Product_typeBean;
import com.bean.RecommendBean;
import com.model.Product;
import com.model.Product_type;
import com.model.Recommend;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ShopIndex {
    @Resource
    private ProductBean productbean;
    @Resource
    private Product_typeBean product_typeBean;
    @Resource
    private RecommendBean recommendbean;

    /*
   * 跳转到前台主页
   */
    @RequestMapping(value = "/shop")
    public String shop(HttpServletRequest request){
        //获取商品
        Product[] product=productbean.all();
        request.setAttribute("product", product);
        //获取所有分类
        Product_type[] product_type=product_typeBean.all();
        request.setAttribute("product_type",product_type);
        //获取推荐
        Recommend[] recommends=recommendbean.all();
        Recommend recommend=recommends[(int) (Math.random() * recommends.length)];
        request.setAttribute("recommend",recommend);
        //获取头部热门点击分类

        //获取新上架按时间排序分类
        //跳转
        return "shop/shop_index.jsp";
    }
}
