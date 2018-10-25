package com.web.admin;

import com.bean.Product_typeBean;
import com.model.Product;
import com.model.Product_type;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    //删除分类
    @ResponseBody
    @RequestMapping(value = "/product_type/del", method = RequestMethod.GET)
    public Integer admin_product_type_del(Integer id){
        return product_typebean.del(id);
    }

    //跳转至添加分类
    @RequestMapping(value = "/product_type/add",method = RequestMethod.GET)
    public String admin_product_type_add(HttpServletRequest request){
        request.setAttribute("add_or_edit",true);
        return "admin/product_type_add.jsp";
    }
    //跳转至编辑分类
    @RequestMapping(value = "/product_type/edit",method = RequestMethod.GET)
    public String admin_product_type_edit(HttpServletRequest request,Integer id){
        Product_type product_type=product_typebean.get(id);
        request.setAttribute("product_type",product_type);
        request.setAttribute("add_or_edit",false);
        return "admin/product_type_add.jsp";
    }
    //添加分类提交
    @ResponseBody
    @RequestMapping(value = "/product_type/add/post", method = RequestMethod.POST)
    public Integer admin_product_type_add_post(Product_type product_type){
        return  product_typebean.in(product_type);
    }
    //编辑分类提交
    @ResponseBody
    @RequestMapping(value = "/product_type/edit/post", method = RequestMethod.POST)
    public Integer admin_product_type_edit_post(Product_type product_type){
        return  product_typebean.set(product_type);
    }
}
