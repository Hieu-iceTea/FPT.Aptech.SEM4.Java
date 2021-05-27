package com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Service;

import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.BaseModel;
import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.BaseModel;
import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.Status;
import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.User;
import jakarta.servlet.http.HttpServletRequest;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ContextWithSessionName {

    private static void initialization(HttpServletRequest request, String sessionName, List<BaseModel> items) {
        request.getSession().setAttribute(sessionName, items);
    }

    public static List<BaseModel> all(HttpServletRequest request, String sessionName) {
        List<BaseModel> ItemsFromSession = (List<BaseModel>) request.getSession().getAttribute(sessionName);

        //Xóa cứng
        //return ItemsFromSession;

        //Xóa mềm:
        return ItemsFromSession.stream().filter(item -> !item.getDeleted()).collect(Collectors.toList());
    }

    public static BaseModel find(HttpServletRequest request, String sessionName, int id) {
        List<BaseModel> ItemsFromSession = all(request, sessionName);

        BaseModel BaseModel = ItemsFromSession.stream()
                .filter(item -> item.getId() == id)
                .filter(item -> !item.getDeleted())
                .findAny()
                .orElse(null);

        return BaseModel;
    }

    public static void create(HttpServletRequest request,String sessionName, BaseModel BaseModel ) {
        List<BaseModel> ItemsFromSession = (List<BaseModel>) request.getSession().getAttribute(sessionName);

        if (BaseModel.getId() == 0) {
            if (ItemsFromSession.size() == 0) {
                BaseModel.setId(1);
            } else {
                BaseModel lastItem = ItemsFromSession.get(ItemsFromSession.size() - 1);

                BaseModel.setId(lastItem.getId() + 1);
            }
        }

        ItemsFromSession.add(BaseModel);
    }

    public static void update(HttpServletRequest request, String sessionName, int id, BaseModel BaseModel) {
        List<BaseModel> ItemsFromSession = all(request, sessionName);

        BaseModel BaseModel_Old = find(request, sessionName, id);
        int index = ItemsFromSession.indexOf(BaseModel_Old);

        BaseModel.setVersion(BaseModel_Old.getVersion() + 1);
        BaseModel.setUpdatedAt(LocalDateTime.now());
        BaseModel.setUpdatedBy("Anonymous");

        ItemsFromSession.set(index, BaseModel);
    }

    public static void delete(HttpServletRequest request, String sessionName, int id) {
        BaseModel BaseModel = find(request, sessionName, id);

        //Xóa cứng:
        List<BaseModel> ItemsFromSession = all(request, sessionName);
        //ItemsFromSession.remove(searchBaseModel);

        //Xóa mềm:
        BaseModel.setDeleted(true);
        //updateBaseModel(request, id, searchBaseModel);
    }
}
