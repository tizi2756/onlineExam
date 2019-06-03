package com.liu.service;

import com.liu.entity.paper.TPaper;

import java.util.List;
import java.util.Map;

/**
 * @Auther: Administrator
 * @Date: 2019/5/31 21:47
 * @Description:
 */
public interface PaperService {
    List<TPaper> find();

    TPaper get(int id);

    void insert(TPaper paper);

    void updata(TPaper paper);

    void delete(int id);

    List<TPaper> getUserPaperById(int userId);

    TPaper getPaperDetail(Map map);
}
