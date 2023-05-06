package com.educate.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.educate.dao.NewsDao;
import com.educate.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsService extends ServiceImpl<NewsDao, News> {
    @Autowired
    private NewsDao newsDao;

}
