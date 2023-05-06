package com.educate.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.educate.entity.News;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface NewsDao extends BaseMapper<News> {
}
