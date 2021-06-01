package com.example.WCD_WebComponentDevelopment.MVC_Demo.Model;

import MyUtilities.Utility;

import java.util.List;

public class Product extends BaseModel {
    private int ProductCategoryId;
    private int RestaurantId;
    private String Name;
    private String Ingredients;
    private Double Price;
    private String Image;
    private String Country;
    private String Tag;
    private String Description;
    private Boolean Featured;

    public int getProductCategoryId() {
        return ProductCategoryId;
    }

    public void setProductCategoryId(int productCategoryId) {
        ProductCategoryId = productCategoryId;
    }

    public int getRestaurantId() {
        return RestaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        RestaurantId = restaurantId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getIngredients() {
        return Ingredients;
    }

    public void setIngredients(String ingredients) {
        Ingredients = ingredients;
    }

    public Double getPrice() {
        return Price;
    }

    public void setPrice(Double price) {
        Price = price;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }

    public String getCountry() {
        return Country;
    }

    public void setCountry(String country) {
        Country = country;
    }

    public String getTag() {
        return Tag;
    }

    public void setTag(String tag) {
        Tag = tag;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public Boolean getFeatured() {
        return Featured;
    }

    public void setFeatured(Boolean featured) {
        Featured = featured;
    }

    public static List<Product> all() {
        List<?> result = Utility.executeQuery("SELECT * FROM product ORDER BY id DESC", Product.class.getName());

        return (List<Product>) result;
    }

    public static Product find(int id) {
        List<?> result = Utility.executeQuery("SELECT * FROM product WHERE id = " + id, Product.class.getName());
        if (result.size() == 0) {
            return null;
        }

        return (Product) result.get(0);
    }
}
