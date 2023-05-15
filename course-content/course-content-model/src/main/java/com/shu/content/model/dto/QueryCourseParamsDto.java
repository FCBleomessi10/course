package com.shu.content.model.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class QueryCourseParamsDto {
    private String auditStatus; // 审核状态
    private String courseName;  // 课程名称
    private String publishStatus;   // 发布状态
}
