package com.web.shop;

import com.bean.ProductBean;
import com.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ShopIndex {
    @Resource
    private ProductBean productbean;
    /*
   * 跳转到前台主页
   */
    @RequestMapping(value = "/shop")
    public String shop(HttpServletRequest request){
        //获取商品
        Product[] product=productbean.all();
        request.setAttribute("product", product);
        //跳转
        return "shop/shop_index.jsp";
    }
}
