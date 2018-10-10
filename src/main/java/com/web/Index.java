package com.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//跳转前后台
@Controller
public class Index {
    /*
   * 跳转到前台页面
   */
  @RequestMapping(value = "/shop")
    public String shop(){
        return "/shop/index.jsp";
    }


}
