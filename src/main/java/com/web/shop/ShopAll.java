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
import java.util.Arrays;


@Controller
@RequestMapping(value = "/shop")
public class ShopAll {
    @Resource
    private ProductBean productbean;
    @Resource
    private Product_typeBean product_typeBean;
    @Resource
    private RecommendBean recommendbean;

//分页 每页数量
   private int pages=9;



    //跳转至商品列表页面
    @RequestMapping(value = "/store/all", method = RequestMethod.GET)
    public String shop_store_all(HttpServletRequest request,Integer product_type_id,Integer product_sort,boolean product_sort_3,Integer page,String Key)  {

        //获取所有分类
        Product_type[] product_type=product_typeBean.all();
        request.setAttribute("product_type",product_type);

        //获取随机推荐
        Recommend recommend=recommendbean.one();
        request.setAttribute("recommend",recommend);

        //获取最热门商品
        Product[] product_hot=productbean.product_hot();
        request.setAttribute("product_hot",product_hot);

        //获取热门分类
        Product_type[] product_type_top=product_typeBean.product_type_hot();
        request.setAttribute("product_type_top",product_type_top);

        //传送的变量检测和修正
        if(product_type_id==null){
            product_type_id=-1;
        }
        if(Key!=null){
           if(Key.equals("")){
               Key=null;
           }
        }
        if(product_sort==null){
            product_sort=0;
        }
        if(product_sort.equals("")){
            product_sort=0;
        }
        if(page==null){
            page=0;
        }
        if(page.equals("")){
            page=0;
        }
        boolean product_sort_3s=false;
        if(product_sort==3){
            product_sort_3s=product_sort_3;
        }

        //传送数据
        //显示分类的数据
        String product_type_name="全部分类";
        if(product_type_id!=-1){
            Product_type product_type1=product_typeBean.get(product_type_id);
            product_type_name=product_type1.getName();
        }
        request.setAttribute("product_type_name",product_type_name);
        //其他
        request.setAttribute("product_type_id",product_type_id);
        request.setAttribute("Key",Key);
        request.setAttribute("product_sort",product_sort);
        request.setAttribute("product_sort_3",product_sort_3s);

        //获取数据
        Product[] product=null;
        if(product_sort_3s) {
            product=productbean.product_type_key_order(product_type_id,Key);
        }else{
            product=productbean.product_type_key_order_desc(product_type_id,Key,product_sort);
        }


        //分页  商品数据截取
        int max=product.length;
        int pagemax=max/pages;
        if(max!=0&&max%pages==0){
            pagemax-=1;
        }
        if(max>pages){
            if(pages*page+pages<=max){
                max=pages*page+pages;
            }
            product= Arrays.copyOfRange(product, pages*page, max);
        }

        request.setAttribute("product",product);
        request.setAttribute("page",page);
        request.setAttribute("pagemax",pagemax);


        //跳转
        return "/shop/store.jsp";
    }











}
