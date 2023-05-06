package com.educate.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.educate.entity.Student;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface StudentDao extends BaseMapper<Student> {
}
