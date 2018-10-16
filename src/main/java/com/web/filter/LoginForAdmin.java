package com.web.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
 * 拦截器
 */
public class LoginForAdmin extends HandlerInterceptorAdapter{
	
/*
 * 登录
 */
	@Override 
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		boolean status=false;
		HttpSession session=request.getSession();
		if(session.getAttribute("admin")!=null){
			status=true;
		}else{
			String path=request.getContextPath();
			String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
			response.sendRedirect((basePath)+"admin/login");
		}
		return status;
	}

}
