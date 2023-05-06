package com.educate.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.educate.entity.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AdminDao extends BaseMapper<Admin> {
}
