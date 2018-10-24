package com.web.admin;

import com.bean.Product_typeBean;
import com.model.Product;
import com.model.Product_type;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/admin/index")
public class AdminProduct_type {
    @Resource
    Product_typeBean product_typebean;

    //跳转到页面
    @RequestMapping(value = "/product_type", method = RequestMethod.GET)
    public String admin_product(HttpServletRequest request){
        Product_type[] product_type=product_typebean.all();
        request.setAttribute("product_type",product_type);
        return "admin/product_type_list.jsp";
    }
}
