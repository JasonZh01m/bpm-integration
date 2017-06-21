package com.digiwin.bpm.inte.service;

import com.digiwin.bpm.dms.service.common.User;

/**
 * Created by JasonZh on 2017/6/10.
 */
public interface RMIService {

    void helloWorld();

    User getUser(String userId);

}
