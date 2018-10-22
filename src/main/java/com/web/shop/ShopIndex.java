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

    //主页头部使用分类数组、7个分类
    private Product_type[] product_type_top=new Product_type[7];
    private int[] product_type_top_int=new int[7];
    //主页头部大图分类的第一个商品图片
    private String[] product_image=new String[3];
    //主页热门3分类的商品
    private Product[][] product_top_hot=new Product[3][];
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
        //获取头部热门(下半部分热门)点击分类
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
                for(int p=0;p<product_type_top.length;p++){
                    if(click>product_type_top_int[p]) {
                        int clicks = product_type_top_int[p];
                        Product_type product_type_clicks= product_type_top[p];
                        product_type_top_int[p]=click;
                        product_type_top[p]=product_type[j];
                        for(int i=p+1;i<product_type_top.length;i++){
                            if(clicks>product_type_top_int[i]){
                                int clickss=product_type_top_int[i];
                                Product_type product_type_clickss=product_type_top[i];
                                product_type_top_int[i]=clicks;
                                product_type_top[i]=product_type_clicks;
                                product_type_clicks=product_type_clickss;
                                clicks=clickss;
                            }
                        }
                        break;
                    }
                }
                }
        request.setAttribute("product_type_top",product_type_top);
        //获取新上架商品
        Product[] product_new=productbean.product_new();
        request.setAttribute("product_new",product_new);
        //获取最热门商品
        Product[] product_hot=productbean.product_hot();
        request.setAttribute("product_hot",product_hot);
        //获取最热门3个分类的商pin
        for(int i=0;i<product_top_hot.length;i++){
            product_top_hot[i]=productbean.product_type_get(product_type_top[i].getId());
        }
        request.setAttribute("product_top_hot",product_top_hot);
         //头部大图分类取最热门商品图片
         for(int i=0;i<3;i++){
             Product[] product_j=productbean.product_type_get(product_type_top[i].getId());
             Product product_js=null;
             for(int l=0;l<product_j.length;l++){
                 if(l==0){
                     product_js=product_j[l];
                 }else {
                     if(product_js.getClick()<product_j[l].getClick()){
                         product_js=product_j[l];
                     }
                 }
             }
             product_image[i]=product_js.getImage();
         }
        request.setAttribute("product_image",product_image);
        //跳转
        return "shop/shop_indexs.jsp";
    }

}
