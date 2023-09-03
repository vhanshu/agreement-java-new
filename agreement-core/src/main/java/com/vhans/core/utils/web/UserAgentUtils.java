package com.vhans.core.utils.web;


import nl.basjes.parse.useragent.UserAgent;
import nl.basjes.parse.useragent.UserAgentAnalyzer;

import java.util.HashMap;
import java.util.Map;

/**
 * 浏览器处理User-Agent的工具
 *
 * @author vhans
 */

public class UserAgentUtils {

    /**
     * 用于解析 User-Agent 字符串的工具类。它可以将 User-Agent 字符串解析成多个字段，包括操作系统、浏览器、设备类型、设备品牌等
     */
    private static final UserAgentAnalyzer USER_AGENT_ANALYZER;

    static {
        USER_AGENT_ANALYZER = UserAgentAnalyzer
                .newBuilder()
                .hideMatcherLoadStats()
                .withField(UserAgent.OPERATING_SYSTEM_NAME_VERSION_MAJOR)
                .withField(UserAgent.AGENT_NAME_VERSION)
                .build();
    }

    /**
     * 从User-Agent解析客户端操作系统和浏览器版本
     */
    public static Map<String, String> parseOsAndBrowser(String userAgent) {
        // 调用 UserAgentAnalyzer 对象的 parse() 方法，将 User-Agent 字符串作为参数传入，得到解析后的结果
        UserAgent agent = USER_AGENT_ANALYZER.parse(userAgent);
        // 操作系统的名称和版本号
        String os = agent.getValue(UserAgent.OPERATING_SYSTEM_NAME_VERSION_MAJOR);
        // 浏览器的名称和版本号
        String browser = agent.getValue(UserAgent.AGENT_NAME_VERSION);
        Map<String, String> map = new HashMap<>(2);
        map.put("os", os);
        map.put("browser", browser);
        return map;
    }

}