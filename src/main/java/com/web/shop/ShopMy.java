package com.web.shop;

import com.bean.ProductBean;
import com.bean.Product_commentBean;
import com.bean.UserBean;
import com.bean.User_collectionBean;
import com.model.Product;
import com.model.Product_comment;
import com.model.User;
import com.model.User_collection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/shop/login/index/my")
public class ShopMy {
    @Resource
    private UserBean userbean;
    @Resource
    private ProductBean productbean;
    @Resource
    private User_collectionBean user_collectionbean;
    @Resource
    private Product_commentBean product_commentbean;

    //跳转至个人中心>我发布的
    @RequestMapping(value = "/fabu", method = RequestMethod.GET)
    public String shoplogin_index_my(HttpSession session, HttpServletRequest request){
        User user=(User)session.getAttribute("user");
        Product[] product=productbean.user_id_get(user.getId());
        request.setAttribute("product",product);
        return "/shop/grzx.jsp";
    }

    //删除发布
    @ResponseBody
    @RequestMapping(value = "/fabu/del", method = RequestMethod.GET)
    public Integer shoplogin_index_my_del(Integer id){
        return  productbean.del(id);
    }

    //跳转至收藏
    @RequestMapping(value = "/collection", method = RequestMethod.GET)
    public String shoplogin_index_my_collection(HttpSession session, HttpServletRequest request){
        User user=(User)session.getAttribute("user");
        User_collection[] user_collection=user_collectionbean.user_id_get(user.getId());
        request.setAttribute("user_collection",user_collection);
        return "/shop/xiangyao.jsp";
    }

    //删除收藏
    @ResponseBody
    @RequestMapping(value = "/collection/del", method = RequestMethod.GET)
    public Integer shoplogin_index_my_collection_del(Integer id){
        return  user_collectionbean.del(id);
    }

    //跳转至评论
    @RequestMapping(value = "/comment", method = RequestMethod.GET)
    public String shoplogin_index_my_comment(HttpSession session,HttpServletRequest request){
        User user=(User)session.getAttribute("user");
        Product_comment[] product_comment=product_commentbean.user_id_get(user.getId());
        request.setAttribute("product_comment",product_comment);
        return "shop/liuyan.jsp";
    }

    //跳转至个人信息
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String shoplogin_index_my_deit(){
        return "shop/xinxi.jsp";
    }

    //个人信息提交
    @ResponseBody
    @RequestMapping(value = "/edit/post", method = RequestMethod.POST)
    public Integer shoplogin_index_my_deit_post(User user,HttpSession session,String pass_ord){
        Integer i=0;
        User users=(User)session.getAttribute("user");
        if(users.getPass()!=null&&users.getPass().equals(pass_ord)){
            if(user.getPass()==null||user.getPass().equals("")){
                user.setPass(pass_ord);
            }
            if(userbean.set(user)!=0){
                i=1;
                session.setAttribute("user",user);
            }else{
                i=0;
            }
        }else{
            i=2;
        }
        return i;
    }
}
