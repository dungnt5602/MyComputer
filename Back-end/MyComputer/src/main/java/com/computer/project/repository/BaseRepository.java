package com.computer.project.repository;

import com.computer.project.model.BaseModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import java.io.Serializable;

@NoRepositoryBean
public interface BaseRepository <T extends BaseModel, ID extends Serializable>
extends JpaRepository<T, ID> {
}
