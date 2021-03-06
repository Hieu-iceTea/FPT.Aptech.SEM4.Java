package Hieu_iceTea.API.service.base;


import Hieu_iceTea.API.model.BaseModel;

import java.io.Serializable;
import java.util.List;

public interface BaseService<T extends BaseModel, ID extends Serializable> {

    List<T> findAll();

    List<T> findAllByOrderByIdDesc();

    T findById(ID id);

    T save(T item);

    List<T> saveAll(List<T> items);

    void deleteById(ID id);

}
