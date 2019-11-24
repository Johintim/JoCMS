package com.briup.apps.cms.utils;

/**
 * @program: cms_jd1911
 * @description: 未授权异常
 * @author: charles
 * @create: 2019-11-19 18:40
 **/

public class UnAuthorizedException extends CustomerException {
    public UnAuthorizedException() {
    }

    public UnAuthorizedException(String message) {
        super(message);
    }

    public UnAuthorizedException(String message, Throwable cause) {
        super(message, cause);
    }

    public UnAuthorizedException(Throwable cause) {
        super(cause);
    }

    public UnAuthorizedException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
