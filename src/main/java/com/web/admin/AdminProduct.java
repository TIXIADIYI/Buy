package com.web.admin;

import com.bean.ProductBean;
import com.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    //上下架商品
    @ResponseBody
    @RequestMapping(value = "/product/display_tf", method = RequestMethod.GET)
    public Integer admin_display_t(Integer id,boolean display){
        return productbean.display_tf(id,display);
    }

    //删除商品
    @ResponseBody
    @RequestMapping(value = "/product/del", method = RequestMethod.GET)
   public Integer admin_del(Integer id){
        return productbean.del(id);
    }

    //跳转至添加
    @RequestMapping(value = "/product/add", method = RequestMethod.GET)
    public String admin_product_add(){
      return "admin/product_add.jsp";
    }

}
