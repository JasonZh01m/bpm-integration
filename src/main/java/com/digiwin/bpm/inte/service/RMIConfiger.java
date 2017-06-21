package com.digiwin.bpm.inte.service;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.remoting.caucho.HessianProxyFactoryBean;
import org.springframework.remoting.httpinvoker.HttpInvokerProxyFactoryBean;

/**
 * Created by JasonZh on 2017/6/10.
 */
@Configuration
public class RMIConfiger {

    /*@Bean()
    public HessianProxyFactoryBean rmiService() {
        HessianProxyFactoryBean proxy = new HessianProxyFactoryBean();
        proxy.setServiceUrl("http://localhost:8081/bpm-dms/hessian");
        proxy.setServiceInterface(RMIService.class);
        return proxy;
    }
*/
    /*@Bean
    public HttpInvokerProxyFactoryBean rmiService() {
        HttpInvokerProxyFactoryBean proxy = new HttpInvokerProxyFactoryBean();
        proxy.setServiceInterface(RMIService.class);
        proxy.setServiceUrl("http://localhost:8081/bpm-dms/httpinvoker.service");
        return proxy;
    }*/



}
