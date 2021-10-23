package com.example.WCD_WebComponentDevelopment.MVC_Demo.Service;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.EnglishVocabulary;

import javax.sql.DataSource;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class EnglishVocabularyDatabaseUtility {

    private DataSource dataSource;

    public EnglishVocabularyDatabaseUtility(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    //region - Query SQL Methods -
    public List<EnglishVocabulary> all() throws Exception {

        List<EnglishVocabulary> items = new ArrayList<>();

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // get a connection
            connection = dataSource.getConnection();

            // create sql statement
            String sql = "select * from wcd_webcomponentdevelopment.english_vocabulary WHERE deleted = false order by id desc "; //xóa mềm: thêm deleted = false

            statement = connection.createStatement();

            // execute query
            resultSet = statement.executeQuery(sql);

            // process result set
            while (resultSet.next()) {
                // get new item object
                EnglishVocabulary tempItem = getEnglishVocabularyFormResultSet(resultSet);

                // add it to the list of items
                items.add(tempItem);
            }

            return items;
        } finally {
            // close JDBC objects
            close(connection, statement, resultSet);
        }
    }

    public EnglishVocabulary find(int id) throws Exception {
        EnglishVocabulary item = null;

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // get connection to database
            connection = dataSource.getConnection();

            // create sql to get selected item
            String sql = "select * from wcd_webcomponentdevelopment.english_vocabulary where deleted = false and id = ?"; //xóa mềm: thêm deleted = false

            // create prepared statement
            preparedStatement = connection.prepareStatement(sql);

            // set params
            preparedStatement.setInt(1, id);

            // execute statement
            resultSet = preparedStatement.executeQuery();

            // retrieve data from result set row
            if (resultSet.next()) {
                item = getEnglishVocabularyFormResultSet(resultSet);
            } else {
                throw new Exception("Could not find item id: " + id);
            }

            return item;
        } finally {
            // clean up JDBC objects
            close(connection, preparedStatement, resultSet);
        }
    }

    public void create(EnglishVocabulary item) throws Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // get db connection
            connection = dataSource.getConnection();

            // create sql for insert
            String sql = "insert into wcd_webcomponentdevelopment.english_vocabulary "
                    + "(word, phonetic, mean, status) "
                    + "values (?, ?, ?, ?) ";

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

    public void update(EnglishVocabulary item) throws Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // get db connection
            connection = dataSource.getConnection();

            // create SQL update statement
            String sql = "UPDATE wcd_webcomponentdevelopment.english_vocabulary "
                    + "SET word = ?, phonetic = ?, mean = ?, status = ?, updated_at = ?, updated_by = ?, version = ? "
                    + "WHERE id = ?";

            // prepare statement
            preparedStatement = connection.prepareStatement(sql);

            // set params
            setPreparedStatement(preparedStatement, item);
            preparedStatement.setString(5, (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(Calendar.getInstance().getTime()));
            preparedStatement.setString(6, "Hieu_iceTea");
            preparedStatement.setInt(7, item.getVersion() + 1);
            preparedStatement.setInt(8, item.getId());

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
            //String sql = "delete from wcd_webcomponentdevelopment.englishVocabulary where id = ? ";

            //Xóa mềm:
            String sql = "UPDATE wcd_webcomponentdevelopment.english_vocabulary "
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
    private EnglishVocabulary getEnglishVocabularyFormResultSet(ResultSet resultSet) throws SQLException {
        // create new item object
        EnglishVocabulary item = new EnglishVocabulary();

        // retrieve data from result set row & set data
        item.setId(resultSet.getInt("id"));

        item.setWord(resultSet.getString("word"));
        item.setPhonetic(resultSet.getString("phonetic"));
        item.setMean(resultSet.getString("mean"));
        item.setStatus(resultSet.getBoolean("status"));

        item.setCreatedAt(resultSet.getDate("created_at"));
        item.setCreatedBy(resultSet.getString("created_by"));
        item.setUpdatedAt(resultSet.getDate("updated_at"));
        item.setUpdatedBy(resultSet.getString("updated_by"));
        item.setVersion(resultSet.getInt("version"));
        item.setDeleted(resultSet.getBoolean("deleted"));

        return item;
    }

    private void setPreparedStatement(PreparedStatement preparedStatement, EnglishVocabulary item) throws SQLException {
        preparedStatement.setString(1, item.getWord());
        preparedStatement.setString(2, item.getPhonetic());
        preparedStatement.setString(3, item.getMean());
        preparedStatement.setBoolean(4, item.getStatus());
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
