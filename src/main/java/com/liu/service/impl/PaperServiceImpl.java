package com.liu.service.impl;

import com.liu.entity.paper.TPaper;
import com.liu.mapper.PaperMapper;
import com.liu.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Auther: Administrator
 * @Date: 2019/5/31 18:42
 * @Description:
 */
@Service
public class PaperServiceImpl implements PaperService {
    @Autowired
    PaperMapper paperMapper;

    @Override
    public List<TPaper> find(){
        return paperMapper.find();
    }

    @Override
    public TPaper get(int id){
        return paperMapper.get(id);
    }

    @Override
    public void insert(TPaper paper){
        paperMapper.insert(paper);
    }

    @Override
    public void updata(TPaper paper){
        paperMapper.updata(paper);
    }

    @Override
    public void delete(int id){
        paperMapper.delete(id);
    }

    @Override
    public List<TPaper> getUserPaperById(int userId){
        return paperMapper.getUserPaperById(userId);
    }

    @Override
    public TPaper getPaperDetail(Map map){
        return paperMapper.getPaperDetail(map);
    }
}
