package com.vhans.bus.log.mapper;

import cn.hutool.core.date.DateTime;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.log.domain.VisitLog;
import com.vhans.bus.log.domain.vo.UserViewVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【访问日志】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface VisitLogMapper extends BaseMapper<VisitLog> {

    /**
     * 获取用户访问结果
     *
     * @param startTime 开始时间
     * @param endTime   结束时间
     * @return 用户访问结果
     */
    List<UserViewVO> selectUserViewList(@Param("startTime") DateTime startTime, @Param("endTime") DateTime endTime);

    /**
     * 清除一周前的访问日志
     *
     * @param endTime 结束时间
     */
    void deleteVisitLog(@Param("endTime") DateTime endTime);
}
