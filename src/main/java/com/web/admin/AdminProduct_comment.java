package com.web.admin;

import com.bean.ProductBean;
import com.bean.Product_commentBean;
import com.bean.UserBean;
import com.model.Product;
import com.model.Product_comment;
import com.model.Product_type;
import com.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/admin/index")
public class AdminProduct_comment {
    @Resource
    Product_commentBean product_commentbean;
    @Resource
    ProductBean productboean;
    @Resource
    UserBean userbean;

    //跳转到评论表
    @RequestMapping(value = "/product_comment", method = RequestMethod.GET)
    public String admin_product_comment(HttpServletRequest request){
        Product_comment[] product_comment=product_commentbean.all();
        request.setAttribute("product_comment",product_comment);
        return "admin/product_comment_list.jsp";
    }

    //删除评论
    @ResponseBody
    @RequestMapping(value = "/product_comment/del", method = RequestMethod.GET)
    public Integer admin_product_comment_del(Integer id){
           return  product_commentbean.del(id);
    }

    //跳转至编辑评论
    @RequestMapping(value = "/product_comment/edit", method = RequestMethod.GET)
    public String admin_prodcut_comment_edit(HttpServletRequest request,Integer id){

        Product product[] =productboean.all();
        request.setAttribute("product",product);

        User user[]=userbean.all();
        request.setAttribute("user",user);

        request.setAttribute("add_or_edit",false);
        Product_comment product_comment=product_commentbean.get(id);
        request.setAttribute("product_comment",product_comment);
        return "admin/product_comment_add.jsp";
    }

    //跳转至添加评论
    @RequestMapping(value = "/product_comment/add", method = RequestMethod.GET)
    public String admin_prodcut_comment_add(HttpServletRequest request){
        Product product[] =productboean.all();
        request.setAttribute("product",product);

        User user[]=userbean.all();
        request.setAttribute("user",user);
        request.setAttribute("add_or_edit",true);
        return "admin/product_comment_add.jsp";
    }

    //添加评论提交
    @ResponseBody
    @RequestMapping(value = "/product_comment/add/post", method = RequestMethod.POST)
    public Integer admin_product_comment_add_post(Product_comment product_comment){
     return  product_commentbean.add(product_comment);
    }

    //编辑评论提交
    @ResponseBody
    @RequestMapping(value = "/product_comment/edit/post", method = RequestMethod.POST)
    public Integer admin_product_comment_add_edit(Product_comment product_comment) {
        return product_commentbean.set(product_comment);
    }
}
