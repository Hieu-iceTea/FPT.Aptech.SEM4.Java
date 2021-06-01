package com.example.WCD_WebComponentDevelopment.MVC_Demo.Service;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.User;

import javax.sql.DataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class UserDatabaseUtility {

    private DataSource dataSource;

    public UserDatabaseUtility(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    //region - Query SQL Methods -
    public List<User> all() throws Exception {

        List<User> items = new ArrayList<>();

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // get a connection
            connection = dataSource.getConnection();

            // create sql statement
            String sql = "select * from wcd_webcomponentdevelopment.user order by id desc ";

            statement = connection.createStatement();

            // execute query
            resultSet = statement.executeQuery(sql);

            // process result set
            while (resultSet.next()) {
                // get new item object
                User tempItem = getUserFormResultSet(resultSet);

                // add it to the list of items
                items.add(tempItem);
            }

            return items;
        } finally {
            // close JDBC objects
            close(connection, statement, resultSet);
        }
    }

    public User find(int id) throws Exception {
        User item = null;

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // get connection to database
            connection = dataSource.getConnection();

            // create sql to get selected item
            String sql = "select * from wcd_webcomponentdevelopment.user where id = ? ";

            // create prepared statement
            preparedStatement = connection.prepareStatement(sql);

            // set params
            preparedStatement.setInt(1, id);

            // execute statement
            resultSet = preparedStatement.executeQuery();

            // retrieve data from result set row
            if (resultSet.next()) {
                item = getUserFormResultSet(resultSet);
            } else {
                throw new Exception("Could not find item id: " + id);
            }

            return item;
        } finally {
            // clean up JDBC objects
            close(connection, preparedStatement, resultSet);
        }
    }

    public void create(User item) throws Exception {

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // get db connection
            connection = dataSource.getConnection();

            // create sql for insert
            String sql = "insert into wcd_webcomponentdevelopment.user "
                    + "(username, password, firstname, lastname, gender, email, phone, address, level, image, active) "
                    + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

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

    public void update(User item) throws Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // get db connection
            connection = dataSource.getConnection();

            // create SQL update statement
            String sql = "UPDATE wcd_webcomponentdevelopment.user "
                    + "SET username = ?, password = ?, firstname = ?, lastname = ?, gender = ?, email = ?, phone = ?, address = ?, level = ?, image = ?, active = ?, updated_at = ?, updated_by = ?, version = ? "
                    + "WHERE id = ?";

            // prepare statement
            preparedStatement = connection.prepareStatement(sql);

            // set params
            setPreparedStatement(preparedStatement, item);
            preparedStatement.setString(12, (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(Calendar.getInstance().getTime()));
            preparedStatement.setString(13, "Hieu_iceTea");
            preparedStatement.setInt(14, item.getVersion() + 1);
            preparedStatement.setInt(15, item.getId());

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
            String sql = "delete from wcd_webcomponentdevelopment.user where id = ? ";

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
    private User getUserFormResultSet(ResultSet resultSet) throws SQLException {
        // create new item object
        User tempItem = new User();

        // retrieve data from result set row & set data
        tempItem.setId(resultSet.getInt("id"));

        tempItem.setUsername(resultSet.getString("username"));
        tempItem.setPassword(resultSet.getString("password"));
        tempItem.setFirstname(resultSet.getString("firstname"));
        tempItem.setLastname(resultSet.getString("lastname"));
        tempItem.setGender(resultSet.getInt("gender"));
        tempItem.setEmail(resultSet.getString("email"));
        tempItem.setPhone(resultSet.getString("phone"));
        tempItem.setAddress(resultSet.getString("address"));
        tempItem.setLevel(resultSet.getInt("level"));
        tempItem.setImage(resultSet.getString("image"));
        tempItem.setActive(resultSet.getBoolean("active"));

        tempItem.setCreatedAt(resultSet.getDate("created_at"));
        tempItem.setCreatedBy(resultSet.getString("created_by"));
        tempItem.setUpdatedAt(resultSet.getDate("updated_at"));
        tempItem.setUpdatedBy(resultSet.getString("updated_by"));
        tempItem.setVersion(resultSet.getInt("version"));
        tempItem.setDeleted(resultSet.getBoolean("deleted"));

        return tempItem;
    }

    private void setPreparedStatement(PreparedStatement preparedStatement, User item) throws SQLException {
        preparedStatement.setString(1, item.getUsername());
        preparedStatement.setString(2, item.getPassword());
        preparedStatement.setString(3, item.getFirstname());
        preparedStatement.setString(4, item.getLastname());
        preparedStatement.setInt(5, item.getGender());
        preparedStatement.setString(6, item.getEmail());
        preparedStatement.setString(7, item.getPhone());
        preparedStatement.setString(8, item.getAddress());
        preparedStatement.setInt(9, item.getLevel());
        preparedStatement.setString(10, item.getImage());
        preparedStatement.setBoolean(11, item.getActive());
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
