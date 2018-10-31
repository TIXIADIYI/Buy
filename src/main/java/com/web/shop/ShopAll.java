package com.web.shop;

import com.bean.ProductBean;
import com.bean.Product_typeBean;
import com.bean.RecommendBean;
import com.model.Product;
import com.model.Product_type;
import com.model.Recommend;
import com.model.ShopMe;
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

    private ShopMe shopMe=new ShopMe();




    //跳转至商品列表页面
    @RequestMapping(value = "/store/all", method = RequestMethod.GET)
    public String shop_store_all(HttpServletRequest request,Integer product_type_id,Integer product_sort,boolean product_sort_3,Integer page,String Key)  {


        //获取所有商品
        Product[] product;
        //检测关键字
        if(Key!=null&&!Key.equals("")&&!Key.equals(" ")){
            request.setAttribute("Key", Key);
            product=productbean.sel(Key);
        }else{
            product=productbean.all();
        }

        //获取所有分类
        Product_type[] product_type = product_typeBean.all();
        request.setAttribute("product_type", product_type);

        //获取随机推荐
        Recommend recommend = recommendbean.one();
        request.setAttribute("recommend", recommend);

        //获取最热门商品
        Product[] product_hot = shopMe.product_hot(productbean.all());
        request.setAttribute("product_hot", product_hot);

        //获取热门分类
        Product_type[] product_type_top=product_typeBean.product_type_hot();
        request.setAttribute("product_type_top",product_type_top);

        //获取分类字
        String product_type_name = "所有分类";

        //检测分类若存在则获取
        if (product_type_id != null&& product_type_id!=-1) {
            Product_type product_type_now = product_typeBean.get(product_type_id);
            product_type_name = product_type_now.getName();
            request.setAttribute("product_type_id", product_type_id);
            product=shopMe.product_type(product,product_type_id);
        }
        request.setAttribute("product_type_name", product_type_name);


        //获取商品排序方式
        boolean product_sort_3s=false;
        if(product_sort!=null&&product_sort==1){//按热门优先排序
            product=shopMe.product_hot(product);
        }else if(product_sort!=null&&product_sort==2){ //按新品优先排序
            product=shopMe.product_new(product);
        }else if(product_sort!=null&&product_sort==3){ //按价格排序
            product=shopMe.product_sort(product,product_sort_3);
            product_sort_3s=product_sort_3;
        }
        request.setAttribute("product_sort_3", product_sort_3s);

        if(product_sort!=null){
            request.setAttribute("product_sort", product_sort);
        }else{
            request.setAttribute("product_sort", 0);
        }
        //分页数据
        if(page==null||page<=0){
            page=0;
        }
        int pagemax=1;
        if(product.length%shopMe.getPages()==0){
            pagemax=product.length/shopMe.getPages();
        }else{
            pagemax=product.length/shopMe.getPages()+1;
        }
        if(page>pagemax){
            page=pagemax;
        }
        product=shopMe.product_page(product,page);
        request.setAttribute("page", page);
        if(pagemax<=0){
            request.setAttribute("pagemax", 0);
        }else{
            request.setAttribute("pagemax", pagemax-1);
        }
        //传送商品！
        request.setAttribute("product", product);
        //跳转
        return "/shop/store.jsp";
    }










}
