package com.educate.config;


import com.educate.service.AdminService;
import com.educate.service.NewsService;
import com.educate.service.StudentService;
import com.educate.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.annotation.Resource;
import java.util.Map;

/**
 * redis工具类，封装了redis基本数据的key
 */

@Component
public class RedisData {
    @Autowired
    private  TeacherService teacherService;

    @Resource
    RedisTemplate<String, Object> redisTemplate;

    public final static String courseKey = "dgt.courseKey";
    public final static String teacherKey = "dgt.teacherKey";
    public final static String studentKey = "dgt.studentKey";
    public final static String studentClassKey = "dgt.studentClassKey";
    public final static String tClassKey = "dgt.tClassKey";
    public final static String termKey = "dgt.termKey";

    /**
     * 初始化时在redis中保存所有表信息
     */
    @PostConstruct
    private void setRedisData() {
        HashOperations<String, Object, Object> opsForHash = redisTemplate.opsForHash();
        opsForHash.putAll(teacherKey, teacherService.getTeacherMap());
    }

    /**
     * 清除redis中的所有信息
     */
    @PreDestroy
    private void clearRedisData() {
        redisTemplate.delete(courseKey);
        redisTemplate.delete(teacherKey);
        redisTemplate.delete(studentKey);
        redisTemplate.delete(studentClassKey);
        redisTemplate.delete(tClassKey);
        redisTemplate.delete(termKey);
    }

    /**
     * 重写getopsforhash方法
     * @param clazz
     * @param <T>
     * @return
     */
    public <T> HashOperations<String,String,T> getOpsForHash(Class<T> clazz){
        return redisTemplate.opsForHash();
    }

    public <T> HashOperations<String,String,T> getOpsforHash(){
        return redisTemplate.opsForHash();
    }

    /**
     * 重写redis中的map保存泛型
     * @param key
     * @param clazz
     * @param <T>
     * @return
     */
    public <T> Map<String,T> getEntries(String key,Class<T> clazz){
        return getOpsForHash(clazz).entries(key);
    }

}
