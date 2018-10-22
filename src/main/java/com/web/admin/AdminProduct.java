package com.web.admin;

import com.bean.ProductBean;
import com.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

//管理商品表
@Controller
@RequestMapping(value = "/admin/index")
public class AdminProduct {

    @Resource
    ProductBean productbean;

   //跳转到页面
    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public String admin_product(HttpServletRequest request){
        Product[] product=productbean.all();
        request.setAttribute("product",product);
        return "admin/product_list.jsp";
    }
}
