package com.vhans.bus.chat.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.vhans.bus.chat.domain.vo.GroupUserIntroVO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 群组对象 c_group
 *
 * @author vhans
 * @date 2023-05-21
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(description = "群组对象")
@TableName("c_group")
public class Group {

    /**
     * 编号
     */
    @TableId(type = IdType.AUTO)
    @ApiModelProperty(value = "编号")
    private Integer id;

    /**
     * 群图片
     */
    @ApiModelProperty(value = "群图片")
    private String img;

    /**
     * 群名称
     */
    @NotBlank(message = "群名称不能为空")
    @ApiModelProperty(value = "群名称")
    private String name;

    /**
     * 群主id
     */
    @ApiModelProperty(value = "群主id")
    private Integer masterId;

    /**
     * 是否解散
     */
    @ApiModelProperty(value = "是否解散")
    private Integer isDelete;

    /**
     * 群描述
     */
    @NotBlank(message = "群图片不能为空")
    @ApiModelProperty(value = "群描述")
    private String remark;

    /**
     * 添加时间
     */
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "添加时间")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.UPDATE)
    @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;

    /* 除数据表的额外字段 */
    /**
     * 群用户数
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "群用户数")
    private Integer userNumber;

    /**
     * 群用户列表
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "群用户列表")
    private List<GroupUserIntroVO> userList;

    /* 定义需要查询的字段对象 */
    @Data
    public static class Query {
        /**
         * 群名称
         */
        @ApiModelProperty(value = "群名称")
        private String name;

        /**
         * 是否解散
         */
        @ApiModelProperty(value = "是否解散")
        private Integer isDelete;
    }

}
