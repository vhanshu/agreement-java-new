package com.vhans.bus.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * 文件下拉树
 * @author vhans
 */
@Data
@ApiModel(description = "文件下拉树")
public class FileTree {
    /**
     * 文件id
     */
    @ApiModelProperty(value = "文件id")
    private Integer id;

    /**
     * 文件名
     */
    @JsonIgnore
    @ApiModelProperty(value = "父文件id")
    private String name;

    /**
     * 文件url
     */
    @ApiModelProperty(value = "文件url")
    private String url;

    /**
     * 子文件树
     */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    @ApiModelProperty(value = "子文件树")
    private List<FileTree> children;
}
