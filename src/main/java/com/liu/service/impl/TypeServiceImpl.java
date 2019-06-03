package com.liu.service.impl;

import com.liu.entity.question.TType;
import com.liu.mapper.TypeMapper;
import com.liu.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Auther: Administrator
 * @Date: 2019/5/31 16:58
 * @Description:
 */
@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    TypeMapper typeMapper;

    @Override
    public TType getType(int id){
        return typeMapper.getType(id);
    }
}
