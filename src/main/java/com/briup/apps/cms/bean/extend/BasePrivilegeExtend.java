package com.briup.apps.cms.bean.extend;

import com.briup.apps.cms.bean.BasePrivilege;

import java.util.List;

/**
 * @program: cms_jd1908
 * @description: 权限拓展
 * @author: charles
 * @create: 2019-11-20 15:26
 **/
public class BasePrivilegeExtend extends BasePrivilege {
    private List<BasePrivilege> children;

    public List<BasePrivilege> getChildren() {
        return children;
    }

    public void setChildren(List<BasePrivilege> children) {
        this.children = children;
    }
}
