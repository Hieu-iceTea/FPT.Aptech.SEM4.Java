package Hieu_iceTea.Practice_WCD.Service;

import Hieu_iceTea.Practice_WCD.Model.Employee;

import javax.sql.DataSource;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class EmployeeDatabaseUtility {

    private DataSource dataSource;

    public EmployeeDatabaseUtility(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    //region - Query SQL Methods -
    /*public List<Employee> all() throws Exception {

        List<Employee> items = new ArrayList<>();

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // get a connection
            connection = dataSource.getConnection();

            // create sql statement
            String sql = "select * from wcd_webcomponentdevelopment_practice.employee WHERE deleted = false order by id desc "; //xóa mềm: thêm deleted = false

            statement = connection.createStatement();

            // execute query
            resultSet = statement.executeQuery(sql);

            // process result set
            while (resultSet.next()) {
                // get new item object
                Employee tempItem = getProductFormResultSet(resultSet);

                // add it to the list of items
                items.add(tempItem);
            }

            return items;
        } finally {
            // close JDBC objects
            close(connection, statement, resultSet);
        }
    }*/

    /*public Employee find(int id) throws Exception {
        Employee item = null;

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // get connection to database
            connection = dataSource.getConnection();

            // create sql to get selected item
            String sql = "select * from wcd_webcomponentdevelopment_practice.employee where deleted = false and id = ?"; //xóa mềm: thêm deleted = false

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
    }*/

    public void create(Employee item) throws Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // get db connection
            connection = dataSource.getConnection();

            // create sql for insert
            String sql = "insert into wcd_webcomponentdevelopment_practice.employee "
                    + "(full_name, birthday, address, position, department) "
                    + "values (?, ?, ?, ?, ?) ";

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

    public void update(Employee item) throws Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // get db connection
            connection = dataSource.getConnection();

            // create SQL update statement
            String sql = "UPDATE wcd_webcomponentdevelopment_practice.employee "
                    + "SET full_name = ?, birthday = ?, address = ?, position = ?, department = ?, updated_at = ?, updated_by = ?, version = ? "
                    + "WHERE id = ?";

            // prepare statement
            preparedStatement = connection.prepareStatement(sql);

            // set params
            setPreparedStatement(preparedStatement, item);
            preparedStatement.setString(6, (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(Calendar.getInstance().getTime()));
            preparedStatement.setString(7, "Hieu_iceTea");
            preparedStatement.setInt(8, item.getVersion() + 1);
            preparedStatement.setInt(9, item.getId());

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
            //String sql = "delete from wcd_webcomponentdevelopment_practice.employee where id = ? ";

            //Xóa mềm:
            String sql = "UPDATE wcd_webcomponentdevelopment_practice.employee "
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
    private Employee getProductFormResultSet(ResultSet resultSet) throws SQLException {
        // create new item object
        Employee item = new Employee();

        // retrieve data from result set row & set data
        item.setId(resultSet.getInt("id"));

        item.setFullName(resultSet.getString("full_name"));
        item.setBirthday(resultSet.getDate("birthday"));
        item.setAddress(resultSet.getString("address"));
        item.setPosition(resultSet.getString("position"));
        item.setDepartment(resultSet.getString("department"));

        item.setCreatedAt(resultSet.getDate("created_at"));
        item.setCreatedBy(resultSet.getString("created_by"));
        item.setUpdatedAt(resultSet.getDate("updated_at"));
        item.setUpdatedBy(resultSet.getString("updated_by"));
        item.setVersion(resultSet.getInt("version"));
        item.setDeleted(resultSet.getBoolean("deleted"));

        return item;
    }

    private void setPreparedStatement(PreparedStatement preparedStatement, Employee item) throws SQLException {
        preparedStatement.setString(1, item.getFullName());
        preparedStatement.setString(2, (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(item.getBirthday()));
        preparedStatement.setString(3, item.getAddress());
        preparedStatement.setString(4, item.getPosition());
        preparedStatement.setString(5, item.getDepartment());
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
