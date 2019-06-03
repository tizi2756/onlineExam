package com.liu.mapper;

import com.liu.entity.paper.TPaper;

import java.util.List;
import java.util.Map;

/**
 * @Auther: Administrator
 * @Date: 2019/5/31 18:35
 * @Description:
 */
public interface PaperMapper {
    void insert (TPaper paper);
    void updata(TPaper paper);
    List<TPaper> find();
    TPaper get(int id);
    void delete(int id);
    List<TPaper> getUserPaperById(int userId);
    TPaper getPaperDetail(Map map);
}
