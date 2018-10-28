package com.web.admin;

import com.bean.ProductBean;
import com.bean.UserBean;
import com.bean.User_collectionBean;
import com.model.Product;
import com.model.User;
import com.model.User_collection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/admin/index")
public class AdminCollection {
    @Resource
    private User_collectionBean user_collectionbean;
    @Resource
    private UserBean userbean;
    @Resource
    private ProductBean productbean;

    //跳转至用户表
    @RequestMapping(value = "/user_collection", method = RequestMethod.GET)
    public String admin_user_collection(HttpServletRequest request){
        User_collection[] user_collection=user_collectionbean.all();
        request.setAttribute("user_collection",user_collection);
        return "admin/user_collection_list.jsp";
    }

    //删除
    @ResponseBody
     @RequestMapping(value = "/user_collection/del", method = RequestMethod.GET)
    public Integer admin_collection_del(Integer id){
        return  user_collectionbean.del(id);
    }

    //跳转添加
    @RequestMapping(value = "/user_collection/add", method = RequestMethod.GET)
    public String admin_user_add(HttpServletRequest request){
        User[] user=userbean.all();
        request.setAttribute("user",user);
        Product[] product=productbean.all();
        request.setAttribute("product",product);
        request.setAttribute("add_or_edit",true);
        return "admin/user_collection_add.jsp";
    }

    //跳转编辑
    @RequestMapping(value = "/user_collection/edit", method = RequestMethod.GET)
    public String admin_user_edit(Integer id,HttpServletRequest request){
        User[] user=userbean.all();
        request.setAttribute("user",user);
        Product[] product=productbean.all();
        request.setAttribute("product",product);
        User_collection user_collection=user_collectionbean.get(id);
        request.setAttribute("user_collection",user_collection);
        request.setAttribute("add_or_edit",false);
        return "admin/user_collection_add.jsp";
    }

    //添加提交
    @ResponseBody
    @RequestMapping(value = "/user_collection/add/post", method = RequestMethod.POST)
    public Integer admin_collection_add_post(User_collection user_collection){
        return  user_collectionbean.add(user_collection);
    }

    //编辑提交
    @ResponseBody
    @RequestMapping(value = "/user_collection/edit/post", method = RequestMethod.POST)
    public Integer admin_collection_edit_post(User_collection user_collection){
        return  user_collectionbean.set(user_collection);
    }
}
