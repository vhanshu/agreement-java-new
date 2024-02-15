package com.vhans.bus.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vhans.bus.system.domain.FileRecord;
import com.vhans.bus.system.domain.vo.FileTree;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 【文件】Mapper接口
 *
 * @author vhans
 * @date 2023-04-10
 */
@Repository
public interface FileRecordMapper extends BaseMapper<FileRecord> {
    /**
     * 查询文件下拉树
     *
     * @param basePath 文件路径
     * @return 文件下拉树
     */
    List<FileTree> selectFileTree(@Param("basePath") String basePath);

    /**
     * 查询所有文件下拉树
     *
     * @return 文件下拉树
     */
    List<FileTree> selectAllFileTree();
}
