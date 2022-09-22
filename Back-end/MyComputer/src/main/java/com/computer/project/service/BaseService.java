package com.computer.project.service;

import com.computer.project.model.BaseModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.io.Serializable;

public interface BaseService <T extends BaseModel, ID extends Serializable>{
    public abstract T save(T entity);
    public abstract Page<T> findAll(Pageable pageable);
    public abstract T findById(ID entityId);
    public abstract T updateById(T entity, ID entityId);
    public abstract void deleteById(ID entityId);
}
