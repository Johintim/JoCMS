package com.briup.apps.cms.service.impl;

import com.briup.apps.cms.bean.Category;
import com.briup.apps.cms.bean.CategoryExample;
import com.briup.apps.cms.dao.CategoryMapper;
import com.briup.apps.cms.service.ICategoryService;
import com.briup.apps.cms.utils.CustomerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: cms_jd1911
 * @description: 栏目业务实现类
 * @author: charles
 * @create: 2019-11-14 15:04
 **/
@Service
public class CategoryServiceImpl implements ICategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public List<Category> findAll() {
        return categoryMapper.selectByExample(new CategoryExample());
    }

    @Override
    public void saveOrUpdate(Category category) throws CustomerException {
        if(category.getId() != null){
            categoryMapper.updateByPrimaryKey(category);
        } else {
            //判断是否重名
            CategoryExample example = new CategoryExample();
            example.createCriteria().andNameEqualTo(category.getName());
            List<Category> list = categoryMapper.selectByExample(example);
            if(list.size()>0){
                throw new CustomerException("该栏目已经存在");
            }
            categoryMapper.insert(category);
        }
    }

    @Override
    @Transactional
    public void deleteById(long id) throws CustomerException {
        Category category = categoryMapper.selectByPrimaryKey(id);
        if(category == null){
            throw new CustomerException("要删除的栏目不存在");
        }
        categoryMapper.deleteByPrimaryKey(id);
    }

    @Override
    @Transactional
    public void batchDelete(long[] ids) throws CustomerException {
        for(long id : ids){
            this.deleteById(id);
        }
    }
}
