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

    //主页头部使用分类数组
    private Product_type[] product_type_top=new Product_type[4];
    private int[] product_type_top_int=new int[4];

    /*
   * 跳转到前台主页
   */
    @RequestMapping(value = "/shop")
    public String shop(HttpServletRequest request){
        return "shop/shop_index.jsp";
    }

    @RequestMapping(value = "/shop/index")
    public String shops(HttpServletRequest request){
        //获取商品
        Product[] product=productbean.all();
        request.setAttribute("product", product);
        //获取所有分类
        Product_type[] product_type=product_typeBean.all();
        request.setAttribute("product_type",product_type);
        //获取随机推荐
        Recommend[] recommends=recommendbean.all();
        Recommend recommend=recommends[(int) (Math.random() * recommends.length)];
        request.setAttribute("recommend",recommend);
        //获取头部热门点击分类
        for(int i=0;i<product_type_top.length;i++){
            product_type_top_int[i]=0;
            product_type_top[i]=null;
        }
            for(int j=0;j<product_type.length;j++){
                int click=0;
                Product[] product_j=productbean.product_type_get(product_type[j].getId());
                for(int k=0;k<product_j.length;k++){
                    click+=product_j[k].getClick();
                }
                for(int i=0;i<product_type_top.length;i++){
                    if(click>product_type_top_int[i]){
                        product_type_top_int[i]=click;
                        product_type_top[i]=product_type[j];
                        break;
                    }
                }
            }
        request.setAttribute("product_type_top",product_type_top);
        //获取新上架按时间排序分类

        //跳转
        return "shop/shop_indexs.jsp";
    }

}
