package com.web.admin;

import com.bean.AdminBean;
import com.bean.RecommendBean;
import com.model.Admin;
import com.model.Product_type;
import com.model.Recommend;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/admin/index")
public class AdminRecommend {
    @Resource
    private RecommendBean recommendbean;
    @Resource
    private AdminBean adminbean;

    //跳转到页面
    @RequestMapping(value = "/recommend", method = RequestMethod.GET)
    public String admin_recommned(HttpServletRequest request){
        Recommend[] recommend=recommendbean.all();
        request.setAttribute("recommend",recommend);
        return "admin/recommend_list.jsp";
    }

    //删除操作
    @ResponseBody
    @RequestMapping(value = "/recommend/del", method = RequestMethod.GET)
    public Integer admin_recommned_del(Integer id){
        return  recommendbean.del(id);
    }

    //跳转至编辑操作
    @RequestMapping(value = "/recommend/edit", method = RequestMethod.GET)
    public String admin_recommend_edit(Integer id,HttpServletRequest request){
        Recommend recommend=recommendbean.get(id);
        request.setAttribute("recommend",recommend);
        Admin[] admin=adminbean.all();
        request.setAttribute("admin",admin);
        request.setAttribute("add_or_edit",false);
        return "admin/recommend_add.jsp";
    }

    //跳转至添加操作
    @RequestMapping(value = "/recommend/add", method = RequestMethod.GET)
    public String admin_recommend_add(HttpServletRequest request){
        Admin[] admin=adminbean.all();
        request.setAttribute("admin",admin);
        request.setAttribute("add_or_edit",true);
        return "admin/recommend_add.jsp";
    }

    //编辑提交
    @ResponseBody
    @RequestMapping(value = "/recommend/edit/post", method = RequestMethod.POST)
    public Integer admin_recommend_edit_post(Recommend recommend){
        return  recommendbean.set(recommend);
    }

    //添加提交\
    @ResponseBody
    @RequestMapping(value = "/recommend/add/post", method = RequestMethod.POST)
    public Integer admin_recommend_add_post(Recommend recommend){
        return  recommendbean.add(recommend);
    }

    //
}
