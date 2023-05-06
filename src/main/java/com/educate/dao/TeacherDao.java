package com.educate.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.educate.entity.Teacher;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TeacherDao extends BaseMapper<Teacher> {
}
