package com.web.admin;

import com.bean.ProductBean;
import com.bean.Product_typeBean;
import com.bean.UserBean;
import com.model.Product;
import com.model.Product_type;
import com.model.User;
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
    @Resource
    Product_typeBean product_typebean;
    @Resource
    UserBean userbean;

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
    public String admin_product_add(HttpServletRequest request){
        //分类获取
        Product_type[] product_type=product_typebean.all();
        request.setAttribute("product_type",product_type);
        //获取用户表
        User[] user=userbean.all();
        request.setAttribute("user",user);
        //区分添加或者编辑
        request.setAttribute("add_or_edit",true);
      return "admin/product_add.jsp";
    }

    //添加提交
    @ResponseBody
    @RequestMapping(value = "/product/add/post", method = RequestMethod.POST)
    public Integer admin_product_adds(Product product){
//        System.out.println("名字"+product.getName());
//        System.out.println("点击数"+product.getClick());
//        System.out.println("电话"+product.getPhone());
//        System.out.println("价格"+product.getPrice());
//        System.out.println("原价格"+product.getPrices());
//        System.out.println("分类"+product.getProduct_type_id().getId());
//        System.out.println("qq"+product.getQq());
//        System.out.println("微信"+product.getWeixin());
//        System.out.println("库存"+product.getSum());
//        System.out.println("详情"+product.getRemake());
//        System.out.println("用户"+product.getUser_id().getId());
//        System.out.println("上架"+product.isDisplay());
        System.out.println("日期"+product.getTime());
         return productbean.in(product);
    }

    //跳转至编辑
    //跳转至添加
    @RequestMapping(value = "/product/edit", method = RequestMethod.GET)
    public String admin_product_edit(HttpServletRequest request,Integer id){
        //分类获取
        Product_type[] product_type=product_typebean.all();
        request.setAttribute("product_type",product_type);
        //获取用户表
        User[] user=userbean.all();
        request.setAttribute("user",user);
        //获取商品信息
        Product product=productbean.get(id);
        request.setAttribute("product",product);
        //区分添加或者编辑
        request.setAttribute("add_or_edit",false);
        return "admin/product_add.jsp";
    }
}
