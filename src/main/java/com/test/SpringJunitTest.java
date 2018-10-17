package com.test;

import com.dao.*;
import com.model.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/*
 * 
 * @author ljy
 * 说明：
 * 首先这里使用注解，必须在spring中配置自动扫描，完成对指定的注解
 * 
 * RunWith是junit4的注解 意思是此类由这个注解的参数的类来主导单元测试 参数类型是Class
 * SpringJUnit4ClassRunner.class是SpringTest中的一个类 作用类似驱动 意思是由Spring Test来主导本次单元测试
 * 
 * @ContextConfiguration(locations={"classpath:applicationContext.xml"})
 * ContextConfiguration的作用是定位你的上下文配置文件 作用就是减少硬编码 getBean之类的
 * 一旦开始测试 Spring 测试框架就去指定位置读取配置文件 完成依赖注入
 * 
 * @TransactionConfiguration(transactionManager="txManager",defaultRollback=true)
 * 该注解可以默认，即不填
TransactionConfiguration 顾名思义 是配置事务情况的注解
第一个参数transactionManager是你在applicationContext.xml或bean.xml中定义的事务管理器的bean的id 
defaultRollback是个很关键的参数 是表示测试完成后事务是否会滚 参数是布尔型的 默认就是true 但强烈建议写上true
 */
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})  
@TransactionConfiguration(transactionManager="txManager",defaultRollback=false )
@Transactional 
public class SpringJunitTest {
    @Resource
   private UserDao userdao;
    @Resource
    private AdminDao admindao;
    @Resource
    private ProductDao productdao;
    @Resource
    private Product_typeDao product_typedao;
    @Resource
    private Product_commentDao product_commentdao;
    @Resource
    private RecommendDao recommenddao;

    /*
    用户表---------------------------------------------------------------------------------------------
     */
    //1、用户登录测试
   @Test
    public void Test1(){
          User user=userdao.login("user","123456");
          System.out.println("用户名："+user.getName());
    }
    //注册功能测试
    @Test
    public void Testzhuce(){
       if(userdao.zhuce("12345678901","123456")!=0){
           System.out.println("注册成功");
       }else{
           System.out.println("注册失败，可能同名了改一下名字试试");
       }
    }

    //同名检测功能测试
    @Test
    public void Testzhucetm(){
       if(userdao.zhuce_tm("user")==null){
           System.out.println("账号可用");
       }else{
           System.out.println("账号不可用");
       }
    }

    /*
    管理员表---------------------------------------------------------------------------------------------
     */
    //1、管理员登录测试
    @Test
    public void Test2(){
       Admin admin=admindao.login("admin","123456");
       System.out.println(admin.getId());
    }

    /*
   商品表---------------------------------------------------------------------------------------------
 */
    //1、查询所有商品测试
    @Test
    public void Test3(){
       Product[] product=productdao.all();
       for(int i=0;i<product.length;i++){
           System.out.println(product[i].getName());
       }
        System.out.println("总商品数"+product.length);
    }

        /*
    商品分类表---------------------------------------------------------------------------------------------
     */
    //1、查询所有
    @Test
    public void Test4(){
        Product_type[] prdocut_type=product_typedao.all();
        for(int i=0;i<prdocut_type.length;i++){
            System.out.println(prdocut_type[i].getName());
        }
    }

    /*
    商品评论表-------------------------------------------------------------
     */
    @Test
    public void Testcomment(){
        Product_comment[] pro=product_commentdao.all();
        System.out.println(pro.length);
    }

    /*
    推荐表
     */
    @Test
    public void TestRecommned(){
        Recommend[] re=recommenddao.all();
        for (int i=0;i<re.length;i++){
            System.out.println(re[i].getCommend());
        }
    }
}
