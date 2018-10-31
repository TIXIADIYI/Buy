package com.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Product {
    private Integer id;
    private String name;
    private Float price=0f;
    private String remake;
    private String image;
    private Integer sum;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date time=new Date(1,1,1);;

    private Integer click=0;
    private Product_type product_type_id;
    private Float prices=0f;
    private User user_id;
    private boolean display;
    private String phone;
    private String qq;
    private String weixin;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getWeixin() {
        return weixin;
    }

    public void setWeixin(String weixin) {
        this.weixin = weixin;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public boolean isDisplay() {
        return display;
    }

    public void setDisplay(boolean display) {
        this.display = display;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getPrices() {
        return prices;
    }

    public void setPrices(Float prices) {
        this.prices = prices;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemake() {
        return remake;
    }

    public void setRemake(String remake) {
        this.remake = remake;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getSum() {
        return sum;
    }

    public void setSum(Integer sum) {
        this.sum = sum;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    public Product_type getProduct_type_id() {
        return product_type_id;
    }

    public void setProduct_type_id(Product_type product_type_id) {
        this.product_type_id = product_type_id;
    }
}
