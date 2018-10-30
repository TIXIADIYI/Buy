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
import java.io.UnsupportedEncodingException;
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

    //主页头部使用分类数组、7个分类
    private Product_type[] product_type_top=new Product_type[7];
    private int[] product_type_top_int=new int[7];
    //页数显示商品
    private Integer pages=9;

    //跳转至商品列表页面
    @RequestMapping(value = "/store/all", method = RequestMethod.GET)
    public String shop_store_all(HttpServletRequest request,Integer product_type_id,Integer product_sort,boolean product_sort_3,Integer page,String Key) throws UnsupportedEncodingException {
        //获取所有商品
        Product[] product=productbean.all();
        //获取所有分类
        Product_type[] product_type = product_typeBean.all();
        request.setAttribute("product_type", product_type);
        //获取随机推荐
        Recommend[] recommends = recommendbean.all();
        Recommend recommend = recommends[(int) (Math.random() * recommends.length)];
        request.setAttribute("recommend", recommend);
        //获取最热门商品
        Product[] product_hot = product_hot(product);
        request.setAttribute("product_hot", product_hot);
        //检测关键字
        if(Key!=null&&!Key.equals("")&&!Key.equals(" ")){
            request.setAttribute("Key", Key);
            System.out.println(Key);//查看是否乱码
            //若搜索出现中文搜索不出的情况，请解除下面注释，反之
//            Key = new String(Key .getBytes("iso8859-1"),"utf-8");
//            System.out.println(Key);
          product=productbean.sel(Key);
        }
        //获取分类字
        String product_type_name = "所有分类";
        //检测分类若存在则获取
        if (product_type_id != null&& product_type_id!=-1) {
            Product_type product_type_now = product_typeBean.get(product_type_id);
            product_type_name = product_type_now.getName();
            request.setAttribute("product_type_id", product_type_id);
            product=product_type(product,product_type_id);
        }
        request.setAttribute("product_type_name", product_type_name);
        boolean product_sort_3s=false;
        //获取商品排序方式
        if(product_sort!=null&&product_sort==1){//按热门优先排序
            product=product_hot(product);
        }else if(product_sort!=null&&product_sort==2){ //按新品优先排序
            product=product_new(product);
        }else if(product_sort!=null&&product_sort==3){ //按价格排序
            product= product_sort(product,product_sort_3);
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
        if(product.length%pages==0){
            pagemax=product.length/pages;
        }else{
            pagemax=product.length/pages+1;
        }
        if(page>pagemax){
            page=pagemax;
        }
        product=product_page(product,page);
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



    //商品价格排序方法
    private Product[] product_sort(Product[] product,boolean desc){
        for(int i=0;i<product.length;i++){
            for(int j=i;j<product.length;j++){
                if(desc){
                 if(product[i].getPrice()>product[j].getPrice()){
                    Product p=product[i];
                    product[i]=product[j];
                    product[j]=p;
                 }
                }else{
                    if(product[i].getPrice()<product[j].getPrice()){
                        Product p=product[i];
                        product[i]=product[j];
                        product[j]=p;
                    }
                }
            }
        }
        return  product;
    }

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

    //商品新品排序
    private Product[] product_new(Product[] product){
        for(int i=0;i<product.length;i++){
            for(int j=i;j<product.length;j++){
                if(product[i].getTime().getTime()<product[j].getTime().getTime()){
                    Product p=product[i];
                    product[i]=product[j];
                    product[j]=p;
                }
            }
        }
        return product;
    }

    //数据截取 分页使用
    private Product[] product_page(Product[] product,Integer page){
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

    //截取同个分类的商品
    private Product[] product_type(Product[] product,Integer product_type_id){
        Product[] products = new Product[0];
        for(int i=0;i<product.length;i++){
              if(product[i].getProduct_type_id().getId()!=null&&product[i].getProduct_type_id().getId().equals(product_type_id)){
                  products = Arrays.copyOf(products, products.length+1) ;
                  products[products.length-1]=product[i];
              }
        }
        return  products;
    }

}
