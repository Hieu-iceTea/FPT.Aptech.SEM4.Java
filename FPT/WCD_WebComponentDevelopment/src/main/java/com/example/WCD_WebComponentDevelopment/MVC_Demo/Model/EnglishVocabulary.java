package com.example.WCD_WebComponentDevelopment.MVC_Demo.Model;

import MyUtilities.DatabaseUtility;
import com.example.WCD_WebComponentDevelopment.MVC_Demo.Service.EnglishVocabularyDatabaseUtility;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.List;

public class EnglishVocabulary extends BaseModel {
    private String Word;
    private String Phonetic;
    private String Mean;
    private Boolean Status;

    //region - Getter, Setter -

    public String getWord() {
        return Word;
    }

    public void setWord(String word) {
        Word = word;
    }

    public String getPhonetic() {
        return Phonetic;
    }

    public void setPhonetic(String phonetic) {
        Phonetic = phonetic;
    }

    public String getMean() {
        return Mean;
    }

    public void setMean(String mean) {
        Mean = mean;
    }

    public Boolean getStatus() {
        return Status;
    }

    public void setStatus(Boolean status) {
        Status = status;
    }

    //endregion


    //region - Query SQL Methods -
    private static EnglishVocabularyDatabaseUtility getEnglishVocabularyDatabaseUtility() {
        try {
            Context initContext = null;
            DataSource dataSource;

            initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/mysql/WCD_WebComponentDevelopment");

            return new EnglishVocabularyDatabaseUtility(dataSource);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public static List<EnglishVocabulary> all() {
        //Cách 1: Mapping model bằng tay thủ công
        /*try {
            return getEnglishVocabularyDatabaseUtility().all();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }*/

        //Cách 2: Tự lập trình chức năng "Auto Mapping To Model", để tái sử dụng nhiều lần
        return (List<EnglishVocabulary>) DatabaseUtility.executeQuery_AutoMappingToModel("SELECT * FROM english_vocabulary WHERE deleted = false ORDER BY id DESC", EnglishVocabulary.class.getName());
    }

    public static EnglishVocabulary find(int id) {
        //Cách 1: Mapping model bằng tay thủ công
        /*try {
            return getEnglishVocabularyDatabaseUtility().find(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }*/

        //Cách 2: Tự lập trình chức năng "Auto Mapping To Model", để tái sử dụng nhiều lần
        List<?> result = DatabaseUtility.executeQuery_AutoMappingToModel("SELECT * FROM english_vocabulary WHERE deleted = false and id = " + id, EnglishVocabulary.class.getName());
        if (result.size() == 0) {
            return null;
        }

        return (EnglishVocabulary) result.get(0);
    }

    public static void create(EnglishVocabulary englishVocabulary) {
        try {
            getEnglishVocabularyDatabaseUtility().create(englishVocabulary);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void update(EnglishVocabulary englishVocabulary) {
        try {
            getEnglishVocabularyDatabaseUtility().update(englishVocabulary);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void delete(int id) {
        try {
            getEnglishVocabularyDatabaseUtility().delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<EnglishVocabulary> search(String keyword) {
        //Cách 1: Mapping model bằng tay thủ công
        /*try {
            return getEnglishVocabularyDatabaseUtility().search();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }*/

        //Cách 2: Tự lập trình chức năng "Auto Mapping To Model", để tái sử dụng nhiều lần
        return (List<EnglishVocabulary>) DatabaseUtility.executeQuery_AutoMappingToModel("SELECT * FROM english_vocabulary WHERE deleted = false and word like '%" + keyword + "%' ORDER BY id DESC", EnglishVocabulary.class.getName());
    }
    //endregion

/*    public static List<EnglishVocabulary> all() {
        List<?> result = DatabaseUtility.executeQuery("SELECT * FROM english_vocabulary ORDER BY id DESC", EnglishVocabulary.class.getName());

        return (List<EnglishVocabulary>) result;
    }

    public static EnglishVocabulary find(int id) {
        List<?> result = DatabaseUtility.executeQuery("SELECT * FROM english_vocabulary WHERE id = " + id, EnglishVocabulary.class.getName());
        if (result.size() == 0) {
            return null;
        }

        return (EnglishVocabulary) result.get(0);
    }*/
}
