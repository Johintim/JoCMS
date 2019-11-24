package com.briup.apps.cms.web.controller;

import com.briup.apps.cms.bean.Article;
import com.briup.apps.cms.bean.extend.ArticleExtend;
import com.briup.apps.cms.service.IArticleService;
import com.briup.apps.cms.utils.ExcelUtils;
import com.briup.apps.cms.utils.Message;
import com.briup.apps.cms.utils.MessageUtil;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: cms_jd1911
 * @description: 文章控制器类
 * @author: charles
 * @create: 2019-11-12 10:22
 **/
@Validated
@RestController
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private IArticleService articleService;

    @ApiOperation(value="将文章导入到Excel中",notes="注意！测试的时候请将地址粘贴到浏览器地址栏测试",produces="application/octet-stream")
    @GetMapping("download")
    public void download(HttpServletResponse response) throws Exception{
        // 查询出所有文章信息
        String excelName = "article_list";
        String[] headList = new String[]{"编号","标题","内容"};
        String[] fieldList = new String[]{"id","title","content"};
        List<Map<String, Object>> dataList = new ArrayList<>();
        List<Article> list =articleService.findAll();
        for(Article a : list){
            Map<String, Object> map = new HashMap<>();
            map.put("id",a.getId());
            map.put("title",a.getTitle());
            map.put("content",a.getContent());
            dataList.add(map);
        }

        //调用工具类导出excel
        ExcelUtils.createExcel(response,excelName,headList,fieldList,dataList);

    }

    @ApiOperation(value = "查询所有文章")
    @GetMapping("findAll")
    public Message findAll(){
        List<Article> list =articleService.findAll();
        return MessageUtil.success(list);
    }

    @ApiOperation(value = "级联查询文章",notes = "级联所属栏目，作者")
    @GetMapping("cascadeFindAll")
    public Message cascadeFindAll(){
        List<ArticleExtend> list = articleService.cascadeFindAll();
        return MessageUtil.success(list);
    }

    @ApiOperation(value = "通过id查询")
    @ApiImplicitParams(
            @ApiImplicitParam(name = "id",value = "主键",paramType = "query")
    )
    @GetMapping("findById")
    public Message findById(long id){
        ArticleExtend articleExtend = articleService.findById(id);
        return MessageUtil.success(articleExtend);
    }

    @ApiOperation(value = "保存或更新文章信息",notes = "如果参数中包含id后端认为是更新操作，如果参数中不包含id认为是插入操作")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "编号",paramType = "form",required = false),
            @ApiImplicitParam(name = "title", value = "标题",paramType = "form",required = true),
            @ApiImplicitParam(name = "content", value = "内容",paramType = "form",required = true),
            @ApiImplicitParam(name = "source", value = "源内容",paramType = "form",required = false),
            @ApiImplicitParam(name = "categoryId", value = "所属栏目id",paramType = "form",required = true),
            @ApiImplicitParam(name = "authorId", value = "所属作者id",paramType = "form",required = false)
    })
    @PostMapping("saveOrUpdate")
    public Message saveOrUpdate(
            Long id,
            @NotNull String title,
            @NotNull String content,
            String source,
            @NotNull long categoryId,
            Long authorId){
        Article article = new Article();
        article.setId(id);
        article.setTitle(title);
        article.setContent(content);
        article.setSource(source);
        article.setCategoryId(categoryId);
        article.setAuthorId(authorId);
        articleService.saveOrUpdate(article);
        return MessageUtil.success("更新成功");
    }

}
