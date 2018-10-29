package com.web.shop;

import com.bean.ProductBean;
import com.bean.Product_typeBean;
import com.bean.RecommendBean;
import com.model.Product;
import com.model.Product_type;
import com.model.Recommend;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/shop")
public class ShopAll {
    @Resource
    private ProductBean productbean;
    @Resource
    private Product_typeBean product_typeBean;
    @Resource
    private RecommendBean recommendbean;

    //主页头部使用分类数组、7个分类
    private Product_type[] product_type_top=new Product_type[7];
    private int[] product_type_top_int=new int[7];

    //跳转至商品列表页面
    @RequestMapping(value = "/store/all", method = RequestMethod.GET)
    public String shoplogin(HttpServletRequest request,Integer product_type_id,Integer product_sort,boolean product_sort_3){
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
        //获取最热门商品
        Product[] product_hot=productbean.product_hot();
        request.setAttribute("product_hot",product_hot);
        //获取分类字
        String product_type_name="所有分类";
        if(product_type_id!=null){//检测分类
            Product_type product_type_now=product_typeBean.get(product_type_id);
            product_type_name=product_type_now.getName();
            request.setAttribute("product_type_id",product_type_id);
        }
        request.setAttribute("product_type_name",product_type_name);
        //热门排序或新品排序或其他
        Product[] product=null;
        if(product_sort!=null&&product_sort!=null&&product_sort==1){ //热门
            request.setAttribute("product_sort",product_sort);
            if(product_type_id!=null){//检测分类
                product=productbean.product_type_get_hot(product_type_id);
            }else{ //无
                product=product_hot;
            }
        }else if(product_sort!=null&&product_sort!=null&&product_sort==2){ //新品
            request.setAttribute("product_sort",product_sort);
            if(product_type_id!=null) {
                product=productbean.product_type_get_new(product_type_id);
            }else{
              product=productbean.product_new();
            }
        }else if(product_sort!=null&&product_sort!=null&&product_sort==3){//价格
            request.setAttribute("product_sort",product_sort);
            if(product_type_id!=null) {//分类检测
                if(!product_sort_3){
                    product=productbean.product_type_get_mix(product_type_id);
                }else{
                    product=productbean.product_type_get_max(product_type_id);
                }
            }else{
                if(!product_sort_3){
                    product=productbean.product_mix();
                }else{
                    product=productbean.product_max();
                }
            }
        }else{//默认排序
            request.setAttribute("product_sort",0);
            if(product_type_id!=null){//检测分类
                product=productbean.product_type_get(product_type_id);
            }else{ //无
                product=productbean.all();
            }
        }
        request.setAttribute("product",product);
        //跳转
        return "/shop/store.jsp";
    }

}
