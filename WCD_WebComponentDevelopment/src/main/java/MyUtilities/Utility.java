package MyUtilities;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Utility {

    /**
     * Hieu_iceTea
     *
     * @param query
     * @param className
     * @return
     */
    public static List<?> executeQuery(String query, String className) {
        try {
            Context initialContext = new InitialContext();
            Context environmentContext = (Context) initialContext.lookup("java:comp/env");
            DataSource dataSource = (DataSource) environmentContext.lookup("jdbc/mysql/WCD_WebComponentDevelopment");

            Connection connection = dataSource.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

            ResultSetMetaData resultSetMetaData = resultSet.getMetaData();

            int columnCount = resultSetMetaData.getColumnCount();

            List<Object> lstObject = new ArrayList<>();

            while (resultSet.next()) {
                Class tmpClass = Class.forName(className);
                Constructor tmpConstructor = tmpClass.getConstructor();
                Object tmpObject = tmpConstructor.newInstance();

                for (int i = 1; i <= columnCount; ++i) {
                    String columnName = capitalizeWord(resultSetMetaData.getColumnName(i).replace("_", " ")).replace(" ", "");

                    Field[] fields = tmpClass.getDeclaredFields();
                    boolean hasFieldInModel = Arrays.stream(fields).anyMatch(item -> item.getName().equals(columnName));

                    Class<?> columnType;
                    if (hasFieldInModel) {
                        columnType = tmpClass.getDeclaredField(columnName).getType();
                    } else {
                        Field[] Superclass_fields = tmpClass.getSuperclass().getDeclaredFields();
                        boolean Superclass_hasFieldInModel = Arrays.stream(Superclass_fields).anyMatch(item -> item.getName().equals(columnName));

                        if (!Superclass_hasFieldInModel) {
                            continue;
                        }

                        columnType = tmpClass.getSuperclass().getDeclaredField(columnName).getType();
                    }

                    String columnTypeName = Utility.capitalize(columnType.getSimpleName());

                    Method method_setToObject = tmpClass.getMethod("set" + columnName, columnType);
                    Method method_getFromDataBase = ResultSet.class.getMethod("get" + columnTypeName, int.class);

                    Object dataCell = method_getFromDataBase.invoke(resultSet, i);
                    method_setToObject.invoke(tmpObject, dataCell);
                }
                lstObject.add(tmpObject);
            }

            return lstObject;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * Capitalize the first letter of a string <br>
     * http://attacomsian.com/blog/capitalize-first-letter-of-string-java
     *
     * @param str
     * @return
     */
    public static String capitalize(String str) {
        if (str == null || str.isEmpty()) {
            return str;
        }

        return str.substring(0, 1).toUpperCase() + str.substring(1).toLowerCase();
    }

    /**
     * Capitalize each word in String <br>
     * http://attacomsian.com/blog/capitalize-first-letter-of-string-java
     *
     * @param str
     * @return
     */
    public static String capitalizeWord(String str) {
        String words[] = str.split("\\s");
        String capitalizeWord = "";
        for (String w : words) {
            String first = w.substring(0, 1);
            String afterfirst = w.substring(1);
            capitalizeWord += first.toUpperCase() + afterfirst + " ";
        }
        return capitalizeWord.trim();
    }
}
