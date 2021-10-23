package com.example.WCD_WebComponentDevelopment.MVC_Demo.Service;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Product;

import javax.sql.DataSource;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class ProductDatabaseUtility {

    private DataSource dataSource;

    public ProductDatabaseUtility(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    //region - Query SQL Methods -
    public List<Product> all() throws Exception {

        List<Product> items = new ArrayList<>();

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // get a connection
            connection = dataSource.getConnection();

            // create sql statement
            String sql = "select * from wcd_webcomponentdevelopment.product WHERE deleted = false order by id desc "; //xóa mềm: thêm deleted = false

            statement = connection.createStatement();

            // execute query
            resultSet = statement.executeQuery(sql);

            // process result set
            while (resultSet.next()) {
                // get new item object
                Product tempItem = getProductFormResultSet(resultSet);

                // add it to the list of items
                items.add(tempItem);
            }

            return items;
        } finally {
            // close JDBC objects
            close(connection, statement, resultSet);
        }
    }

    public Product find(int id) throws Exception {
        Product item = null;

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // get connection to database
            connection = dataSource.getConnection();

            // create sql to get selected item
            String sql = "select * from wcd_webcomponentdevelopment.product where deleted = false and id = ?"; //xóa mềm: thêm deleted = false

            // create prepared statement
            preparedStatement = connection.prepareStatement(sql);

            // set params
            preparedStatement.setInt(1, id);

            // execute statement
            resultSet = preparedStatement.executeQuery();

            // retrieve data from result set row
            if (resultSet.next()) {
                item = getProductFormResultSet(resultSet);
            } else {
                throw new Exception("Could not find item id: " + id);
            }

            return item;
        } finally {
            // clean up JDBC objects
            close(connection, preparedStatement, resultSet);
        }
    }

    public void create(Product item) throws Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // get db connection
            connection = dataSource.getConnection();

            // create sql for insert
            String sql = "insert into wcd_webcomponentdevelopment.product "
                    + "(product_category_id, restaurant_id, name, ingredients, price, image, country, tag, description, featured) "
                    + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

            preparedStatement = connection.prepareStatement(sql);

            // set the param values for the item
            setPreparedStatement(preparedStatement, item);

            // execute sql insert
            preparedStatement.execute();
        } finally {
            // clean up JDBC objects
            close(connection, preparedStatement, null);
        }
    }

    public void update(Product item) throws Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // get db connection
            connection = dataSource.getConnection();

            // create SQL update statement
            String sql = "UPDATE wcd_webcomponentdevelopment.product "
                    + "SET product_category_id = ?, restaurant_id = ?, name = ?, ingredients = ?, price = ?, image = ?, country = ?, tag = ?, description = ?, featured = ?, updated_at = ?, updated_by = ?, version = ? "
                    + "WHERE id = ?";

            // prepare statement
            preparedStatement = connection.prepareStatement(sql);

            // set params
            setPreparedStatement(preparedStatement, item);
            preparedStatement.setString(11, (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(Calendar.getInstance().getTime()));
            preparedStatement.setString(12, "Hieu_iceTea");
            preparedStatement.setInt(13, item.getVersion() + 1);
            preparedStatement.setInt(14, item.getId());

            // execute SQL statement
            preparedStatement.execute();
        } finally {
            // clean up JDBC objects
            close(connection, preparedStatement, null);
        }
    }

    public void delete(int id) throws Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // get connection to database
            connection = dataSource.getConnection();

            // create sql to delete item
            //String sql = "delete from wcd_webcomponentdevelopment.product where id = ? ";

            //Xóa mềm:
            String sql = "UPDATE wcd_webcomponentdevelopment.product "
                    + "SET deleted = true "
                    + "WHERE id = ?";

            // prepare statement
            preparedStatement = connection.prepareStatement(sql);

            // set params
            preparedStatement.setInt(1, id);

            // execute sql statement
            preparedStatement.execute();
        } finally {
            // clean up JDBC code
            close(connection, preparedStatement, null);
        }
    }
    //endregion

    //region - Common Methods -
    private Product getProductFormResultSet(ResultSet resultSet) throws SQLException {
        // create new item object
        Product item = new Product();

        // retrieve data from result set row & set data
        item.setId(resultSet.getInt("id"));

        item.setProductCategoryId(resultSet.getInt("product_category_id"));
        item.setRestaurantId(resultSet.getInt("restaurant_id"));
        item.setName(resultSet.getString("name"));
        item.setIngredients(resultSet.getString("ingredients"));
        item.setPrice(resultSet.getDouble("price"));
        item.setImage(resultSet.getString("image"));
        item.setCountry(resultSet.getString("country"));
        item.setTag(resultSet.getString("tag"));
        item.setDescription(resultSet.getString("description"));
        item.setFeatured(resultSet.getBoolean("featured"));

        item.setCreatedAt(resultSet.getDate("created_at"));
        item.setCreatedBy(resultSet.getString("created_by"));
        item.setUpdatedAt(resultSet.getDate("updated_at"));
        item.setUpdatedBy(resultSet.getString("updated_by"));
        item.setVersion(resultSet.getInt("version"));
        item.setDeleted(resultSet.getBoolean("deleted"));

        return item;
    }

    private void setPreparedStatement(PreparedStatement preparedStatement, Product item) throws SQLException {
        preparedStatement.setInt(1, item.getProductCategoryId());
        preparedStatement.setInt(2, item.getRestaurantId());
        preparedStatement.setString(3, item.getName());
        preparedStatement.setString(4, item.getIngredients());
        preparedStatement.setDouble(5, item.getPrice());
        preparedStatement.setString(6, item.getImage());
        preparedStatement.setString(7, item.getCountry());
        preparedStatement.setString(8, item.getTag());
        preparedStatement.setString(9, item.getDescription());
        preparedStatement.setBoolean(10, item.getFeatured());
    }

    private void close(Connection connection, Statement statement, ResultSet resultSet) {

        try {
            if (resultSet != null) {
                resultSet.close();
            }

            if (statement != null) {
                statement.close();
            }

            if (connection != null) {
                connection.close();   // doesn't really close it ... just puts back in connection pool
            }
        } catch (Exception exc) {
            exc.printStackTrace();
        }
    }
    //endregion
}
