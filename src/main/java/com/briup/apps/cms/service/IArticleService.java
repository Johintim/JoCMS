package com.briup.apps.cms.service;

import com.briup.apps.cms.bean.Article;
import com.briup.apps.cms.bean.extend.ArticleExtend;
import com.briup.apps.cms.utils.CustomerException;

import java.util.List;
/** 
 * @Description:  
 * @Param:  
 * @return:  
 * @Author: charles 
 * @Date: 2019-11-12 
 */ 
public interface IArticleService {
    /** 
     * @Description:
     * @Param: [] 
     * @return: java.util.List<com.briup.apps.cms.bean.Article> 
     * @Author: charles 
     * @Date: 2019-11-12 
     */ 
    List<Article> findAll();

    List<ArticleExtend> cascadeFindAll();

    ArticleExtend findById(long id);

    void saveOrUpdate(Article article) throws CustomerException;
}
