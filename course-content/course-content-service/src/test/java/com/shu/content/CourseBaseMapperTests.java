package com.shu.content;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shu.base.model.PageParams;
import com.shu.base.model.PageResult;
import com.shu.content.mapper.CourseBaseMapper;
import com.shu.content.model.dto.QueryCourseParamsDto;
import com.shu.content.model.po.CourseBase;
import org.apache.commons.lang3.StringUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class CourseBaseMapperTests {

    @Autowired
    private CourseBaseMapper courseBaseMapper;

    @Test
    public void testCourseBaseMapper() {
        CourseBase courseBase = courseBaseMapper.selectById(1);
        Assertions.assertNotNull(courseBase);

        QueryCourseParamsDto courseParamsDto = new QueryCourseParamsDto();
        courseParamsDto.setCourseName("java");

        LambdaQueryWrapper<CourseBase> queryWrapper = new LambdaQueryWrapper<>();
        // 在 sql 中拼接 course_base.name like '%val%'
        queryWrapper.like(
                StringUtils.isNotEmpty(courseParamsDto.getCourseName()),
                CourseBase::getName,
                courseParamsDto.getCourseName());
        // 在 sql 中拼接 course_base.audit_status = ?
        queryWrapper.eq(
                StringUtils.isNotEmpty(courseParamsDto.getAuditStatus()),
                CourseBase::getAuditStatus,
                courseParamsDto.getAuditStatus());
        queryWrapper.eq(
                StringUtils.isNotEmpty(courseParamsDto.getPublishStatus()),
                CourseBase::getStatus,
                203001
        );

        PageParams pageParams = new PageParams(1L, 2L);
        Page<CourseBase> page = new Page<>(pageParams.getPageNo(), pageParams.getPageSize());
        Page<CourseBase> pageResult = courseBaseMapper.selectPage(page, queryWrapper);

        List<CourseBase> records = pageResult.getRecords();
        long total = pageResult.getTotal();
        PageResult<CourseBase> courseBasePageResult = new PageResult<>(
                records, total, pageParams.getPageNo(), pageParams.getPageSize());
    }
}
