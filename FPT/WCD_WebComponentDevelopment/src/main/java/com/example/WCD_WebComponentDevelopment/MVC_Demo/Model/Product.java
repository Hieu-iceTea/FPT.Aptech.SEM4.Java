package com.example.WCD_WebComponentDevelopment.MVC_Demo.Model;

import MyUtilities.DatabaseUtility;
import com.example.WCD_WebComponentDevelopment.MVC_Demo.Service.ProductDatabaseUtility;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
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

    //region - Query SQL Methods -
    private static ProductDatabaseUtility getUserDatabaseUtility() {
        try {
            Context initContext = null;
            DataSource dataSource;

            initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/mysql/WCD_WebComponentDevelopment");

            return new ProductDatabaseUtility(dataSource);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public static List<Product> all() {
        //Cách 1: Mapping model bằng tay thủ công
        /*try {
            return getUserDatabaseUtility().all();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }*/

        //Cách 2: Tự lập trình chức năng "Auto Mapping To Model", để tái sử dụng nhiều lần
        return (List<Product>) DatabaseUtility.executeQuery_AutoMappingToModel("SELECT * FROM product WHERE deleted = false ORDER BY id DESC", Product.class.getName());
    }

    public static Product find(int id) {
        //Cách 1: Mapping model bằng tay thủ công
        /*try {
            return getUserDatabaseUtility().find(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }*/

        //Cách 2: Tự lập trình chức năng "Auto Mapping To Model", để tái sử dụng nhiều lần
        List<?> result = DatabaseUtility.executeQuery_AutoMappingToModel("SELECT * FROM product WHERE deleted = false and id = " + id, Product.class.getName());
        if (result.size() == 0) {
            return null;
        }

        return (Product) result.get(0);
    }

    public static void create(Product product) {
        try {
            getUserDatabaseUtility().create(product);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void update(Product product) {
        try {
            getUserDatabaseUtility().update(product);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void delete(int id) {
        try {
            getUserDatabaseUtility().delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Product> search(String keyword) {
        //Cách 1: Mapping model bằng tay thủ công
        /*try {
            return getUserDatabaseUtility().search();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }*/

        //Cách 2: Tự lập trình chức năng "Auto Mapping To Model", để tái sử dụng nhiều lần
        return (List<Product>) DatabaseUtility.executeQuery_AutoMappingToModel("SELECT * FROM product WHERE deleted = false and name like '%" + keyword + "%' ORDER BY id DESC", Product.class.getName());
    }
    //endregion

/*    public static List<Product> all() {
        List<?> result = DatabaseUtility.executeQuery("SELECT * FROM product ORDER BY id DESC", Product.class.getName());

        return (List<Product>) result;
    }

    public static Product find(int id) {
        List<?> result = DatabaseUtility.executeQuery("SELECT * FROM product WHERE id = " + id, Product.class.getName());
        if (result.size() == 0) {
            return null;
        }

        return (Product) result.get(0);
    }*/
}
