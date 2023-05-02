package ru.gb.preparation.hw_5;

import java.io.Serializable;
import java.util.List;

public interface iDao<T, Id extends Serializable> {
    void persist(T entity);

    void delete(T entity);

    void update(T entity);

    T findById(Id id);

    List<T> findAll();

    void deleteAll();
}
