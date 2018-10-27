package com.web.admin;

import com.bean.AdminBean;
import com.model.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/admin")
public class AdminLogin {

    @Resource
    private AdminBean adminbean;

    //跳转到登录页面
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String adminlogin(){
        return "admin/login.jsp";
    }

    //管理员登录提交
    @ResponseBody
    @RequestMapping(value = "/login/post", method = RequestMethod.POST)
    public Integer adminlogin_post(String name, String pass, HttpSession session){
        if(name==null||pass==null||name.equals("")||pass.equals("")){
            return 2;
        }else{
            Admin admin=adminbean.login(name,pass);
            if(admin!=null){
                session.setAttribute("admin", admin);
                return 1;
            }else{
                return 0;
            }
        }
    }

    //跳转至修改密码
    @RequestMapping(value = "/index/pass", method = RequestMethod.GET)
    public String admin_pass(){
        return "admin/admin_password.jsp";
    }

    //修改密码提交
    @ResponseBody
    @RequestMapping(value = "/index/pass/post", method = RequestMethod.POST)
    public Integer admin_pass_post(Admin admin,String pass2){
        if(admin.getName()==null||admin.getName().equals("")||admin.getPass()==null||admin.getPass().equals("")||pass2==null||pass2.equals("")){
           return 2;
    }else if(!admin.getPass().equals(pass2)){
            return 3;
        }else {
            return adminbean.set(admin);
        }
    }

    //读取所有管理员
    @RequestMapping(value = "/index/list", method = RequestMethod.GET)
    public String admin_list(HttpServletRequest request){
        Admin[] admin=adminbean.all();
        request.setAttribute("admin",admin);
        return "admin/admin_list.jsp";
    }

    //删除管理员
    @ResponseBody
    @RequestMapping(value = "/index/del", method = RequestMethod.GET)
    public Integer admin_del(Integer id,HttpSession session){
        Admin admin=(Admin)session.getAttribute("admin");
       if(admin.getId()!=id){
            return adminbean.del(id);
       }else{
           return 0;
       }
    }

    //跳转至添加
    @RequestMapping(value = "/index/add", method = RequestMethod.GET)
    public String admin_add(HttpServletRequest request){
        request.setAttribute("add_or_edit","true");
        return "admin/admin_add.jsp";
    }

    //跳转至编辑
    @RequestMapping(value = "/index/edit", method = RequestMethod.GET)
    public String admin_edit(Integer id,HttpServletRequest request){
        Admin admin=adminbean.get(id);
        request.setAttribute("admin",admin);
        request.setAttribute("add_or_edit",false);
        return "admin/admin_add.jsp";
    }

    //添加提交
    @ResponseBody
    @RequestMapping(value = "/index/add/post", method = RequestMethod.POST)
    public Integer admin_add_post(Admin admin,String pass2){
        if(admin.getName()==null||admin.getName().equals("")||admin.getPass()==null||admin.getPass().equals("")||pass2==null||pass2.equals("")){
            return 2;
        }else if(!admin.getPass().equals(pass2)){
            return 3;
        }else {
            return adminbean.add(admin);
        }
    }
}
