package com.web;

import com.bean.ProductBean;
import com.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

//跳转前后台
@Controller
public class Index {
    @Resource
    private ProductBean productbean;
    /*
   * 跳转到前台页面
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
